#!/bin/bash

# Make sure CRON is being setup
if [[ -n "$CLEAN_CRON_EXPRESSION" ]]; then
  ln -sf /proc/$$/fd/1 /var/log/stdout
  service cron start
	if [[ -n "$CLEAN_CRON_EXPRESSION" ]]; then
        echo "$CLEAN_CRON_EXPRESSION pwsh /scripts/Clean.ps1 -storageAccountName "$STORAGE_ACCOUNT_NAME" -storageAccountKey "$STORAGE_ACCOUNT_KEY" -containerName "$BLOB_CONTAINER_NAME" -gracePeriodInSeconds $GRACE_PERIOD_IN_SECONDS >/var/log/stdout 2>&1" > /etc/crontab
	fi
	crontab /etc/crontab
fi

# Tail to let the container run
tail -f /dev/null