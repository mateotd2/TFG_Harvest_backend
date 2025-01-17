insert into Rol(name) values ('ROLE_ADMIN')
insert into Rol(name) values ('ROLE_CAPATAZ')
insert into Rol(name) values ('ROLE_TRACTORISTA')
--
----

insert into Empleado ( name,lastname, dni, nss, phone,birthdate, direccion, email, username, password) values ('miguel','garcia','12345678A','123456789012','666666666','1990-06-15','Direccion ', 'miguelon@gmail.com','miguelAdmin','$2a$10$9FEGLP52a3v6kPZzSjPwiekP/6H15IAAHAEaguMoeIzREdXh4iEiW')

insert into USER_ROLES (role_id,user_id) values (1,1)
insert into USER_ROLES (role_id,user_id) values (2,1)
insert into USER_ROLES (role_id,user_id) values (3,1)

insert into Trabajador( name,lastname, dni, nss, phone,birthdate,address,available, in_task) values ('trabajador1','garcia1','12145678A','123456789012','111111111','1990-06-15','Direccion',true, false)
insert into Trabajador( name,lastname, dni, nss, phone,birthdate,address,available, in_task) values ('trabajador2','garcia2','98265432A','210987654321','222222222','1990-06-15','Direccion',true, false)
insert into Trabajador( name,lastname, dni, nss, phone,birthdate,address,available, in_task) values ('trabajador3','garcia3','19383847A','211029384756','333333333','1990-06-15','Direccion',true, false)
insert into Trabajador( name,lastname, dni, nss, phone,birthdate,address,available, in_task) values ('trabajador4','garcia4','12845678A','123456784012','111111111','1990-06-15','Direccion',true, false)
insert into Trabajador( name,lastname, dni, nss, phone,birthdate,address,available, in_task) values ('trabajador5','garcia5','98565432A','210987652321','222222222','1990-06-15','Direccion',true, false)
insert into Trabajador( name,lastname, dni, nss, phone,birthdate,address,available, in_task) values ('trabajador6','garcia6','19783847A','211029385756','333333333','1990-06-15','Direccion',true, false)
insert into Trabajador( name,lastname, dni, nss, phone,birthdate,address,available, in_task) values ('trabajador7','garcia7','12845671A','123456786012','111111111','1990-06-15','Direccion',true, false)
insert into Trabajador( name,lastname, dni, nss, phone,birthdate,address,available, in_task) values ('trabajador8','garcia8','9865432A','210987657321','222222222','1990-06-15','Direccion',true, false)
insert into Trabajador( name,lastname, dni, nss, phone,birthdate,address,available, in_task) values ('trabajador9','garcia9','10283847A','211029388756','333333333','1990-06-15','Direccion',true, false)
insert into Trabajador( name,lastname, dni, nss, phone,birthdate,address,available, in_task) values ('trabajador10','garcia10','19343679A','123456989012','111111111','1990-06-15','Direccion',true, false)
insert into Trabajador( name,lastname, dni, nss, phone,birthdate,address,available, in_task) values ('trabajador11','garcia11','92765432A','210987054321','222222222','1990-06-15','Direccion',true, false)
insert into Trabajador( name,lastname, dni, nss, phone,birthdate,address,available, in_task) values ('trabajador12','garcia12','11283847A','211029184756','333333333','1990-06-15','Direccion',true, false)
insert into Trabajador( name,lastname, dni, nss, phone,birthdate,address,available, in_task) values ('trabajador13','garcia10','19341679A','223456989012','111111111','1990-06-15','Direccion',true, false)
insert into Trabajador( name,lastname, dni, nss, phone,birthdate,address,available, in_task) values ('trabajador14','garcia11','92762462A','310987054321','222222222','1990-06-15','Direccion',true, false)
insert into Trabajador( name,lastname, dni, nss, phone,birthdate,address,available, in_task) values ('trabajador15','garcia12','17283887A','411029184756','333333333','1990-06-15','Direccion',true, false)


