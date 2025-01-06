#! /bin/bash

# Prompt for Restic password (hidden input)
read -s -p "Enter Restic repository password: " RESTIC_PASSWORD
echo ""
# Export so restic commands can see it
export RESTIC_PASSWORD

# Prompt for paths
read -p "Give the repository path that you want to initialize: " init_deposit_path
read -p "Give the data repository path that contains data you want to save: " data_path

# 1) Expand ~ if used. The 'eval echo' trick forces tilde expansion if present.
init_deposit_path_expanded=$(eval echo "$init_deposit_path")
data_path_expanded=$(eval echo "$data_path")

echo "Using repository path: $init_deposit_path_expanded"
echo "Using data path:       $data_path_expanded"

# 2) Check if the repository is already initialized
#    We'll use 'restic cat config' and capture exit code
restic -r "$init_deposit_path_expanded" cat config &> /dev/null
exit_status=$?

if [ $exit_status -eq 0 ]; then
    echo "Repository already exists at $init_deposit_path_expanded."
elif [ $exit_status -eq 10 ] || [ $exit_status -eq 1 ]; then
    # Restic < 0.17.0 may return 1 if the repo doesn't exist
    # Restic >= 0.17.0 should return 10 for "repository does not exist"
    echo "No repository found at $init_deposit_path_expanded. Initializing repository..."
    restic -r "$init_deposit_path_expanded" init
    if [ $? -eq 0 ]; then
        echo "Repository initialized successfully at $init_deposit_path_expanded."
    else
        echo "Failed to initialize repository at $init_deposit_path_expanded."
        exit 1
    fi
else
    echo "An unexpected error occurred (error code $exit_status)."
    echo "Check the repository path, permissions, and Restic password."
    exit 1
fi

# 3) Perform the backup
echo "Starting backup of data..."
restic -r "$init_deposit_path_expanded" backup "$data_path_expanded"
if [ $? -eq 0 ]; then
    echo "Backup completed successfully."
else
    echo "Backup failed."
    exit 1
fi

# 4) Check the integrity of the files stored in the backup repository
echo "Checking repository integrity..."
restic -r "$init_deposit_path_expanded" check
if [ $? -eq 0 ]; then
    echo "Repository integrity check passed."
else
    echo "Repository integrity check failed."
    exit 1
fi
