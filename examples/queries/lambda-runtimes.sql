-- Extract Lambda function runtimes
-- Shows how to use json_extract to get data from the details column
-- Returns function name and runtime (python3.12, nodejs20.x, etc.)

SELECT name, json_extract(details, '$.runtime') as runtime
FROM resources
WHERE scan_id IN (
    SELECT scan_id FROM scans s
    WHERE s.timestamp = (
        SELECT MAX(s2.timestamp) FROM scans s2
        WHERE s2.account_id = s.account_id
    )
)
AND service = 'lambda'
AND type = 'function'
LIMIT 10
