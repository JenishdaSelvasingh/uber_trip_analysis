DROP DATABASE uber;
CREATE DATABASE uber;
USE uber;

/*Dropping the tables*/
DROP TABLE cabs_route;
DROP TABLE ride_status;
DROP TABLE ride;
DROP TABLE payment_mode;
DROP TABLE cancel_reason;
DROP TABLE promo_use;
DROP TABLE promo_code;
DROP TABLE driver_document;
DROP TABLE driver_payment;
DROP TABLE driver;
DROP TABLE cabs_type;
DROP TABLE cabs;
DROP TABLE phone_verification;
DROP TABLE passenger;

CREATE TABLE passenger(
    pass_id VARCHAR(10),
    PRIMARY KEY(pass_id),
    CHECK(pass_id LIKE'P%'),
    pass_first_name VARCHAR(20),
    pass_last_name varchar(10),
    pass_email VARCHAR(20),
    pass_ph_no varchar(14),
    UNIQUE(pass_ph_no),
    pass_gender varchar(8),
    pass_address varchar(60),
    pass_age int,
    pass_trip_status varchar(20),
    pass_verified varchar(10),
    pass_active varchar(10)
    );


INSERT INTO passenger VALUES('P1','Lena','Smith','lena@gmail.com',9265550182,'Female','1,South Street,Chennai',34,'Reached','Yes','Yes');
INSERT INTO passenger VALUES('P2','Nicol','Green','nicol@gmail.com',7475550171,'Male','12,South Street,Tuticorin',24,'Pending','No','No');
INSERT INTO passenger VALUES('P3','Tom','Taylor','tom@gmail.com',9195550100,'Male','34,North Street,Trichy',56,'Runnable','Yes','Yes');
INSERT INTO passenger VALUES('P4','Paul','Miller','paul@gmail.com',8695550125,'Male','18,East Street,Chennai',14,'Reached','Yes','Yes');
INSERT INTO passenger VALUES('P5','Alen','Lee','alen@gmail.com',9295550159,'Male','19,South Street,Nellai',76,'Reached','Yes','Yes');
INSERT INTO passenger VALUES('P6','David','King','david@gmail.com',9465550124,'Male','98,West Street,Ooty',25,'Reached','Yes','Yes');
INSERT INTO passenger VALUES('P7','Obmar','Wood','obmar@gmail.com',9925550166,'Male','45,First Street,Madurai',39,'Pending','No','No');
INSERT INTO passenger VALUES('P8','Jone','Smith','jone@gmail.com',9085550114,'Male','45,East Street,Namakkal',19,'Reached','Yes','Yes');
INSERT INTO passenger VALUES('P9','Lucy','White','lucy@gmail.com',9985550132,'Female','34,South Street,Thanjavur',65,'Reached','Yes','Yes');
INSERT INTO passenger VALUES('P10','Mia','Law','mia@gmail.com',9175550154,'Female','92,North Street,Salem',59,'Pending','No','No');


CREATE TABLE phone_verification(
    pass_id varchar(10),
    CONSTRAINT verification_passid_FK FOREIGN KEY(pass_ID)REFERENCES passenger(pass_id),
    pass_phone_no varchar(14),
    UNIQUE(pass_phone_no),
    otp varchar(10),
    phone_no_verified varchar(10)
    );


INSERT INTO phone_verification VALUES('P1','9265550182','1234','Yes');
INSERT INTO phone_verification VALUES('P2','7475550171','2345','No');
INSERT INTO phone_verification VALUES('P5','9195550100','3456','Yes');
INSERT INTO phone_verification VALUES('P2','8695550125','4567','Yes');
INSERT INTO phone_verification VALUES('P7','9295550159','5678','Yes');
INSERT INTO phone_verification VALUES('P1','9465550124','6789','Yes');
INSERT INTO phone_verification VALUES('P4','9925550166','7890','No');
INSERT INTO phone_verification VALUES('P1','9085550114','0123','Yes');
INSERT INTO phone_verification VALUES('P3','9985550132','2314','Yes');
INSERT INTO phone_verification VALUES('P8','9175550154','6537','No');


