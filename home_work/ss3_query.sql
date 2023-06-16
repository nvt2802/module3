select *
from student
join class on student.class_id = class.id;

select *
from student
right join class on student.class_id = class.id;

select *
from student
where name in ('nguyen minh hai','ta dinh huynh');

select*
from student 
where point>5;

select*
from student
where name like 'nguyen%';

select count(id) as point_count ,point
from student
group by point
order by point_count ;

select count(id) as point_count ,point
from student
where point >5 
group by point
order by point_count ;

select count(id) as point_count ,point
from student
where point >5 
group by point
having count(id)>=2
order by point_count ;

select *
from student 
join class on student.class_id = class.id
where class.name = 'c1121g1'
order by student.name;

select *
from student ;

