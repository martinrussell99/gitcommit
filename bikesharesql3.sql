SELECT, FROM, WHERE

select
	trip_id
from
	trips
where
	duration > 500
	
	
	
	
	select
	*
from
	stations
where
	station_id = 84





select
	Mintemperaturef
from
	weather
where
	zip = 94301
	
AGGREGATES and GROUPS

select
	zip,
	max(maxtemperaturef) maxtemperaturef
from
	weather
	
select
	COUNT(*) start_count,
	start_station
from
	trips
group by
	start_station
	
select
	min(duration)
from
	trips
	
select
	avg(duration),
	end_station
from
	trips
group by end_station


Joins and CTE'select (I didn't have a clue on these)

with
	rainy
as (
select
	date
from
	weather
where
	events = 'Rain'
group by 1
)
select
	trip_id,
	duration,
	date(start_date) trip_date
from
	trips
join
	rainy
on 
	rainy.date = trip_date
order by duration desc
limit 3

_________

select
	status.station_id,
	stations.name,
	count(case when docks_available=0 then 1 end) empty_count
from
	status
join
	stations
on
	stations.station_id = status.station_id
group by 1
order by empty_count desc
_________________
select
	start_station,
	dockcount,
	count(*)
from
	trips
join
	stations
on stations.name=trips.start_station
group by 1, 2
order by 2 desc