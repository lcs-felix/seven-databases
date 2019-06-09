- Do, 1

```sql
-- relnamespace may go wrong because of the number changes. to test

SELECT * FROM pg_class WHERE relnamespace = '2200' and relkind = 'r';
```

- Do, 2

```sql
SELECT c.country_name 
FROM events e 
JOIN venues v ON e.venue_id = v.venue_id 
JOIN countries c ON v.country_code = c.country_code 
WHERE e.title = 'Fight Club';
 ```


 - Do, 3

 ```sql
ALTER TABLE venues ADD COLUMN active boolean DEFAULT TRUE;
 ```