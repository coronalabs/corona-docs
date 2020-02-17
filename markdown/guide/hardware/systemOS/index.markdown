# System/OS Libraries

This guide summarizes the Corona [system][api.library.system] and [os][api.library.os] libraries. Collectively, the following calls are used to gather system information and control system functions&nbsp;— get device information, enable multitouch, control the idle time, accelerometer, GPS,&nbsp;etc.&nbsp;— and deal with system time, date, and other <nobr>OS-related</nobr> information.

<div class="guides-toc">

* [System Library](#systemlib)
* [OS Library](#oslib)

</div>


<a id="systemlib"></a>

## System Library

<div class="inner-table">

API																					Description
----------------------------------------------------------------------------------	------------------
[system.getInfo()][api.library.system.getInfo]										Returns information about the system on which the application is running.
[system.openURL()][api.library.system.openURL]										Opens a web page in the device browser, creates an email, calls a phone number, or opens a file.
[system.canOpenURL()][api.library.system.canOpenURL]								Returns a boolean value confirming whether a URL can be opened via [system.openURL()][api.library.system.openURL].
[system.pathForFile()][api.library.system.pathForFile]								Generates an absolute path using <nobr>system-defined</nobr> directories as the base. See [Reading and Writing Files][guide.data.readWriteFiles] for more information.
[system.CachesDirectory][api.library.system.CachesDirectory]						Used with [system.pathForFile()][api.library.system.pathForFile] to create a path for storing and retrieving files that are available across application launches.
[system.DocumentsDirectory][api.library.system.DocumentsDirectory]					Used with [system.pathForFile()][api.library.system.pathForFile] to create a path for storing and retrieving files that need to persist between application sessions. 
[system.ResourceDirectory][api.library.system.ResourceDirectory]					Used with [system.pathForFile()][api.library.system.pathForFile] to create a path for retrieving files where all the application assets exist.
[system.TemporaryDirectory][api.library.system.TemporaryDirectory]					Used with [system.pathForFile()][api.library.system.pathForFile] to create a path for storing and retrieving files that only need to persist while the application is running.
[system.getPreference()][api.library.system.getPreference]							Returns a system preference value (`ui` or `locale`) as a string.
[system.getInputDevices()][api.library.system.getInputDevices]						Returns an array of [InputDevice][api.type.InputDevice] devices that are currently connected to the system, such as a touchscreen, keyboard, mouse, joystick, etc.
[system.getTimer()][api.library.system.getTimer]									Returns the time in milliseconds since application launch.
[system.orientation][api.library.system.orientation]								Returns a string identifying the orientation of the device.
[system.setTapDelay()][api.library.system.setTapDelay]								Sets the delay time between when a tap is detected and when the tap event is delivered.
[system.activate()][api.library.system.activate]									Activates a system-level feature such as multitouch.
[system.deactivate()][api.library.system.deactivate]								Deactivates a system-level feature activated by `system.activate()`.
[system.scheduleNotification()][api.library.system.scheduleNotification]			Schedules a local notification event to be delivered at a future time.
[system.cancelNotification()][api.library.system.cancelNotification]				Removes the specified notification from the scheduler, status bar, or notification center.
[system.setIdleTimer()][api.library.system.setIdleTimer]							Controls whether the system idle timer is enabled (automatic screen dim and&nbsp;sleep).
[system.getIdleTimer()][api.library.system.getIdleTimer]							Determines whether the system idle timer is enabled.
[system.setLocationAccuracy()][api.library.system.setLocationAccuracy]				Sets the desired accuracy of [location&nbsp;(GPS)][api.event.location] events to distance in meters.
[system.setLocationThreshold()][api.library.system.setLocationThreshold]			Sets the distance in meters between each [location&nbsp;(GPS)][api.event.location] event.
[system.setAccelerometerInterval()][api.library.system.setAccelerometerInterval]	Sets the frequency of [accelerometer][api.event.accelerometer] events.
[system.setGyroscopeInterval()][api.library.system.setGyroscopeInterval]			Sets the frequency of [gyroscope][api.event.gyroscope] events in Hertz.
[system.hasEventSource()][api.library.system.hasEventSource]						Returns whether the system delivers events corresponding to `eventName`.
[system.vibrate()][api.library.system.vibrate]										Vibrates the phone. On the Corona Simulator, this triggers a system beep.
----------------------------------------------------------------------------------	------------------

</div>



<a id="oslib"></a>

## OS Library

<div class="inner-table">

API																					Description
----------------------------------------------------------------------------------	------------------
[os.clock()][api.library.os.clock]													Returns an approximation of the amount in seconds of CPU time used by the program.
[os.date()][api.library.os.date]													Returns a formatted string or a table containing date and time.
[os.time()][api.library.os.time]													Returns the current time in seconds from 1970, or the date and time specified by a table.
[os.difftime()][api.library.os.difftime]											Returns the number of seconds from time "t1" to time "t2".
[os.execute()][api.library.os.execute]												Passes a string to the OS for execution and returns a system-dependent status code.
[os.exit()][api.library.os.exit]													Calls the C function `exit()` to terminate the host program.
[os.remove()][api.library.os.remove]												Deletes a file or directory in the documents or temporary directory.
[os.rename()][api.library.os.rename]												Renames a file or directory in the documents or temporary directory.
----------------------------------------------------------------------------------	------------------

</div>