CREATE TABLE cabs(
    cab_id VARCHAR(10),
    PRIMARY KEY(cab_id),
    CHECK(cab_id LIKE'C%'),
    cab_type VARCHAR(10),
    cab_brand varchar(20),
    cab_model VARCHAR(20),
    cab_model_year varchar(6),
    cab_color varchar(10),
    cab_active varchar(10),
    cab_licence_plate_no varchar(30)
    );


INSERT INTO cabs VALUES('C1','AC','Innova','Micro','1980','Blue','Yes','HR26DQ5551');
INSERT INTO cabs VALUES('C2','Non AC','Toyota','Coupe','1983','Black','Yes','DL14CD4007');
INSERT INTO cabs VALUES('C3','AC','Indica','Auto','1990','Yellow','Yes','21 BH 0001 AA');
INSERT INTO cabs VALUES('C4','AC','Innova','Hatchback','1980','Orange','Yes','PK07LVD');
INSERT INTO cabs VALUES('C5','Non AC','Honda','Liftback','1984','Red','Yes','EQ1316');
INSERT INTO cabs VALUES('C6','AC','Ford','Pickup','2007','Gray','Yes','IT20BOM');
INSERT INTO cabs VALUES('C7','Non AC','Nissan','Minivan','1979','White','No','DL3CBC');
INSERT INTO cabs VALUES('C8','AC','Indica','Crossover','1996','Violet','Yes','WB06F5977');
INSERT INTO cabs VALUES('C9','AC','Toyota','Targa','1983','Black','Yes','1C78N89');
INSERT INTO cabs VALUES('C10','Non AC','Ford','Limousine','2007','Purple','Yes','TN99F2378');


CREATE TABLE cabs_type(
    cab_id varchar(10),
    CONSTRAINT type_cabid_FK FOREIGN KEY(cab_ID)REFERENCES cabs(cab_id),
    cab_type VARCHAR(10),
    cab_details varchar(35),
    cab_max_people int
    );


INSERT INTO cabs_type VALUES('C1','AC','Family trips',4);
INSERT INTO cabs_type VALUES('C2','Non AC','Corporate Travels',2);
INSERT INTO cabs_type VALUES('C2','AC','Airport pickdrop',3);
INSERT INTO cabs_type VALUES('C4','AC','Family trips',5);
INSERT INTO cabs_type VALUES('C1','Non AC','Airport pickdrop',2);
INSERT INTO cabs_type VALUES('C6','AC','Senior Citizens',6);
INSERT INTO cabs_type VALUES('C7','Non AC','Children',3);
INSERT INTO cabs_type VALUES('C8','AC','Corporate Travels',5);
INSERT INTO cabs_type VALUES('C6','AC','Senior Citizens',4);
INSERT INTO cabs_type VALUES('C7','Non AC','Children',3);


CREATE TABLE driver(
    driv_id VARCHAR(10),
    PRIMARY KEY(driv_id),
    CHECK(driv_id LIKE'D%'),
    driv_first_name VARCHAR(20),
    driv_last_name varchar(15),
    driv_email VARCHAR(20),
    driv_ph_no varchar(14),
    UNIQUE(driv_ph_no),
    driv_gender varchar(8),
    driv_dob varchar(20),
    rating float(5),
    driv_verified varchar(10),
    driv_document varchar(20),
    driv_login varchar(15),
    driv_logout varchar(15),
    driv_travel varchar(15),
    travel_distance varchar(10), 
    driv_payment varchar(10),
    driv_incentive varchar(10),
    driv_status varchar(15),
    driv_role varchar(15),
    cab_id varchar(10),
    CONSTRAINT driver_cabid_FK FOREIGN KEY(cab_ID)REFERENCES cabs(cab_id)
    );


