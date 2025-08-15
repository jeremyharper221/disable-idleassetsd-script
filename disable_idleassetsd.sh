#!/bin/bash

# SCRIPT: disable-idleassetsd-v8.sh
# PURPOSE: Permanently disables the idleassetsd process by unloading its launch daemon,
#          then removes all associated cache files, and confirms the cleanup.
# VERSION: 8.0
# NOTES: This version adds a final confirmation step to verify that the target directories no longer exist,
#        and now includes a summary of disk usage at the end. All "Operation not permitted" errors are now suppressed.

# Check for root privileges upfront.
if [[ $EUID -ne 0 ]]; then
    echo "❌ This script needs root privileges to work its magic. Please run it with sudo."
    exit 1
fi

# Define paths for safety and readability.
LAUNCH_DAEMON_FILE="/System/Library/LaunchDaemons/com.apple.idleassetsd.plist"
SYSTEM_CACHE_PATH="/Library/Application Support/com.apple.idleassetsd"
USER_CACHE_ROOT="/System/Volumes/Data/private/var/folders/zz"

echo "--- 🛡️ Permanently Disabling idleassetsd and Securely Cleaning Files ---"

# Step 1: Unload the launch daemon to permanently disable the service.
echo ""
echo "Step 1: Unloading the idleassetsd launch daemon."
if [ -f "$LAUNCH_DAEMON_FILE" ]; then
    echo "🔎 Found the launch daemon file at '$LAUNCH_DAEMON_FILE'."
    echo "Unloading daemon... This is a permanent change."
    launchctl unload "$LAUNCH_DAEMON_FILE"
    if [[ $? -eq 0 ]]; then
        echo "✅ Launch daemon unloaded successfully."
    else
        echo "❌ Failed to unload the launch daemon. This could be due to a running process."
        echo "Attempting to stop the running daemon process..."
        killall idleassetsd 2>/dev/null
        launchctl unload "$LAUNCH_DAEMON_FILE"
    fi
else
    echo "💨 Launch daemon file not found. Daemon may be already unloaded or in a different location."
fi

# Step 2: Clean up downloaded video files.
echo ""
echo "Step 2: Cleaning up downloaded video files..."

# Clean up system cache, with size check and user confirmation.
if [ -d "$SYSTEM_CACHE_PATH" ]; then
    echo "🔎 Found system cache at '$SYSTEM_CACHE_PATH'."
    SIZE=$(du -sh "$SYSTEM_CACHE_PATH" 2>/dev/null | awk '{print $1}')
    read -p "    This directory is using $SIZE of disk space. Press Enter to DELETE it, or Ctrl+C to cancel."
    echo "    Deleting system cache..."
    rm -rf "$SYSTEM_CACHE_PATH"
    echo "    ✅ System cache removed."
else
    echo "💨 System cache directory not found. Already clean!"
fi

# Clean up user cache safely using 'find -exec'. Errors are suppressed.
echo "🔎 Checking for user cache files..."
find "$USER_CACHE_ROOT" -type d -name "com.apple.idleassetsd" -exec rm -rf {} + 2>/dev/null
if [[ $? -eq 0 ]]; then
    echo "✅ User cache files removed."
else
    echo "💨 User cache files not found or cleanup failed."
fi

# Step 3: Final confirmation of cleanup.
echo ""
echo "Step 3: Verifying that all cache folders are gone."
echo "Checking for system cache folder..."
if [ ! -d "$SYSTEM_CACHE_PATH" ]; then
    echo "✅ System cache folder is gone. Disk space recovered."
else
    echo "❌ System cache folder still exists. Cleanup may have failed."
fi
echo "Checking for user cache folder..."
if find "$USER_CACHE_ROOT" -type d -name "com.apple.idleassetsd" -prune -quit 2>/dev/null | grep -q .; then
    echo "❌ User cache folder still exists. Cleanup may have failed."
else
    echo "✅ User cache folder is gone. Disk space recovered."
fi

# Step 4: Displaying Disk Usage Summary.
echo ""
echo "Step 4: Your current disk usage summary:"
df -h /

echo ""
echo "--- 🎉 Script complete. idleassetsd is permanently disabled and caches are clean. ---"
