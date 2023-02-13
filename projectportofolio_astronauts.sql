-- Looking for the Youngest and Oldest Astronout
/* select timestampdiff(year, max(str_to_date(Birth_Date, '%d/%m/%Y')), curdate()) as age_youngest, 
	   timestampdiff(year, min(str_to_date(Birth_Date, '%d/%m/%Y')), curdate())  as age_oldest from 
       astronauts; */

-- Looking Average Space Flight Astronout based on Graduate Major 
/* SELECT Graduate_Major, round(avg(Space_Flight_hr)) as AVG_space_hr 
	FROM portofolio.astronauts 
    group by Graduate_Major
    having AVG_space_hr > 5000
    order by AVG_space_hr desc; */

-- Divided Hours of Flight to the some classes
/* Select Name, case
	when round(Space_Flight_hr) > 10000 then 'Expert'
    when round(Space_Flight_hr) > 7500 then 'Novice'
    when round(Space_Flight_hr) > 5000 then 'Amateur'
    when round(Space_Flight_hr) > 2500 then 'Beginner'
    else 'Starter'
    end as Skill_Classes
from astronauts
order by Space_Flight_hr desc
limit 20 */

-- Selecting astronout that death in mission
/* select *
from astronauts
where Death_Date is not null and Death_Mission is not null */

-- Selecting astronout that retired and still alive
/* select *
from astronauts
where Military_Branch like "%retired%" and Death_Date is null */

-- count total missions
/* SELECT name,
	   case 
			when missions is null then coalesce(missions, 0)
            when missions is not null then (char_length(Missions) - char_length(replace(missions, ",",""))) + 1
		end as total_missions
from astronauts; */

-- count how many people in each total missions
select tm.total_missions, count(tm.total_missions) as count_total_missions
from
(SELECT name,
	   case 
			when missions is null then coalesce(missions, 0)
            when missions is not null then (char_length(Missions) - char_length(replace(missions, ",",""))) + 1
		end as total_missions
from astronauts) tm
group by tm.total_missions
having count_total_missions > 20
order by tm.total_missions