INSERT INTO driver VALUES('D1','Rick','Novak','rick@gmail.com','8867895111','Male','12-Apr-1990',5,'Yes','given','03-Mar-2022','09-Mar-2023','03-Mar-2022','100km','2000',500,'active','Regular','C1');
INSERT INTO driver VALUES('D2','Susan','Connor','susan@gmail.com','8867895222','Male','12-Jan-1991',4,'Yes','given','04-Jan-2023','07-Jan-2023','13-Jan-2022','100km','5000',300,'active','Regular','C3');
INSERT INTO driver VALUES('D3','Margaret','Adelman','margaret@gmail.com','8867895333','Female','10-Apr-1890',3,'Yes','given','12-Feb-2023','26-Feb-2023','13-Feb-2022','50km','1000',800,'active','Not Often','C2');
INSERT INTO driver VALUES('D4','Ronald','Barr','ronald@gmail.com','8867895444','Male','03-Oct-1895',5,'Yes','given','03-Mar-2022','12-Mar-2023','03-Mar-2022','100km','9000',200,'active','Regular','C2');
INSERT INTO driver VALUES('D5','Marie','Broadbet','marie@gmail.com','8867895555','Female','19-Apr-1988',1,'No','given','15-Jan-2023','25-Jan-2023','23-Jan-2023','60km','5500',100,'active','Regular','C4');
INSERT INTO driver VALUES('D6','Roger','Lum','roger@gmail.com','8867895666','Male','02-Sep-1899',4,'Yes','given','05-Feb-2023','13-Feb-2023','09-Feb-2022','200km','6000',400,'active','Regular','C1');
INSERT INTO driver VALUES('D7','Marlene','Donahue','marlene@gmail.com','8867895777','Female','22-May-1960',4,'Yes','given','16-Mar-2023','19-Mar-2023','18-Mar-2022','20km','4000',750,'active','Regular','C7');
INSERT INTO driver VALUES('D8','Jeff','Johnson','jeff@gmail.com','8867895888','Male','16-Mar-1894',5,'Yes','given','02-Mar-2023','07-Mar-2023','03-Mar-2022','60km','7000',600,'active','Regular','C5');
INSERT INTO driver VALUES('D9','Melvin','Forbis','melvin@gmail.com','8867895999','Male','10-Mar-1891',2,'No','given','03-Jan-2023','12-Jan-2023','03-Jan-2022','110km','5000',300,'active','Regular','C8');
INSERT INTO driver VALUES('D10','John','Pravin','pravin@gmail.com','8867895000','Male','21-Oct-1897',3,'Yes','given','22-Jan-2023','25-Oct-2023','24-Jan-2022','50km','3000',250,'active','Not Often','C9');


CREATE TABLE driver_payment(
    driv_id VARCHAR(10),
    CONSTRAINT driver_drivid_FK FOREIGN KEY(driv_ID)REFERENCES driver(driv_id),
    driv_payment varchar(10),
    driv_due varchar(10),
    driv_paid varchar(10),
    driv_paid_date varchar(15)
    );


INSERT INTO driver_payment VALUES('D10','3000','1000','2000','26-Jan-2023');
INSERT INTO driver_payment VALUES('D1','2000','0','2000','10-Mar-2023');
INSERT INTO driver_payment VALUES('D5','5500','0','5500','27-Jan-2023');
INSERT INTO driver_payment VALUES('D4','4000','0','4000','12-Mar-2023');
INSERT INTO driver_payment VALUES('D3','1000','500','500','27-Feb-2023');
INSERT INTO driver_payment VALUES('D9','5000','3000','2000','15-Jan-2023');
INSERT INTO driver_payment VALUES('D7','4000','1000','3000','21-Mar-2023');
INSERT INTO driver_payment VALUES('D8','7000','2000','5000','10-Mar-2023');
INSERT INTO driver_payment VALUES('D6','6000','3000','3000','14-Feb-2023');
INSERT INTO driver_payment VALUES('D2','5000','4000','1000','07-Jan-2023');


CREATE TABLE driver_document(
    driv_id VARCHAR(10),
    CONSTRAINT document_drivid_FK FOREIGN KEY(driv_ID)REFERENCES driver(driv_id),
    driv_document varchar(20),
    driv_document_type varchar(30),
    driv_docs_name varchar(45),
    driv_docs_status varchar(25),
    driv_docs_expire_date varchar(25)
    );


