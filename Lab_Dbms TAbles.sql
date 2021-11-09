/*Creating  E-commerce database ans its tables along with the columns and inserting data in the columns.*/

create database if not exists E_commerce;
use E_commerce;

/*Creating Supplier table*/

create table if not exists  Supplier(
SUPP_ID int primary key,
SUPP_NAME varchar (50),
SUPP_CITY varchar(50),
SUPP_PHONE varchar(10)
);

/*Creating Customer table*/

create table if not exists Customer(
CUS_ID int not null,
CUS_NAME varchar(20) null default null,
CUS_PHONE varchar(10),
CUS_CITY varchar(30),
CUS_GENDER char,
primary key (CUS_ID)
);

/*Creating Category table*/

create table if not exists Category (
CAT_ID int not null,
CAT_NAME varchar(20) null default null,
primary key(CAT_ID)
);

/*Creating Product table*/

create table if not exists Product (
PRO_ID int not null,
PRO_NAME varchar(20) null default null,
PRO_DESC varchar(60) null default null,
CAT_ID int not null,
primary key (PRO_ID),
foreign key(CAT_ID) references Category(CAT_ID)
);

/*Creating Product_details table*/

create table if not exists Product_details(
PROD_ID int  not null,
PRO_ID int not null,
SUPP_ID int not null,
PROD_PRICE int not null,
primary key(PROD_ID),
foreign key (PRO_ID) references Product (PRO_ID),
foreign key(SUPP_ID) references Supplier (SUPP_ID)
);

/*Creating Orders table*/

create table if not exists Orders (
ORD_ID int not null,
ORD_AMOUNT int not null,
ORD_DATE date, 
CUS_ID int not null,
PROD_ID int not null,
primary key ( ORD_ID ),
foreign key( CUS_ID )references Customer ( CUS_ID),
foreign key ( PROD_ID) references Product_details ( PROD_ID)
);

/*Creating Rating table*/

create table if not exists Rating (
RAT_ID int not null,
CUS_ID int not null,
SUPP_ID int not null, 
RAT_RATSTARS int not null, 
primary key ( RAT_ID ), 
foreign key( SUPP_ID ) references Supplier ( SUPP_ID ),
foreign key ( CUS_ID ) references Customer ( CUS_ID )
);

/*Inserting data in Supplier table*/

insert into Supplier values (1,"Rajesh Retails","Delhi",'1234567890');
insert into Supplier values (2,"Appario Ltd.","Mumbai",'2589631470');
insert into Supplier values (3,"Knome products","Banglore",'9785462315');
insert into Supplier values (4,"Bansal Retails","kochi",'8975463285');
insert into Supplier values (5,"Mittal Ltd","Lucknow",'7898456532');

/*Inserting data in Customer table*/

insert into Customer values (1,"Aakash",'9999999999',"Delhi",'M');
insert into Customer values (2,"Aman",'9785463215',"Noida",'M');
insert into Customer values (3,"Neha",'9999999999',"Mumbai",'F');
insert into Customer values (4,"Megha",'9994562399',"Kolkata",'F');
insert into Customer values (5,"Pulkit",'7895999999',"Lucknow",'M');

/*Inserting data in Category table*/

insert into Category value (1,"BOOKS");
insert into Category value (2,"GAMES");
insert into Category value (3,"GROCERIES");
insert into Category value (4,"ELECTRONICS");
insert into Category value (5,"CLOTHES");

/*Inserting data in Product table*/

insert into Product values (1,"GTA V","DFJDJFDJFDJFDJFJF",2);
insert into Product values (2,"TSHIRT","DFDFJDFJDKFD",5);
insert into Product values (3,"ROG LAPTOP","DFNTTNTNTERND",4);
insert into Product values (4,"OATS","REURENTBTOTH",3);
insert into Product values (5,"HARRY POTTER","NBEMCTHTJTH",1);

/*Inserting data in Product_details table*/

insert into Product_details values (1,1,2,1500);
insert into Product_details values (2,3,5,30000);
insert into Product_details values (3,5,1,3000);
insert into Product_details values (4,2,3,2500);
insert into Product_details values (5,4,1,1000);

/*Inserting data in Orders table*/

insert into Orders values (20,1500,"2021-10-12",3,5);
insert into Orders values (25,30500,"2021-09-16",5,2);
insert into Orders values (26,2000,"2021-10-05",1,1);
insert into Orders values (30,3500,"2021-08-16",4,3);
insert into Orders values (50,2000,"2021-10-06",2,1);

/*Inserting data in Rating table*/

insert into Rating values (1,2,2,4);
insert into Rating values (2,3,4,3);
insert into Rating values (3,5,1,5);
insert into Rating values (4,1,3,2);
insert into Rating values (5,4,5,4);

