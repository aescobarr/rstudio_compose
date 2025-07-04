#!/bin/bash
set -e

groupadd -f rstudio-users

# Create users from environment variables
IFS=',' read -ra USERS <<< "$USER_LIST"

for USERNAME in "${USERS[@]}"; do
  PASSWORD_VAR="USER_${USERNAME}_PASSWORD"
  PASSWORD=${!PASSWORD_VAR}

  if id "$USERNAME" &>/dev/null; then
    echo "User $USERNAME already exists"
  else
    useradd -m "$USERNAME"
    echo "$USERNAME:$PASSWORD" | chpasswd
    usermod -aG rstudio-users "$USERNAME"
    echo "Created user $USERNAME"
    chown -R $USERNAME:$USERNAME /home/$USERNAME
  fi
done

# Start RStudio
exec /init
