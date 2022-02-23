# Steamworks — Overlay Troubleshooting

This guide documents how to troubleshoot Steam <nobr>in-app</nobr> overlay display issues.

<div class="guides-toc">

* [Steam Client Settings](#clientsettings)
* [Mac System Preferences](#macprefs)
* [Mac App Testing](#testing)

</div>


<a id="clientsettings"></a>

## Steam Client Settings

If the end user has disabled overlays within the Steam client's <nobr>__In-Game__</nobr> settings/preferences window, Steam overlays and popup notifications will __not__ appear within the application window for any <nobr>Steam-based game</nobr>. This setting is controlled by the end user and is normally enabled by default. If overlays are not appearing as expected, this should be the first thing to check, following these steps:

1. Display the Steam client window.
2. On Windows, click the <nobr>__Steam__ &rarr; __Settings__</nobr> menu item. On Mac, click the <nobr>__Steam__ &rarr; __Preferences__</nobr> menu item.
3. Select __In-Game__ in the Settings/Preferences window's left sidebar.
4. Check the <nobr>__Enable the Steam Overlay while in-game__</nobr> checkbox.
5. Click the __OK__ button.

<div style="width:90%;">

![][images.docs.plugin-screenshot-steamworks-in-game-settings]

</div>




<a id="macprefs"></a>

## Mac System Preferences

On Mac, Steam cannot display overlays and popup notifications within an application window until the end user has given the Steam client permission in the <nobr>__System Preferences__</nobr> window. This can be done as follows:

1. Open the <nobr>__System Preferences__</nobr> window.
2. Select <nobr>__Security & Privacy__</nobr>.
3. Click on the __Privacy__ tab.
4. Select __Accessibility__ in the list on the left.
5. Click the \[__+__\] button.
6. Select the __Steam__ application.
7. Make sure that the __Steam.app__ item is checked in the __Accessibility__ list.
8. Restart the Steam client application.

<div style="width:60%;">

![][images.docs.plugin-screenshot-steamworks-mac-system-prefs-accessibility]

</div>




<a id="testing"></a>

## Mac App Testing

On Mac, Steam can only show overlays and popup notifications in applications that have been launched from the Steam client. Applications purchased, downloaded, and installed by Steam are normally launched in this fashion.

In order for developers to test Steam overlay support, the application using the Steamworks plugin must be added to the Steam client as a <nobr>__Non-Steam Game__</nobr> and then launched from the Steam client. For example, to test Steam overlay support within the Corona Simulator, the Corona&nbsp;Simulator application must be added and launched from the Steam client. The same must be done with Mac applications built from the Corona&nbsp;Simulator as well.

1. Display the Steam client window.
2. Click the __LIBRARY__ item at the top of the Window.
3. Select __MAC__ from the drop-down menu.
4. Click the <nobr>__ADD A GAME...__</nobr> button in the <nobr>bottom-left</nobr> corner.
5. Select <nobr>__Add a Non-Steam Game...__</nobr> from the popup menu.

<div class="code-indent" style="width:90%;">

![][images.docs.plugin-screenshot-steamworks-client-add-non-steam-game]

</div>

6. Browse for the app in the <nobr>__Add a Game__</nobr> window.
7. Check the app and click the <nobr>__ADD SELECTED PROGRAMS__</nobr> button.

<div class="code-indent" style="width:90%;">

![][images.docs.plugin-screenshot-steamworks-client-browse-for-app]

</div>

8. Now that the selected application has been added to the Steam client's library, you can launch it from the Steam client by clicking the __PLAY__ button. The application will then be able to display Steam overlays and popup notifications within the application window, but only if <nobr>__In-Game__</nobr> overlays are enabled by the user within the Steam client as documented [above](#clientsettings).

<div class="code-indent" style="width:90%;">

![][images.docs.plugin-screenshot-steamworks-client-play-non-steam-game]

</div>
