#!/bin/bash

# Function to display usage instructions
usage() {
    echo "Usage: $0 [-a username] [-d username] [-m username newshell]"
    echo "  -a: Add a new user"
    echo "  -d: Delete an existing user"
    echo "  -m: Modify user shell"
    exit 1
}

# Function to add a new user
add_user() {
    local username=$1
    if [ -z "$username" ]; then
        echo "Error: Username not specified."
        exit 1
    fi

    sudo useradd -m $username
    echo "User $username added successfully."
}

# Function to delete an existing user
delete_user() {
    local username=$1
    if [ -z "$username" ]; then
        echo "Error: Username not specified."
        exit 1
    fi

    sudo userdel -r $username
    echo "User $username deleted successfully."
}

# Function to modify user shell
modify_user_shell() {
    local username=$1
    local new_shell=$2
    if [ -z "$username" ] || [ -z "$new_shell" ]; then
        echo "Error: Username or new shell not specified."
        exit 1
    fi

    sudo usermod -s $new_shell $username
    echo "Shell for user $username modified to $new_shell."
}

# Main script
while getopts ":a:d:m:" option; do
    case "$option" in
        a) add_user "$OPTARG";;
        d) delete_user "$OPTARG";;
        m) modify_user_shell $OPTARG $3;;
        *) usage;;
    esac
done

exit 0
