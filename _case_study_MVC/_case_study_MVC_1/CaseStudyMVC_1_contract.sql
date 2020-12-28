use `casestudymvc`;
 -- __+__+__+__+__+
-- drop procedure getAllContract;
delimiter $$
create procedure getAllContract() 
begin
	select 	
		contract_id
        , contract_start_date
        , contract_end_date
        , contract_deposition
        , contract_total_money
		, employee.employee_name
        , customer.customer_name
        , service.service_name      
    from contract 
		join employee on contract.employee_id = employee.employee_id
		join customer on contract.customer_id = customer.customer_id
        join service on contract.service_id = service.service_id
    ;
end$$
delimiter ;
-- call getAllContract
select * from contract;
-- insert into contract
-- value (1, "2019-06-16", "2019-06-26", 500, 5000, 2, 2, 1);
-- delete from contract where contract_id = 0;

-- __+__+__+__+__+
-- drop procedure insertContract;
delimiter $$
create procedure insertContract
	( in cont_id int
	, in start_date date
    , in end_date date
	, in deposition double
    , in total_money double
    , in emp_id int
    , in cus_id int
    , in ser_id int    
	)
begin
	insert into contract
    value
		(`contract`.contract_id = cont_id
		, contract_start_date = start_date
		, contract_end_date = end_date
		, contract_deposition = deposition
		, contract_total_money = total_money
		, employee_id = emp_id
		, customer_id = cus_id
		, service_id = ser_id   
        )
	;
end$$
delimiter ;

select * from contract;
-- delete from contract where contract_id = 2;
insert into contract
value (2, "2018-06-18", "2018-06-28", 100, 2000, 2, 2, 1);
-- call insertContract(2, "2018-08-20", "2018-08-30", 200, 2000, 2, 2, 2);
-- Error Code: 1062. Duplicate entry '0' for key 'contract.PRIMARY'


