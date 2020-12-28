use `casestudymvc`;
-- select * from service;
-- __+__+__+__+__+__+__+__+__+__+__+__+__+__+__+__+__+__+__+__+__+__+__+__+
-- PROCEDURE SERVICE 

delimiter $$
create procedure getAllServiceType() 
begin
	select service_type_id, service_type_name     
    from service_type;
end$$
delimiter ;
-- call getAllServiceType

 -- __+__+__+__+__+
--  drop procedure getAllRentType
delimiter $$
create procedure getAllRentType() 
begin
	select 
		rent_type_id
        , rent_type_name
        , rent_type_cost
    from rent_type;
end$$
delimiter ;
-- call getAllRentType

 -- __+__+__+__+__+
-- drop procedure getAllService;
delimiter $$
create procedure getAllService() 
begin
	select 		
        service_id
        , service_name
        , service_area
        , service_cost
        , service_max_people
--         , rent_type_id
        , rent_type_name
        , rent_type_cost
--         , service_type_id
        , service_type_name
        , standard_room
        , description_other_convenient
        , pool_area
        , number_of_floors        
    from service 
		join service_type on service.service_type_id = service_type.service_type_id
        join rent_type on service.rent_type_id = rent_type.rent_type_id
    ;
end$$
-- delimiter ;
-- call getAllService

 -- __+__+__+__+
-- drop procedure insertService;
delimiter $$
create procedure getServiceById(
	in id int
    )
begin
	select 		
        service_id
        , service_name
        , service_area
        , service_cost
        , service_max_people
--         , rent_type_id
        , rent_type_name
        , rent_type_cost
--         , service_type_id
        , service_type_name
        , standard_room
        , description_other_convenient
        , pool_area
        , number_of_floors        
    from service 
		join service_type on service.service_type_id = service_type.service_type_id
        join rent_type on service.rent_type_id = rent_type.rent_type_id
	where service_id = id
    ; 
end$$
delimiter ;

-- __+__+__+__+
delimiter $$
create procedure searchServiceByName(in `name` VARCHAR(255)) 
begin
	select 		
        service_id
        , service_name
        , service_area
        , service_cost
        , service_max_people
--         , rent_type_id
        , rent_type_name
        , rent_type_cost
--         , service_type_id
        , service_type_name
        , standard_room
        , description_other_convenient
        , pool_area
        , number_of_floors        
    from service 
		join service_type on service.service_type_id = service_type.service_type_id
        join rent_type on service.rent_type_id = rent_type.rent_type_id    
    WHERE service_name LIKE concat('%',`name` ,'%') ;
end$$
delimiter ;
-- call searchByName("Serena")

-- __+__+__+__+
-- drop procedure insertService;
delimiter $$
create procedure insertService(
	in service_id int, 
    in service_name varchar(255),
    in service_area int,
    in service_cost double,
    in service_max_people int,
    in rent_type_id int,
    in service_type_id int,
    in standard_room varchar(255),
    in description_other_convenient varchar(255),
    in pool_area double,
    in number_of_floors int
	)
begin
	insert into service
    values 
		(
        service_id
        , service_name
        , service_area
        , service_cost
        , service_max_people
        , rent_type_id
        , service_type_id
        , standard_room
        , description_other_convenient
        , pool_area
        , number_of_floors
        )
	;
end$$
delimiter ;

-- __+__+__+__+
-- drop procedure updateService
delimiter $$
create procedure updateService(
	in service_id_new int, 
    in service_name_new varchar(255),
    in service_area_new int,
    in service_cost_new double,
    in service_max_people_new int,
    in rent_type_id_new int,
    in service_type_id_new int,
    in standard_room_new varchar(255),
    in description_other_convenient_new varchar(255),
    in pool_area_new double,
    in number_of_floors_new int
	)
begin
	update service
    set    
        service_name = service_name_new
        , service_area = service_area_new
        , service_cost = service_cost_new
        , service_max_people = service_max_people_new
        , rent_type_id = rent_type_id_new
        , service_type_id = service_type_id_new
        , standard_room = standard_room_new
        , description_other_convenient = description_other_convenient_new
        , pool_area = pool_area_new
        , number_of_floors = number_of_floors_new
	where service_id = service_id_new
	;
end$$
delimiter ;

-- __+__+__+__+
-- DROP PROCEDURE deleteServiceById;
delimiter $$
create procedure deleteServiceById(in id int) 
begin
	delete from service
    where service_id = id;
end$$
delimiter ;
