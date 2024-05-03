USE PremierSarinG;
/*5*/

SELECT matchnumber, team1, team2 FROM matches 
WHERE fulltimescoreteam1 > fulltimescoreteam2;

/*6*/ 

SELECT team, count(manager) FROM managers 
GROUP BY team HAVING count(manager) > 1;

/*7*/

SELECT manager, count(team) FROM managers
GROUP BY manager HAVING count(team) > 1;

/*8*/

select x.manager,sum(x.score) from (Select managers.manager as manager , 
count(matches.fulltimescoreteam1>matches.fulltimescoreteam2) as score
from managers  join matches on managers.team=matches.team1
where matches.fulltimescoreteam1>matches.fulltimescoreteam2
group by managers.manager 
union all
Select managers.manager as manager, count(matches.fulltimescoreteam2>matches.fulltimescoreteam1)  as score
from managers  join matches on managers.team=matches.team2
where matches.fulltimescoreteam2>matches.fulltimescoreteam1
group by managers.manager)x 
group by x.manager ORDER BY sum(x.score) DESC;

/*9*/ 

SELECT stadiums.venue FROM matches left join stadiums on matches.team1 = stadiums.team GROUP BY team1 
ORDER BY sum(matches.fulltimescoreteam2 + matches.fulltimescoreteam1) DESC limit 1;

/*10*/

select x.team , sum(x.score) from  (SELECT team1 as team, count(fulltimescoreteam2 = matches.fulltimescoreteam1) as score from matches 
where matches.fulltimescoreteam2 = matches.fulltimescoreteam1 GROUP By team1
union all
SELECT DISTINCT team2 as team, count(fulltimescoreteam2 = matches.fulltimescoreteam1) as score  from matches 
where matches.fulltimescoreteam2 = matches.fulltimescoreteam1 GROUP By team2) x
 group by x.team;

/*11*/

select x.team,sum(x.score) from (Select managers.team as team , 
count(matches.fulltimescoreteam2 = 0) as score
from managers  join matches on managers.team=matches.team1
where matches.fulltimescoreteam2 = 0
group by managers.team 
union all
Select managers.team as team, count(matches.fulltimescoreteam1 = 0)  as score
from managers  join matches on managers.team=matches.team2
where matches.fulltimescoreteam1 = 0
group by managers.team)x 
group by x.team ORDER BY sum(x.score) DESC limit 5;

/*12*/

SELECT * FROM matches WHERE date between '2017-12-25' and '2018-01-03' 
and fulltimescoreteam1 > 2;

/*13*/

SELECT * FROM matches WHERE halftimescoreteam_1 >  halftimescoreteam2
and fulltimescoreteam1 < fulltimescoreteam2 OR halftimescoreteam2 >  halftimescoreteam_1
and fulltimescoreteam2 < fulltimescoreteam1;

/*14*/

select x.team,sum(x.score) from (Select managers.team as team , 
count(matches.fulltimescoreteam1>matches.fulltimescoreteam2) as score
from managers  join matches on managers.team=matches.team1
where matches.fulltimescoreteam1>matches.fulltimescoreteam2
group by managers.team 
union all
Select managers.team as team, count(matches.fulltimescoreteam2>matches.fulltimescoreteam1)  as score
from managers  join matches on managers.team=matches.team2
where matches.fulltimescoreteam2>matches.fulltimescoreteam1
group by managers.team)x 
group by x.team ORDER BY sum(x.score) DESC limit 5;

/*15*/

select x.team, x.homescore,x.awayscore from (Select managers.team as team , 
avg(fulltimescoreteam1) as homescore , 0 as awayscore 
from managers  join matches on managers.team=matches.team1
group by managers.team 
union all
Select managers.team as team , 
avg(fulltimescoreteam2) as awayscore , 0 as homescore
from managers  join matches on managers.team=matches.team2
group by managers.team )x 
group by x.team;

SELECT team1, avg(fulltimescoreteam1) from matches Group by team1;
SELECT team2, avg(fulltimescoreteam2) from matches Group by team2;





