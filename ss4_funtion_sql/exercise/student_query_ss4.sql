select * 
from subject
where Credit = (select max(Credit)
from subject) 
group by SubId;

select s.*,Mark
from subject s
join mark m on s.SubId=m.SubId
where Mark = (select max(Mark)
from mark);

select s.* , avg(Mark)
from student s
join mark m on s.StudentId = m.StudentId
group by s.StudentId
order by avg(Mark);
