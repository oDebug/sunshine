create table addresses
(
	id int(7) not null
		primary key,
	org_id int(7) not null,
	street varchar(100) not null,
	city varchar(50) not null,
	state varchar(2) not null,
	postal_code int(5) not null,
	constraint org_address_orgs_id_fk
		foreign key (org_id) references contacts (id)
			on delete cascade
);

create definer = merrymac@localhost trigger before_insert_address
before INSERT on addresses
for each row
begin
   SET new.id = get_next_gid();
end;