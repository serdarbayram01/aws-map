-- List all EC2 instances
-- Shows name, region, and account ID for each instance

SELECT name, region, account_id
FROM resources
WHERE scan_id IN (
    SELECT scan_id FROM scans s
    WHERE s.timestamp = (
        SELECT MAX(s2.timestamp) FROM scans s2
        WHERE s2.account_id = s.account_id
    )
)
AND service = 'ec2'
AND type = 'instance'
