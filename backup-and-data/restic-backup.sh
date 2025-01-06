#! /bin/bash
# Prompt for paths
read -p "Give the repository path that you want to initialize: " init_deposit_path
read -p "Give the data repository path that contains data you want to save: " data_path


# Check if the repository is already initialized
restic -r "$init_deposit_path" cat config &> /dev/null

# Get the exit status of the last restic command
exit_status=$?


case $exit_status in
    0)
        echo "Repository already exists at $init_deposit_path."
        ;;
    10)
        echo "No repository found at $init_deposit_path. Initializing repository..."
        # Initialize the repository
        restic -r "$init_deposit_path" init
        if [ $? -eq 0 ]; then
            echo "Repository initialized successfully at $init_deposit_path."
        else
            echo "Failed to initialize repository at $init_deposit_path."
        fi
        ;;
    *)
        echo "An error occurred (error code $exit_status). Please check the repository path and permissions."
        exit 1
        ;;
esac

# Proceed to backup
echo "Starting backup of data..."
restic -r "$init_deposit_path" backup "$data_path"
if [ $? -eq 0 ]; then
    echo "Backup completed successfully."
else
    echo "Backup failed."
    exit 1
fi

# Check the integrity of the files stored in the backup repository
echo "Checking repository integrity..."
restic -r "$init_deposit_path" check
if [ $? -eq 0 ]; then
    echo "Repository integrity check passed."
else
    echo "Repository integrity check failed."
    exit 1
fi
