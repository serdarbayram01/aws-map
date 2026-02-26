-- Total count of all resources
-- Returns a single row with the total resource count

SELECT COUNT(*) as total
FROM resources
WHERE scan_id IN (
    SELECT scan_id FROM scans s
    WHERE s.timestamp = (
        SELECT MAX(s2.timestamp) FROM scans s2
        WHERE s2.account_id = s.account_id
    )
)