INSERT INTO driver_document VALUES('D1','given','International','Driving Licence','Verified','26-Jan-2024');
INSERT INTO driver_document VALUES('D10','given','Permanent','Driving Licence','Verified','10-Mar-2025');
INSERT INTO driver_document VALUES('D5','given','Learner','Driving Licence','Verified','27-Jan-2023');
INSERT INTO driver_document VALUES('D4','given','International','Driving Licence','Verified','12-Mar-2026');
INSERT INTO driver_document VALUES('D3','given','Permanent','Driving Licence','Verified','27-Feb-2024');
INSERT INTO driver_document VALUES('D9','given','Commercial','Driving Licence','Verified','15-Jan-2025');
INSERT INTO driver_document VALUES('D7','given','Permanent','Driving Licence','Verified','21-Mar-2027');
INSERT INTO driver_document VALUES('D8','given','Commercial','Driving Licence','Verified','10-Mar-2025');
INSERT INTO driver_document VALUES('D6','given','Commercial','Driving Licence','Verified','14-Feb-2024');
INSERT INTO driver_document VALUES('D2','given','Permanent','Driving Licence','Verified','15-Mar-2023');


CREATE TABLE promo_code(
    promo_code_id VARCHAR(10),
    PRIMARY KEY(promo_code_id),
    CHECK(promo_code_id LIKE'O%'),
    promo_number VARCHAR(20),
    discount varchar(8),
    promo_start_date VARCHAR(20),
    promo_end_date VARCHAR(20),
    pass_type varchar(40),
    max_per_user varchar(10),
    promo_status varchar(15),
    promo_used varchar(10)
    );


INSERT INTO promo_code VALUES('O1','mwcaa001',10,'03-Mar-2023','10-Mar-2023','Adult',10,'active','Yes');
INSERT INTO promo_code VALUES('O2','mwcaa002',50,'01-Mar-2023','09-Mar-2023','Card Carrying Member',12,'assigned','Yes');
INSERT INTO promo_code VALUES('O3','mwcaa003',100,'03-Feb-2023','09-Feb-2023','Agent',4,'unassigned','No');
INSERT INTO promo_code VALUES('O4','TEMPLECITY',30,'03-Apr-2023','09-Apr-2023','Adult',13,'active','Yes');
INSERT INTO promo_code VALUES('O5','mwcaa005',20,'13-Mar-2023','29-Mar-2023','Commuter',8,'active','Yes');
INSERT INTO promo_code VALUES('O6','mwcaa006',70,'18-Mar-2023','09-Apr-2023','Emigrant',10,'unassigned','No');
INSERT INTO promo_code VALUES('O7','mwcaa007',65,'03-Jan-2023','01-Feb-2023','Frequent User',9,'assigned','Yes');
INSERT INTO promo_code VALUES('O8','TEMPLECITY',40,'03-Feb-2023','19-Mar-2023','Agent',11,'unassigned','No');
INSERT INTO promo_code VALUES('O9','mwcaa009',75,'03-Mar-2023','21-Mar-2023','Frequent User',3,'active','Yes');
INSERT INTO promo_code VALUES('O10','mwcaa0010',100,'03-Apr-2023','15-Apr-2023','Adult',2,'active','Yes');


CREATE TABLE promo_use(
    promo_code_id VARCHAR(10), 
    CONSTRAINT promo_promocodeid_FK FOREIGN KEY(promo_code_id)REFERENCES promo_code(promo_code_id),
    pass_id VARCHAR(10), 
    CONSTRAINT promo_passid_FK FOREIGN KEY(pass_id)REFERENCES passenger(pass_id),
    promo_used varchar(10),
    pass_applied varchar(15),
    pass_applied_date VARCHAR(20),
    pass_used varchar(10)
    );


INSERT INTO promo_use VALUES('O1','P1','Yes','Yes','05-Mar-2023','Yes');
INSERT INTO promo_use VALUES('O2','P6','No','Yes','04-Mar-2023','Yes');
INSERT INTO promo_use VALUES('O3','P3','Yes','Yes','07-Feb-2023','No');
INSERT INTO promo_use VALUES('O5','P4','Yes','Yes','03-Apr-2023','Yes');
INSERT INTO promo_use VALUES('O4','P1','Yes','Yes','18-Mar-2023','Yes');
INSERT INTO promo_use VALUES('O6','P7','Yes','Yes','27-Mar-2023','No');
INSERT INTO promo_use VALUES('O7','P9','Yes','Yes','21-Jan-2023','Yes');
INSERT INTO promo_use VALUES('O9','P2','No','Yes','11-Mar-2023','Yes');
INSERT INTO promo_use VALUES('O8','P5','Yes','Yes','16-Mar-2023','No');
INSERT INTO promo_use VALUES('O10','P3','Yes','Yes','09-Apr-2023','Yes');


