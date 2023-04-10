USE sharkdb;
/*1*/
SELECT name, sid, detections as sightings FROM shark;
/*2*/
SELECT bayside, sum(detections) as sightings FROM receiver 
WHERE bayside is not null GROUP BY bayside ORDER BY sightings DESC;
/*3*/
SELECT MAX(length) as longest FROM shark;
/*4*/
SELECT r.area, t.town, t.state, r.detections FROM receiver as r 
join township as t on r.location = t.tid 
WHERE detections = (SELECT max(detections) FROM receiver);
/*5*/
SELECT * FROM receiver 
WHERE individual_sharks_detected = (SELECT count(name) FROM shark);
/*6*/
CREATE TABLE `bayside_encounters`
as SELECT * FROM receiver WHERE bayside is not null;
/*7*/
SELECT s.sid, s.length, s.name, s.detections from shark as s 
join attack as a on s.sid = a.shark;
/*8*
group_concat/
SELECT bayside, area from receiver GROUP BY area;
/*9*/
SELECT name FROM shark WHERE length = (SELECT max(length) FROM shark);
/*10*/
SELECT t.town, t.state, sum(r.detections) as sightings 
FROM receiver as r join township as t on t.tid = r.location
GROUP BY town, state;
/*11*/
SELECT t.town, t.state, sum(r.detections) as sightings
FROM receiver as r join township as t on t.tid = r.location GROUP By town, state 
ORDER BY sightings DESC limit 1;
/*12*/
SELECT * FROM shark WHERE length < 8 ORDER BY length ASC; 
/*13*/
SELECT count(case when sex ='Female' then 1 end) as female_count FROM shark;
/*14*/
SELECT t.town, t.state, sum(r.detections) as sightings 
FROM receiver as r join township as t on t.tid = r.location
GROUP BY town, state;
/*15*/
SELECT sponsor, count(rid) FROM receiver GROUP BY sponsor;
/*16*/
SELECT sponsor, sum(detections) FROM receiver left
join sponsor on receiver.sponsor = sponsor.sponsor_name 
GROUP BY sponsor;
/*17*/
SELECT s.name, fatal, date, description,victim.name, activity, township.town 
FROM attack left join shark as s on attack.shark = s.sid 
join victim on attack.victim = victim.vid 
join township on attack.location = township.tid;
/*18*/
SELECT t.town, t.state, r.deployed FROM receiver as r 
join township as t on t.tid = r.location WHERE deployed = 
(SELECT min(deployed) FROM receiver);
/*19*/
SELECT t.town, t.state, count(r.rid) FROM township as t 
join receiver as r on t.tid = r.location
GROUP BY town, state;
/*20*/
SELECT t.town, t.state FROM township as t WHERE t.tid NOT IN 
(SELECT location FROM receiver UNION SELECT location FROM attack);


  