use hospitals_db;

insert into addresses(street, house_number) values ('Eastern', 123);
insert into addresses(street, house_number) values ('Western', 543);

insert into head_physicians(first_name, last_name) values ('Doctor', 'Pattison');
insert into head_physicians(first_name, last_name) values ('Dori', 'Shvimer');

insert into hospitals(address_id, head_physician_id, name) values (1, 1, 'An asylum'), (2, 2, 'Central Regional Hospital');

insert into cards(number, registration) values
	(101, '1998-01-01'),
	(102, '2000-02-02'),
	(103, '2000-03-03'),
	(104, '2000-04-04');

insert into contacts(passport, phone_number) values
	('A', 2619049),
	('B', 2617897),
	('C', 2619525),
	('D', 2614103);

insert into patients(hospital_id, card_id, contact_id, first_name, last_name, dob) values 
	(1, 1, 1, 'John', 'Travolta', '1980-01-01'),
	(1, 2, 2, 'Samanta', 'Fox', '1981-02-02'),
	(1, 3, 3, 'Roberto', 'Carlos', '1982-03-03'),
	(2, 4, 4, 'Daniel', 'Defo', '1983-04-04');
    
    -- remove patients with id more than 0
delete from patients where id>0;  

insert into diseases(name, price) values ('runny nose', 10);
insert into diseases(name, price) values ('injury', 15);
insert into diseases(name, price) values ('caries', 20);

-- remove diseases with particular id
delete from diseases where id=1;
delete from diseases where id=2;

insert into departments(hospital_id, name) values (2, 'Therapeutic');
insert into departments(hospital_id, name) values (2, 'Traumatological');
insert into departments(hospital_id, name) values (2, 'Dental');

insert into doctors(department_id, first_name, last_name, specification) values
	(1, 'Vasja', 'Volodin', 'therapist'),
	(1, 'Nikita', 'Sergeevich', 'therapist'),
	(2, 'Vladimir', 'Kostin', 'surgeon'),
	(2, 'Evgeny', 'Sablja', 'radiologist'),
	(3, 'Artur', 'Pirogkov', 'dentist'),
	(3, 'Semen', 'Lebedev', 'prosthetist');
    
insert into doctor_diseases(doctor_id, disease_id) values 
	(1, 1),
	(2, 1),
	(3, 2),
	(4, 2),
	(5, 3),
	(6, 3);  
    
-- set new values
update patients set last_name = 'Kalen' where id = 1;
update patients set first_name = 'Brad' where id = 2;
update patients set dob = '2010-05-05' where id = 4;
update hospitals set name = 'Mental health' where id = 1;
update hospitals set name = 'Physical health' where id = 2;
update diseases set price = 18 where id = 3;
update doctors set specification = 'therapist' where id = 3;
update doctors set last_name = 'Li' where id = 1;
update doctors set first_name = 'Lola' where id = 1;
update cards set registration = '2015-03-03' where id = 4;    

-- select id, hospital id from patients
select id, hospital_id from patients;

-- select names, birthdays from patients
select first_name, dob as date_of_birth from patients;

insert into addresses(street, house_number) values ('Road 60', 7);
insert into addresses(street, house_number) values ('Avenue', 124);

insert into head_physicians(first_name, last_name) values ('Doctor', 'House');
insert into head_physicians(first_name, last_name) values ('Walt', 'Jim');
    
insert into hospitals(address_id, head_physician_id, name) values (3, 3, 'Number 1'), (4, 4, 'Number 2');

-- join two tables
select 
h.id as hospital_id, h.name,
p.id as patient_id, p.first_name, p.last_name
from hospitals h inner join patients p on p.hospital_id = h.id;

-- join two tables
select 
h.id as hospital_id, h.name,
p.id as patient_id, p.first_name, p.last_name
from hospitals h left join patients p on p.hospital_id = h.id;

-- this query selects patients with first name John
select 
h.id as hospital_id, h.name,
p.id as patient_id, p.first_name, p.last_name
from hospitals h left join patients p on p.hospital_id = h.id 
where p.first_name = 'John';

-- this query selects patients with first names which contain n and last names which contain o and hospitals ids are not equal 1 5 or 6
select 
h.id as hospital_id, h.name,
p.id as patient_id, p.first_name, p.last_name
from hospitals h left join patients p on p.hospital_id = h.id 
where p.first_name like '%n%' and p.last_name like '%o%' and hospital_id not in (1, 5, 6);

-- this query selects doctors with names which contain n and department's id is not equal null
select 
departments.id as department_id, departments.hospital_id, departments.name,
doctors.id as doctor_id, doctors.department_id, doctors.first_name, doctors.last_name, doctors.specification
from departments left join doctors on doctors.department_id = departments.id
where doctors.first_name like '%n%' and doctors.department_id is not null;

-- this query selects patients who's names contain n and sorts them by their birthdays
select
p.id as patient_id, p.first_name, p.last_name, p.dob as date_of_birth, 
c.id as card_id, c.number, c.registration
from patients p left join cards c on p.card_id = c.id
where p.first_name like '%n%' order by p.dob;

select count(*) from patients where first_name like '%N%';

-- this query selects unique names with n letter from patients table
select count(distinct first_name) from patients where first_name like '%N%';

-- this query selects diseases with price less than 14
select d.id, count(s.id) as diseases_count from doctors d 
left join doctor_diseases ds on d.id = ds.doctor_id
left join diseases s on s.id = ds.disease_id
where s.price < 14
group by d.id having diseases_count > 0;

-- unite two tables
select first_name, last_name from patients
union select first_name, last_name from doctors;

-- unite two tables and sort
select first_name, last_name from patients
union all select first_name, last_name from doctors
order by last_name;