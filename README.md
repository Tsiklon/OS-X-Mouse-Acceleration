# OS X - Mouse Acceleration Script

## Description
 This is intended to ease setting mouse acceleration under OS X, it makes use of your environment's bash executable and works only on OS X/Darwin based systems

 The script makes use of the `defaults` command to interact with the `.GlobalPreferences` Domain and the `com.apple.mouse.scaling` key

## Functions
 - `custom` - When provided a number between `-1` and `9` as an additional parameter this sets the key to that value
 - `default` - Resets the key to the default value - `2`
 - `delete` - Deletes the key entirely
 - `off` - Sets the key to `-1`
 - `status` - Returns the current value of the key 

## Instructions
 - Clone Repo
 - Run the script without parameters to see the available options as described above
