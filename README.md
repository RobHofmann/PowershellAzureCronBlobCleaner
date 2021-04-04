# PowershellAzureCronBlobCleaner
Powershell script that cleans files from Blob storage with a cutoff date.

# Environment variables needed
| Variable name | Example value | Description |
| ------------- | ------------- | ------------- |
| CLEAN_CRON_EXPRESSION | `*/2 * * * *` | The CRON expression in which frequency to run the script. |
| STORAGE_ACCOUNT_NAME | `mystorageaccount` | The Azure StorageAccountname. |
| STORAGE_ACCOUNT_KEY | `mOIUoumoimUOImuoyb9696d93q8m9+asd+1f==` | This accesskey can be found in your storage account under "Access keys". |
| BLOB_CONTAINER_NAME | `mydata` | The Blob container name to use. |
| GRACE_PERIOD_IN_SECONDS | `3600` | Files newer than this grace period will be skipped (both for uploading & deleting). This is usefull for when files are still in use when the upload starts. |

# How to use
1. Make sure you filled all the above environment variables.
2. Run :).

## Example
```
docker run --name=mycleaner -e CLEAN_CRON_EXPRESSION='0 * * * *' -e STORAGE_ACCOUNT_NAME="mystorageaccount" -e STORAGE_ACCOUNT_KEY="mOIUoumoimUOImuoyb9696d93q8m9+asd+1f==" -e BLOB_CONTAINER_NAME="mydata" -e GRACE_PERIOD_IN_SECONDS=3600 -d robhofmann/powershellazurecronblobcleaner
```
