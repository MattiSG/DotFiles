#!/usr/bin/env osascript

on run argv
	tell application "System Events"
		if application process "Finder" exists then
			if name of (first application process whose frontmost is true) is not "Terminal" then
				set notifTitle to item 1 of argv
				set notifBody to ""
				set exitCode to item 2 of argv

				if exitCode is not "0" then
					set notifBody to "Failed with exit code " & exitCode
				else
					set notifTitle to notifTitle & " succeeded"
				end if
				display notification notifBody with title notifTitle
			end if
		end if
	end tell
end run
