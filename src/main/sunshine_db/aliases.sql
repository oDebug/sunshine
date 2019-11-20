create table aliases
(
	id int auto_increment
		primary key,
	contact_id int(7) not null,
	name varchar(55) not null,
	constraint org_alias_orgs_id_fk
		foreign key (contact_id) references contacts (id)
);

