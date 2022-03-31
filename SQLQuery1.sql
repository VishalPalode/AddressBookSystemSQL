--UC1--Create AddressBook Service DataBase
create database AddressBookService;
use AddressBookService;

--UC2--Create AddressBook Table
create table AddressBook
(
FirstName varchar(100),
LastName varchar(100),
Address varchar(100),
City varchar(100),
State varchar (100),
Zip bigint,
PhoneNumber bigint,
Email varchar(100)
);
select * from AddressBook;

--UC3-- Insert new contacts into Addressbook
insert into AddressBook(FirstName, LastName, Address, City, State, Zip, PhoneNumber, Email)
values
('Vishal', 'Patil', 'shanivar peth', 'pune', 'MH', 411030, 124567890, 'vishalpalode9899.com'),
('Bhagwat', 'Palode', 'Hudco', 'sambhajinagar', 'MH', 431001, 2345678901, 'bhagwat@gmail.com'),
('Pawan', 'Gupta', 'Dhule', 'Dhule', 'MH', 560037, 3456789012, 'pawan@gmail.com'),
('Devansh', 'sutar', 'Sutarwadi', 'Pune', 'MH', 411050, 4567890123, 'devansh@gmail.com');

select * from AddressBook
--UC4-- Edit existing contact person using name
update AddressBook set City = 'Mumbai' where FirstName = 'Bhagwat' and LastName = 'Palode';
update AddressBook set State = 'Gujrat' where FirstName = 'Pawan' and LastName = 'Gupta';
select * from AddressBook;

--UC5-- Delete existing contact person using name
delete from AddressBook where FirstName = 'Devansh' and LastName = 'Sutar';
select * from AddressBook;

--UC6-- Retrieve person belonging to a city or state from AddressBook
select * from AddressBook where City = 'Pune' or State = 'MH';

--UC7-- Size of AddressBook by city and state 
select COUNT(*) as StateCount, State from AddressBook group by State;
select COUNT(*) as CityCount, City from AddressBook group by City;

--UC8-- Get Sorted entries alphabeticaly by first name
select * from AddressBook order by FirstName;

--UC9-- Identify each addressboook with name and type 
alter table AddressBook add ContactType varchar(100) not null default 'Friend';
update AddressBook set ContactType='Family' where FirstName='Bhagwat';

--UC10-- Get number of contact persons count by type
select COUNT(ContactType) as TypeCount, ContactType from AddressBook group by ContactType;

--UC11-- Add person to friend and family
insert into AddressBook(FirstName, LastName, Address, City, State, Zip, PhoneNumber, Email, ContactType)
values
('Sanket', 'Pawar', 'Parner', 'Ahamadnagar', 'MH', 560040, 1231231235, 'sanket@gmail.com', 'Friend'),
('pankaj', 'Patil', 'Hudco', 'Sambhajingar', 'MH', 560040, 2312312356, 'pankaj@gmail.com', 'Family');
select * from AddressBook;