CREATE TABLE cancel_reason(
    trip_cancel_id VARCHAR(10),
    PRIMARY KEY(trip_cancel_id),
    CHECK(trip_cancel_id LIKE'T%'),
    pass_id VARCHAR(10), 
    CONSTRAINT cancel_passid_FK FOREIGN KEY(pass_id)REFERENCES passenger(pass_id),
    driv_id VARCHAR(10), 
    CONSTRAINT cancel_drivid_FK FOREIGN KEY(driv_id)REFERENCES driver(driv_id),
    cancel_reason VARCHAR(35),
    cancel_date VARCHAR(16),
    is_active varchar(10)
    );


INSERT INTO cancel_reason VALUES('T1','P1','D5','Medical reasons','12-Jan-2023','No');
INSERT INTO cancel_reason VALUES('T2','P2','D5','Financial Default','02-Jan-2023','Yes');
INSERT INTO cancel_reason VALUES('T3','P6','D5','Death','22-Mar-2023','No');
INSERT INTO cancel_reason VALUES('T4','P1','D2','Change of Employment','12-Apr-2023','Yes');
INSERT INTO cancel_reason VALUES('T5','P4','D1','Residence Damage','18-Feb-2023','Yes');
INSERT INTO cancel_reason VALUES('T6','P9','D5','Natural Disaster','23-Mar-2023','No');
INSERT INTO cancel_reason VALUES('T7','P2','D5','Injury','12-Jan-2023','Yes');
INSERT INTO cancel_reason VALUES('T8','P5','D5','Illness','01-Jan-2023','No');
INSERT INTO cancel_reason VALUES('T9','P8','D5','Traffic Accidents','02-Apr-2023','Yes');
INSERT INTO cancel_reason VALUES('T10','P2','D5','Weather','29-Jan-2023','Yes');
INSERT INTO cancel_reason VALUES('T11','P1','D5','Injury','02-Feb-2023','Yes');
INSERT INTO cancel_reason VALUES('T12','P5','D5','Medical Reasons','26-Jan-2023','No');
INSERT INTO cancel_reason VALUES('T13','P3','D5','Death','07-Mar-2023','No');


CREATE TABLE payment_mode(
    payment_id varchar(10),
    PRIMARY KEY(payment_id),
    CHECK(payment_id LIKE'M%'),
    payment_method VARCHAR(20),
    payment_details varchar(20)
    );


INSERT INTO payment_mode VALUES('M1','Offline Payment','Cash');
INSERT INTO payment_mode VALUES('M2','Google Pay','Trans_id');
INSERT INTO payment_mode VALUES('M3','UPI','Upi_id');
INSERT INTO payment_mode VALUES('M4','Mobile_banking','Acc_no');
INSERT INTO payment_mode VALUES('M5','Mobile Wallets','Bank_acc_no');
INSERT INTO payment_mode VALUES('M6','G Pay','pay_id');
INSERT INTO payment_mode VALUES('M7','Paytm','Paytm_no');
INSERT INTO payment_mode VALUES('M8','PhonePe','Phonepe_no');
INSERT INTO payment_mode VALUES('M9','Amazon pay','amazon_id');
INSERT INTO payment_mode VALUES('M10','BHIM','Bhim_id');


CREATE TABLE ride(
    ride_id VARCHAR(10),
    PRIMARY KEY(ride_id),
    CHECK(ride_id LIKE'R%'),
    driv_id varchar(10),
    CONSTRAINT ride_drivid_FK FOREIGN KEY(driv_ID)REFERENCES driver(driv_id),
    pass_id varchar(10),
    CONSTRAINT ride_passid_FK FOREIGN KEY(pass_ID)REFERENCES passenger(pass_id),
    promo_code_id varchar(10),
    CONSTRAINT ride_promoid_FK FOREIGN KEY(promo_code_ID)REFERENCES promo_code(promo_code_id),
    payment_id varchar(10),
    CONSTRAINT ride_paymentid_FK FOREIGN KEY(payment_id)REFERENCES payment_mode(payment_id),  
    trip_cancel_id varchar(10),
    CONSTRAINT ride_tripid_FK FOREIGN KEY(trip_cancel_ID)REFERENCES cancel_reason(trip_cancel_id),
    cab_id varchar(10),
    CONSTRAINT ride_cabid_FK FOREIGN KEY(cab_ID)REFERENCES cabs(cab_id),
    ride_code VARCHAR(15),
    pass_req_time varchar(15),
    pass_req_place varchar(60),
    ride_start_time VARCHAR(15),
    delay_time VARCHAR(15),
    ride_end_time VARCHAR(15),
    ride_status varchar(10),
    expected_amount varchar(20),
    expected_distance varchar(20),
    expected_duration varchar(30),
    total_distance varchar(20),
    total_duration varchar(30),
    ride_date varchar(15),
    total_amount varchar(15)
    );


