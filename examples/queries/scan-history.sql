-- View scan history
-- Shows all inventory scans with their metadata

SELECT scan_id, account_id, account_alias, timestamp, resource_count
FROM scans
ORDER BY timestamp DESC
