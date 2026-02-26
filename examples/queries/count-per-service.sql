-- Count resources per service
-- Shows which AWS services have the most resources

SELECT service, COUNT(*) as count
FROM resources
WHERE scan_id IN (
    SELECT scan_id FROM scans s
    WHERE s.timestamp = (
        SELECT MAX(s2.timestamp) FROM scans s2
        WHERE s2.account_id = s.account_id
    )
)
GROUP BY service
ORDER BY count DESC
