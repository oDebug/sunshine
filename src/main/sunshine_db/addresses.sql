create table addresses
(
	id int(7) not null
		primary key,
	contact_id int(7) not null,
	street varchar(100) not null,
	city varchar(50) not null,
	state varchar(2) not null,
	postal_code int(5) not null,
	constraint address_contact_id_fk
		foreign key (contact_id) references contacts (id)
			on delete cascade
);

create definer = merrymac@localhost trigger before_insert_address
before INSERT on addresses
for each row
begin
   SET new.id = get_next_gid();
end;