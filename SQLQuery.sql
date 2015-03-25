create database	FinAppln

use FinAppln

create table User_Login
(Username varchar(5),
Password varchar(20))

create table Admin_Login
(Username varchar(5),
Password varchar(20))

create table User_Details
(U_No varchar(5),
U_Name varchar(20),
U_Address varchar(100),
U_Contact varchar(10),
U_Email varchar(50),
U_Image varchar(30),
Password_Hint varchar(20),
A_Status varchar(3))

create table Discuss_Forum
(D_No varchar(5),
U_No varchar(5),
D_Date varchar(10),
D_Data varchar(200),
D_Status varchar(10))

create table Discuss_Reply
(R_No varchar(5),
D_No varchar(5),
R_Date varchar(10),
U_No varchar(5),
Reply varchar(200))

create table Daily_Exp
(U_No varchar(5),
Date datetime,
ExpType varchar(20),
ExpAmount numeric(10,2),
Descrip varchar(100))

create table Investment
(U_No varchar(5),
SDate datetime,
EDate datetime,
IType varchar(20),
IAmount numeric(10,2),
Descrip varchar(100))

create table Exp_Note
(U_No varchar(5),
FoodDet varchar(20),
FoodAmt numeric(10,2),
FoodIAmt numeric(10,2),
TravelDet varchar(20),
TravelAmt numeric(10,2),
TravelIAmt numeric(10,2),
ColDet varchar(20),
ColAmt numeric(10,2),
ColIAmt numeric(10,2),
RentDet varchar(20),
RentAmt numeric(10,2),
RentIAmt numeric(10,2),
FeeDet varchar(20),
FeeAmt numeric(10,2),
FeeIAmt numeric(10,2),
BilDet varchar(20),
BilAmt numeric(10,2),
BilIAmt numeric(10,2),
MiscDet varchar(20),
MiscAmt numeric(10,2),
MiscIAmt numeric(10,2))

create table Per_Inf
(U_No varchar(5),
FoodAmt numeric(10,2),
FoodIAmt numeric(10,2),
TravelAmt numeric(10,2),
TravelIAmt numeric(10,2),
ColAmt numeric(10,2),
ColIAmt numeric(10,2),
RentAmt numeric(10,2),
RentIAmt numeric(10,2),
FeeAmt numeric(10,2),
FeeIAmt numeric(10,2),
BilAmt numeric(10,2),
BilIAmt numeric(10,2),
MiscAmt numeric(10,2),
MiscIAmt numeric(10,2))

create table Growth
(U_No varchar(5),
LRLR numeric(3),
MRMR numeric(3),
HRHR numeric(3))

create table Res_Alloc
(U_No varchar(5),
Ret_Type varchar(4),
IName varchar(100),
Instrument varchar(50),
Amount numeric(10))


create table LRLR_Details
(IType varchar(50),
Institution varchar(50),
Interest_Rate varchar(10),
Time_Frame varchar(10),
Details varchar(50))

create table Screen
(U_No varchar(5),
Bank_FD numeric(15,2),
Corporate_FD numeric(15,2),
PPF numeric(15,2),
KVP numeric(15,2),
Insurance numeric(15,2),
Debentures numeric(15,2),
Treasury_Bill numeric(15,2),
Govt_Security numeric(15,2),
Debt_Fund numeric(15,2),
Gold_ETF numeric(15,2),
Silver_ETF numeric(15,2),
Stock3 numeric(15,2),
Indicies3 numeric(15,2),
Hybrid_Fund numeric(15,2),
ELSS numeric(15,2),
Stock numeric(15,2),
Mutual_Fund numeric(15,2))

create table Temp1
(Expn varchar(20),
Amount numeric(10,2))

create table Stock_Temp
(Scrip_Name varchar(20),
SOpen varchar(20),
SHigh varchar(20),
SLow varchar(20),
SClose varchar(20),
SLast varchar(20),
SPClose varchar(20),
SNoTrade varchar(20),
SNoShare varchar(20),
STurnover varchar(20))

create table MF_Temp
(MF_House varchar(100),
SCode varchar(20),
Div_Growth varchar(50),
ReInvest varchar(50),
SName varchar(100),
NAV varchar(50),
Repurchase varchar(50),
Sale varchar(50))

insert into Admin_Login values('Admin','123')

select * from User_Login