INSERT INTO ride VALUES('R1','D1','P1','O1','M1','T1','C1','TR123','1PM','Chennai,Mugappair','1:30PM','0min','2PM','Running','500','280km','two hr','270','one and half hr','04-Mar-2023','450');
INSERT INTO ride VALUES('R2','D4','P9','O4','M2','T5','C3','TR234','11PM','Chennai,T.Nagar','12PM','25min','1:25PM','Running','400','390km','three hr','400','three hr 25 min','28-Mar-2022','350');
INSERT INTO ride VALUES('R3','D2','P9','O2','M7','T2','C5','TR345','10AM','Salem,Attur','11:30AM','30min','12:30PM','Reached','200','120km','one hr','200','one and half hr','21-Jan-2022','250');
INSERT INTO ride VALUES('R4','D7','P1','O5','M1','T5','C6','TR456','8PM','Chennai,Tambaram','8:30PM','0min','10PM','Reached','300','380km','three hr','370','two and half hr','10-Feb-2022','300');
INSERT INTO ride VALUES('R5','D2','P2','O9','M9','T2','C2','TR567','6PM','Tuticorin,Eral','6:15PM','30min','8PM','Running','100','280km','one and half hr','300','two hr','09-Jan-2023','150');
INSERT INTO ride VALUES('R6','D8','P4','O6','M4','T4','C3','TR678','2PM','Madurai,Chavadi','2:10PM','0min','3PM','Reached','280','220km','one hr','210','half an hr 25 min','17-Apr-2023','250');
INSERT INTO ride VALUES('R7','D6','P9','O8','M2','T5','C1','TR789','9:30AM','Chennai,Ashok Nagar','9:35AM','25min','11AM','Running','380','300km','two hr','400','two hr','04-Mar-2022','450');
INSERT INTO ride VALUES('R8','D1','P2','O2','M9','T3','C8','TR890','3PM','Salem,Edappadi','3:05PM','0min','4:30PM','Reached','170','18km','one hr','200','one hr','12-Feb-2023','170');
INSERT INTO ride VALUES('R9','D6','P7','O3','M7','T6','C5','TR156','8AM','Madurai,Melur','8:20AM','0min','9:15AM','Running','500','475km','half an hr','500','half an hr','04-Jan-2023','450');
INSERT INTO ride VALUES('R10','D6','P4','O7','M4','T7','C6','TR012','5PM','Tuticorin,Tiruchendur','5:10PM','00min','6PM','Reached','100','8km','one hr','9','half an hr','14-Mar-2023','90');


CREATE TABLE cabs_route(
    ride_id varchar(10),
    CONSTRAINT cabsroute_rideid_FK FOREIGN KEY(ride_ID)REFERENCES ride(ride_id),
    driv_id varchar(10),
    CONSTRAINT cabsroute_drivid_FK FOREIGN KEY(driv_ID)REFERENCES driver(driv_id),
    pass_id varchar(10),
    CONSTRAINT cabsroute_passid_FK FOREIGN KEY(pass_ID)REFERENCES passenger(pass_id),
    cab_id varchar(10),
    CONSTRAINT cabsroute_cabid_FK FOREIGN KEY(cab_ID)REFERENCES cabs(cab_id),
    cab_requested varchar(10),
    cab_request_no varchar(10),
    cab_booked varchar(10),
    cab_ontrip varchar(10),
    cab_current_loc varchar(25)
    );


