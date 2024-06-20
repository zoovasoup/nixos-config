
#!/bin/bash

# Get the list of applications
applications=$(rofi -show drun -dump)

# Remove the group names using sed
cleaned_apps=$(echo "$applications" | sed -e 's/ ([^)]*)//g')

# Display the cleaned list with rofi
echo "$cleaned_apps" | rofi -dmenu
