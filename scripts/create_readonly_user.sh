#!/bin/bash

set -eo pipefail
shopt -s nullglob

NEW_USER=$1
NEW_PASSWORD=$2

URL="http://host.docker.internal:8123/ping"

# check if clickhouse is ready to accept connections
# will try to send ping clickhouse via http_port (max 1000 retries by default, with 1 sec timeout and 1 sec delay between retries)
tries=${CLICKHOUSE_INIT_TIMEOUT:-1000}
while ! wget --spider --no-check-certificate -T 1 -q "$URL" 2>/dev/null; do
    if [ "$tries" -le "0" ]; then
        echo >&2 'ClickHouse init process failed.'
        exit 1
    fi
    tries=$(( tries-1 ))
    echo "Waiting clickhouse to start..."
    sleep 1
done

clickhouseclient=( clickhouse-client --multiquery --host "host.docker.internal" -u "$CLICKHOUSE_USER" --password "$CLICKHOUSE_PASSWORD" )

echo "Creating user $NEW_USER..."
"${clickhouseclient[@]}" -q "CREATE USER IF NOT EXISTS $NEW_USER IDENTIFIED WITH plaintext_password BY '$NEW_PASSWORD'";
echo "$NEW_USER created successfully!"

echo "Granting read on $CLICKHOUSE_DB.* TO $NEW_USER..."
"${clickhouseclient[@]}" -q "GRANT SHOW TABLES, SELECT ON $CLICKHOUSE_DB.* TO $NEW_USER";
echo "Grant done!"