insert into Disponibilidad (daywork, checkin, checkout,trabajador_id,attendance) values (CURRENT_DATE,'00:01:00','23:59:00',1,true)
insert into Disponibilidad (daywork, checkin, checkout,trabajador_id,attendance) values (CURRENT_DATE+1,'08:30:00','23:59:00',1,false)
insert into Disponibilidad (daywork, checkin, checkout,trabajador_id,attendance) values ('2023-10-25','08:30:00','23:59:00',1,true)
--insert into Disponibilidad (daywork, checkin, checkout,trabajador_id,attendance) values (CURRENT_DATE,'08:30:00','14:30:00',2,true)
insert into Disponibilidad (daywork, checkin, checkout,trabajador_id,attendance) values (CURRENT_DATE+1,'08:30:00','14:30:00',2,true)
insert into Disponibilidad (daywork, checkin, checkout,trabajador_id,attendance) values ('2023-10-25','08:30:00','14:30:00',2,false)
--insert into Disponibilidad (daywork, checkin, checkout,trabajador_id,attendance) values (CURRENT_DATE,'08:30:00','14:30:00',3,false)
insert into Disponibilidad (daywork, checkin, checkout,trabajador_id,attendance) values (CURRENT_DATE+1,'08:30:00','14:30:00',3,false)
insert into Disponibilidad (daywork, checkin, checkout,trabajador_id,attendance) values ('2023-10-25','08:30:00','14:30:00',3,false)
insert into Disponibilidad (daywork, checkin, checkout,trabajador_id,attendance) values (CURRENT_DATE,'00:01:00','23:59:00',2,true)
insert into Disponibilidad (daywork, checkin, checkout,trabajador_id,attendance) values (CURRENT_DATE,'00:01:00','23:30:00',3,true)
insert into Disponibilidad (daywork, checkin, checkout,trabajador_id,attendance) values (CURRENT_DATE,'00:01:00','23:59:00',4,true)


insert into Zona (name, surface, description, formation, reference) values ('Zona 1', 200, 'Descripcion de zona 1', 'ESPALDERA', '12345678901234567890')
insert into Zona (name, surface, description, formation, reference) values ('Zona 2', 200, 'Descripcion de zona 2', 'EMPARRADO', '12345678901234567891')

insert into Tipo_Vid (name, years_Maturity, description) values ('Vitis vinifera', 15, 'La vid o parra, cuyo nombre científico es Vitis vinifera, es una planta semi...')
insert into Tipo_Vid (name, years_Maturity, description) values ('Vitis vinifera 2', 15, 'La vid o parra, cuyo nombre científico es Vitis vinifera, es una planta semileñosa o trepadora que cuando se deja crecer libremente puede alcanzar más de 30 m, pero que, por la acción humana, podándola anualmente, queda reducida a un pequeño arbusto...')

insert into Linea (line_Number, planting_Date, harvest_Enabled, distance, tipo_vid_id, zona_id) values (1, '2000-10-25', true, 50, 1, 1)
insert into Linea (line_Number, planting_Date, harvest_Enabled, distance, tipo_vid_id, zona_id) values (2, '2000-10-25', true, 60, 1, 1)
insert into Linea (line_Number, planting_Date, harvest_Enabled, distance, tipo_vid_id, zona_id) values (3, '2020-10-25', false,70, 2, 1)
insert into Linea (line_Number, planting_Date, harvest_Enabled, distance, tipo_vid_id, zona_id) values (4, '2000-10-25', true, 80, 1, 1)

insert into Linea (line_Number, planting_Date, harvest_Enabled, distance, tipo_vid_id, zona_id) values (5, '2000-10-25', true, 20, 1, 2)
insert into Linea (line_Number, planting_Date, harvest_Enabled, distance, tipo_vid_id, zona_id) values (6, '2000-10-25', true, 20, 1, 2)
insert into Linea (line_Number, planting_Date, harvest_Enabled, distance, tipo_vid_id, zona_id) values (7, '2020-10-25', false,20, 2, 2)
insert into Linea (line_Number, planting_Date, harvest_Enabled, distance, tipo_vid_id, zona_id) values (8, '2000-10-25', true, 20, 1, 2)


insert into Tractor (license_Plate,brand, model, max_Load, box_Capacity,en_Tarea ) values ('R 0000 XYZ','ALGAZA','RL-14', 400, 80,false)
insert into Tractor (license_Plate,brand, model, max_Load, box_Capacity,en_Tarea ) values ('R 0001 XYZ','ALGAZA','RL-14', 400, 80,false)


