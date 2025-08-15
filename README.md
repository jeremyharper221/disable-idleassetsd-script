# Disable and Clean Idleassetsd Script
This guide will walk you through a simple process to fix a problem on macOS where a background service called `idleassetsd` can download large video files that take up a lot of disk space. This script will permanently stop that service and safely remove any downloaded files.

## What This Script Does
* Permanently stops the `idleassetsd` background service so it can't download files again.
* Deletes any large video files that the service has already downloaded.
* Confirms that the files are gone.
* Shows a summary of your disk space at the end so you can see how much space was freed up.

## How to Use
1.  **Save the Script:** Copy all of the code from the document in the editor and paste it into a new file. You can name the file something like `disable-idleassetsd.sh`.
2.  **Open Terminal:** Open the Terminal application on your Mac. You can find it by searching for "Terminal" with Spotlight (`Command + Space`).
3.  **Go to the Right Folder:** In the Terminal, type `cd` followed by a space and the path to the folder where you saved the file. For example, if you saved the file to your desktop, you would type: `cd ~/Desktop`.
4.  **Give it Permission to Run:** Type the following command and press `Enter`. This tells your computer that this file is a script that can be run.

    `chmod +x disable-idleassetsd.sh`

5.  **Run the Script:** Type the final command below and press `Enter`. The script needs administrator privileges to work, so you will be prompted to enter your password.

    `sudo ./disable-idleassetsd.sh`

## What to Expect
* The script will provide a step-by-step summary of what it is doing.
* It will ask for your confirmation before deleting the files.
* At the very end, it will tell you that the process is complete and display a summary of your disk space.
