-- Count resources per region
-- Shows which AWS regions have the most resources

SELECT region, COUNT(*) as count
FROM resources
WHERE scan_id IN (
    SELECT scan_id FROM scans s
    WHERE s.timestamp = (
        SELECT MAX(s2.timestamp) FROM scans s2
        WHERE s2.account_id = s.account_id
    )
)
GROUP BY region
ORDER BY count DESC
