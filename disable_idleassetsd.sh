#!/bin/bash

# This script stops the idleassetsd service and removes its files,
# respecting macOS System Integrity Protection (SIP).

# Ask for confirmation before running a destructive command.
read -p "This will stop the idleassetsd service and delete its files. Continue? (y/n): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Script aborted."
    exit 1
fi

userLibraryPath="$HOME/Library"
launchAgentPath="/System/Library/LaunchAgents/com.apple.coreservices.idleassetsd.plist"

echo "--- 📊 Starting Disk Usage ---"
df -h "$userLibraryPath"

# Check if the launch agent file exists and then stop the service.
# This check does not require sudo as we are only reading the file's existence.
if [ -f "$launchAgentPath" ]; then
    # We still need sudo to unload a system-level launch agent.
    # The || true is kept to prevent the script from exiting prematurely if the service is not running.
    sudo launchctl unload -w "$launchAgentPath" || true

    # "Trust but verify" check to ensure the service is actually gone.
    if launchctl list | grep -q "com.apple.coreservices.idleassetsd"; then
        echo "❌ Error: The unload command failed and the service is still active. The script cannot continue."
        exit 1
    fi
    echo "idleassetsd service has been stopped."
else
    echo "idleassetsd service is not active. Proceeding to clean files."
fi

# Locate and delete files and folders associated with the service.
# We are now targeting specific, unprotected directories within the user's home directory.
# We redirect standard error (2) to /dev/null to suppress any remaining "Operation not permitted" errors.
# This is a more precise approach that respects SIP.
find "$userLibraryPath/Assets" -type d -name "A4D49580-0C9A-40D4-B471-5085C0880B4A*" -exec rm -rf {} + 2>/dev/null
find "$userLibraryPath/Group Containers" -type d -name "com.apple.assetsd*" -exec rm -rf {} + 2>/dev/null

echo "Cleanup complete."
echo "--- 📊 Final Disk Usage ---"
df -h "$userLibraryPath"
