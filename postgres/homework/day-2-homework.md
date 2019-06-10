- Do, 1

```sql
CREATE OR REPLACE RULE delete_venues AS
    ON DELETE TO public.venues DO INSTEAD  UPDATE public.venues SET active = false
  WHERE (venues.venue_id = old.venue_id);
```

- Do, 2

```sql
SELECT * FROM crosstab(
'SELECT extract(year from starts) as year,
	extract(month from starts) as month, count(*)
FROM events
GROUP BY year, month
ORDER BY year, month;',
'SELECT * FROM generate_series(1, 12)'
) AS (
	year int,
	jan int, feb int, mar int, apr int, may int, jun int,
	jul int, aug int, sep int, oct int, nov int, dec int
) ORDER BY YEAR;
```