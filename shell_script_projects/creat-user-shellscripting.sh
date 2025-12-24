#!/bin/bash
#

#!/bin/bash

# 1. Script should be run with root access
if [[ "${UID}" -ne 0 ]]
then
         echo "Please run with sudo or as root"
         exit 1
fi

# 2. Check if at least one argument was provided
# Fixed syntax: removed quotes from around the comparison
if [[ "${#}" -lt 1 ]]
then
        echo "Usage: ${0} USERNAME [COMMENTS...]"
        exit 1
fi

# 3. Store first argument as username and the rest as comments
USER_NAME="${1}"
shift # Removes the username from the list of arguments
COMMENT="${*}" # Stores all remaining arguments as the comment

# 4. Generate a password
PASSWORD=$(date +%s%N | sha256sum | head -c 12)

# 5. Create the user
useradd -c "${COMMENT}" -m "${USER_NAME}"

if [[ $? -ne 0 ]]
then
        echo "The account could not be created."
        exit 1
fi

# 6. Set the password
# The 'passwd' command is interactive; use 'chpasswd' for scripts
echo "${USER_NAME}:${PASSWORD}" | chpasswd

if [[ $? -ne 0 ]]
then
        echo "The password could not be set."
        exit 1
fi

# 7. Force password change on first login
passwd -e "${USER_NAME}"

# 8. Display the details
echo
echo "Account Created Successfully!"
echo "Username: ${USER_NAME}"
echo "Password: ${PASSWORD}"
echo "Host: $(hostname)"

