-- Find resources with Owner tag
-- Shows how to use json_extract to query tags
-- Returns resource name and Owner tag value

SELECT name, json_extract(tags, '$.Owner') as owner
FROM resources
WHERE scan_id IN (
    SELECT scan_id FROM scans s
    WHERE s.timestamp = (
        SELECT MAX(s2.timestamp) FROM scans s2
        WHERE s2.account_id = s.account_id
    )
)
AND json_extract(tags, '$.Owner') IS NOT NULL
LIMIT 10
