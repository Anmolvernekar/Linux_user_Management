#!/bin/bash

# A script that performs various system administration tasks such as —
# adding or deleting users,
# creating or deleting groups,
# setting file permissions, and managing services.

# This function creates a new user
function add_a_new_user() {
    read -p "Enter the username: " username
    read -s -p "Enter the password: " password
    sudo useradd -m $username
    echo -e "$password\n$password" | sudo passwd $username
    echo "User with the name: $username created!"
}

# This function deletes a user that is passed
function delete_a_user() {
    read -p "Enter the username to be deleted: " username
    sudo userdel -r $username
    echo "User with username: $username has been deleted!"
}

# This function adds a new group
function add_group() {
    sudo groupadd $1
    echo "Group with name: $1 has been created!"
}

# This function deletes an existing group
function delete_group() {
    sudo groupdel $1
    echo "Group with name: $1 has been deleted!"
}

while true
do
    echo "1. Add a new user"
    echo "2. Delete a user"
    echo "3. Create a group"
    echo "4. Delete a group"
    echo "5. Exit"
    read -p "Enter your choice: " choice

    case $choice in
    1) add_a_new_user ;;
    2) delete_a_user ;;
    3) read -p "Enter the groupname: " groupname
        add_group $groupname ;;
    4) read -p "Enter the groupname to be deleted: " groupname
        delete_group $groupname ;;
    5) exit ;;
    *) echo "Choice is invalid!" ;;
    esac
done
