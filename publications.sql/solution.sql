use lab_1;

-- challenge 1 

select 
a.au_id, a.au_lname, a.au_fname, t.title, p.pub_name

from authors a
left join titleauthor ta on a.au_id = ta.au_id
join titles t on ta.title_id = t.title_id
join publishers p on t.pub_id = p.pub_id
;
















-- challenge 2

select a.au_id, a.au_lname, a.au_fname, p.pub_name, count(t.title_id)

from authors a
join titleauthor ta on a.au_id = ta.au_id
join titles t on ta.title_id = t.title_id
join publishers p on t.pub_id = p.pub_id

group by
    a.au_id,
    a.au_lname,
    a.au_fname,
    p.pub_name;


-- challenge 3

select a.au_id, a.au_lname, a.au_fname, sum(s.qty)

from authors a
join titleauthor ta on a.au_id = ta.au_id
join titles t on ta.title_id = t.title_id
join sales s on t.title_id = s.title_id

group by 
    a.au_id,
    a.au_lname,
    a.au_fname
order by sum(s.qty) desc
limit 3;



--  challenge 4 


select 
    a.au_id,
    a.au_lname,
    a.au_fname,
    coalesce(sum(s.qty), 0) as TOTAL
from authors a
left join titleauthor ta on a.au_id = ta.au_id
left join titles t on ta.title_id = t.title_id
left join sales s on t.title_id = s.title_id
group by
    a.au_id,
    a.au_lname,
    a.au_fname
order by TOTAL desc;