INSERT INTO cabs_route VALUES('R1','D1','P1','C1','Yes','11','Yes','Yes','Madurai');
INSERT INTO cabs_route VALUES('R2','D4','P2','C4','Yes','12','Yes','Yes','Ooty');
INSERT INTO cabs_route VALUES('R1','D3','P7','C2','Yes','13','Yes','Yes','Tuticorin');
INSERT INTO cabs_route VALUES('R4','D7','P1','C2','Yes','14','Yes','Yes','Theni');
INSERT INTO cabs_route VALUES('R3','D2','P2','C9','Yes','15','Yes','Yes','Madurai');
INSERT INTO cabs_route VALUES('R6','D8','P5','C6','Yes','16','No','No','Chennai');
INSERT INTO cabs_route VALUES('R2','D6','P2','C8','Yes','17','Yes','Yes','Madurai');
INSERT INTO cabs_route VALUES('R8','D1','P5','C2','Yes','18','Yes','Yes','Trichy');
INSERT INTO cabs_route VALUES('R7','D6','P7','C3','Yes','19','Yes','Yes','Salem');
INSERT INTO cabs_route VALUES('R10','D6','P4','C7','Yes','20','Yes','Yes','Ooty');


CREATE TABLE ride_status(
    ride_id varchar(10),
    CONSTRAINT ridestatus_rideid_FK FOREIGN KEY(ride_ID)REFERENCES ride(ride_id),
    driv_id varchar(10),
    CONSTRAINT ridestatus_drivid_FK FOREIGN KEY(driv_ID)REFERENCES driver(driv_id),
    pass_id varchar(10),
    CONSTRAINT ridestatus_passid_FK FOREIGN KEY(pass_ID)REFERENCES passenger(pass_id),
    cab_id varchar(10),
    CONSTRAINT ridestaus_cabid_FK FOREIGN KEY(cab_ID)REFERENCES cabs(cab_id),
    trip_status varchar(10),
    current_loc_id varchar(15),
    current_loc_name varchar(20),
    current_date_time varchar(40)
    );


INSERT INTO ride_status VALUES('R1','D1','P1','C1','Pending','TN01','Chennai','05-Mar-2023 2PM');
INSERT INTO ride_status VALUES('R2','D4','P2','C4','Running','TN43','Ooty','03-Apr-2023 3PM');
INSERT INTO ride_status VALUES('R3','D3','P7','C2','Reached','TN64','Madurai','11-Mar-2023 10PM');
INSERT INTO ride_status VALUES('R4','D7','P7','C6','Reached','TN01','Chennai','18-Mar-2023 8PM');
INSERT INTO ride_status VALUES('R3','D2','P2','C9','Pending','TN43','Ooty','03-Apr-2023 6PM');
INSERT INTO ride_status VALUES('R6','D8','P5','C6','Running','TN69','Tuticorin','04-Mar-2023 11AM');
INSERT INTO ride_status VALUES('R3','D6','P2','C8','Reached','TN64','Madurai','16-Mar-2023 12:30PM');
INSERT INTO ride_status VALUES('R8','D4','P5','C6','Running','TN81','Trichy','09-Apr-2023 1:25PM');
INSERT INTO ride_status VALUES('R7','D6','P7','C3','Running','TN60','Theni','07-Feb-2023 11AM');
INSERT INTO ride_status VALUES('R10','D4','P4','C7','Reached','TN64','Madurai','27-Mar-2023 8PM');


/*Description of the tables*/
DESC passenger;
DESC phone_verification;
DESC cabs;
DESC cabs_type;
DESC driver;
DESC driver_payment;
DESC driver_document;
DESC promo_code;
DESC promo_use;
DESC cancel_reason;
DESC payment_mode;
DESC ride;
DESC cabs_route;
DESC ride_status;

/*Printing the tables*/
SELECT * FROM passenger;
SELECT * FROM cabs;
SELECT * FROM phone_verification;
SELECT * FROM cabs_type;
SELECT * FROM driver_payment;
SELECT * FROM driver;
SELECT * FROM driver_document;
SELECT * FROM promo_code;
SELECT * FROM promo_use;
SELECT * FROM cancel_reason;
SELECT * FROM payment_mode;
SELECT * FROM ride;
SELECT * FROM cabs_route;
SELECT * FROM ride_status;