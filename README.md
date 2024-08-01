# ServerLogAutoViewer

ServerLogAutoViewer is a script designed to automatically open remote servers using PuTTY, log in with credentials, and execute commands to view logs. The script is based on AutoHotkey v2.0 and ensures that log windows are opened sequentially, with appropriate delays for successful logins and command executions.

## Features
- **Automated Server Access**: Opens remote servers sequentially using PuTTY.
- **Automatic Login**: Automatically inputs the login credentials for each server.
- **Command Execution**: Automatically executes specified commands to view logs.
- **Window Management**: Arranges log windows on the screen for easy monitoring.

## Requirements
- **Windows OS**: Ensure you have a Windows operating system.
- **AutoHotkey v2.0**: Install AutoHotkey v2.0.
- **PuTTY**: Ensure PuTTY is installed and accessible from the script.

## Installation
1. Clone the Repository:
    ```sh
    git clone https://github.com/sqhard08/ServerLogAutoViewer.git
    cd ServerLogAutoViewer
    ```
2. Run the Script:
    Execute the AutoHotkey script to automatically open remote servers, log in, and view logs:
    ```sh
    autohotkey autolog_viewer.ahk
    ```

## Configuration
- **Servers and Commands**: Edit the `servers` and `commands` arrays in the `autolog_viewer.ahk` script to match your server details and log commands.

## Example Crontab Entry
To run the script periodically (on startup), you can add a task to the Windows Task Scheduler:
1. Open Task Scheduler.
2. Create a new task.
3. Set the trigger to "At startup".
4. Set the action to run the AutoHotkey script.
