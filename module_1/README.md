# Module One

## Question 1
```bash
docker build -t <tag_name> .
docker run -it tag_name
pip --version
#  23.3.1
```

## Question 2
```bash
docker-compose up -d --build
## visit the pgadmin browser on localhost:8080
```

## Question 3
```sql
-- q1
SELECT COUNT (*) 
FROM public.tripdb
WHERE trip_distance <= 1
  AND lpep_dropoff_datetime >= '2019-10-01 00:00:00'
  AND lpep_dropoff_datetime < '2019-11-01 00:00:00';

-- q2
SELECT COUNT(*)
FROM public.tripdb
WHERE trip_distance > 1
    AND trip_distance <= 3
    AND lpep_dropoff_datetime >= '2019-10-01 00:00:00'
    AND lpep_dropoff_datetime < '2019-11-01 00:00:00';

-- q3
SELECT COUNT(*)
FROM public.tripdb
WHERE trip_distance > 3
    AND trip_distance <= 7
    AND lpep_dropoff_datetime >= '2019-10-01 00:00:00'
    AND lpep_dropoff_datetime < '2019-11-01 00:00:00';

-- q4
SELECT COUNT(*)
FROM public.tripdb
WHERE trip_distance > 7
    AND trip_distance <= 10
    AND lpep_dropoff_datetime >= '2019-10-01 00:00:00'
    AND lpep_dropoff_datetime < '2019-11-01 00:00:00';

--q5
SELECT COUNT(*)
FROM public.tripdb
WHERE trip_distance > 10
    AND lpep_dropoff_datetime >= '2019-10-01 00:00:00'
    AND lpep_dropoff_datetime < '2019-11-01 00:00:00';

```

## Question 4
```sql
SELECT lpep_pickup_datetime
FROM public.tripdb
WHERE trip_distance = (SELECT MAX(trip_distance) FROM public.tripdb)
LIMIT 1;
```