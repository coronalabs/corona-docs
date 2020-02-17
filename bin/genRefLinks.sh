#!/bin/bash

#
# This script is responsible for parsing relative links in a given markdown file.
#
# Arguments:
#	$1  : Path to the markdown file being processed.
#	$2+ : Additional files to parse. Links are added to the main file.
#
# Assumptions:
#	* Relative links are in the format [text][foo.bar].
#	* The link's destination is <markdown root>/foo/bar/index.html if it exists,
#	  otherwise <markdown root>/foo/bar.html.
#	* The markdown files provided are within a markdown folder, which is visible to
#	  the path provided. E.g. ../../tmp/markdown/foo/bar/index.markdown
#

readonly TARGET_FILE=$1

# The optional second argument is a target file mask. If provided, it will be used
# when calculating relative paths instead.
targetFileMask=$2
if [[ -z "${targetFileMask}" ]]; then
	targetFileMask="${TARGET_FILE}"
fi

# Ensure that we have pcregrep installed.
PCREGREP=$(which pcregrep)
if [[ -z "${PCREGREP}" ]]; then
	echo "\033[0;31mERROR: pcregrep is not installed. Install using: brew install pcre\033[0m"
	exit 1
fi

# Make sure the file actually exists.
if [[ ! -f "${TARGET_FILE}" ]]; then
	echo "\033[0;31mERROR: Input file does not exist at '${TARGET_FILE}'\033[0m"
	exit 2
fi

# Define the relative directory change between the target file and the markdown root
# path. E.g. ../tmp/markdown/api/library/package/index.markdown -> ../../../
readonly RELATIVE_PREFIX=$(echo "${targetFileMask}" | sed -e 's#^.*/markdown/##g' | tr -dc "/" | sed -e 's#/#../#g')

# We also need the markdown root path itself to determine the actual link destination.
readonly MARKDOWN_ROOT="$(cd "$(dirname "${targetFileMask}")/${RELATIVE_PREFIX}" && pwd)/"

# Ensure that our new link maps have a blank line between previous content and them.
# This prevents things like lists from conflicting with the links.
if [[ -n "$(tail -c 2 "${TARGET_FILE}")" ]]; then
	printf "\n\n" >> "${TARGET_FILE}"
fi

# Use pcregrep, not grep, which on OS X doesn't support -P. Parse out everything
# that looks like a link. Trim out cruft, and make sure we don't have duplicates.
pcregrep -o '\]\[.*?\]' "${TARGET_FILE}" | tr -d '[]' | sort | uniq | while read linkToken; do
	# Do not add the link if it already exists in the file.
	if grep -qio "^\[${linkToken}\]:" "${TARGET_FILE}"; then
		continue
	fi

	# Split the link out to get any anchor destinations.
	anchor="$(echo "${linkToken}" | cut -s -d '#' -f 2)"
	if [[ -z "${anchor}" ]]; then
		theLink="${linkToken//.//}"
	else
		theLink="$(echo "${linkToken//.//}" | cut -d '#' -f 1)"
		anchor="#${anchor}"
	fi
	
	# Links are ambiguous; foo.bar can map to ./foo/bar.html or ./foo/bar/index.html
	if [[ -f "${MARKDOWN_ROOT}${theLink}.markdown" ]]; then
		echo "[${linkToken}]: ${RELATIVE_PREFIX}${theLink}.html${anchor}" >> "${TARGET_FILE}"
	elif [[ -f "${MARKDOWN_ROOT}${theLink}/index.markdown" ]]; then
		echo "[${linkToken}]: ${RELATIVE_PREFIX}${theLink}/index.html${anchor}" >> "${TARGET_FILE}"
	else
		# Special handling for non-links. We need to check for image assets first before we can throw an error.
		asset="$(find "$(dirname "${MARKDOWN_ROOT}${theLink})")" -maxdepth 1 -name "$(basename "${theLink}").*" 2>/dev/null)"
		if [[ -n "${asset}" ]]; then
			extension="$(echo "${asset}" | rev | cut -d '.' -f 1 | rev)"
			echo "[${linkToken}]: ${RELATIVE_PREFIX}${theLink}.${extension}" >> "${TARGET_FILE}"
		else
			echo -e "\033[0;33mWARNING: '${TARGET_FILE}' - Could not map [${linkToken}] to a valid destination.\033[0m"
		fi
	fi
done
