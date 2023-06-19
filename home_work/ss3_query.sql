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

select c.* ,count(c.id) as 'number of student'
from class c
join student s on s.class_id = c.id 
group by c.id;

select max(point)
from student s
group by class_id;

select avg(point)
from student s
group by class_id;
 
  select s.name,s.birthday,i.name,i.birthday
  from class c
  join student s on c.id = s.class_id
  join instructor_class ic on c.id = ic.class_id 
  join instructor i on ic.instructor_id = i.id;
  
  select *
  from student
  order by point desc
  limit 3;
  
  select*
  from student
  where point = (select max(point) 
  from student);
  
  select *
  from student;