--Weather Observation Station 2

select convert(decimal(10,2),sum(lat_n)),convert(decimal(10,2),sum(long_w)) from station