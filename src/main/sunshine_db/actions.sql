create table actions
(
	id int(7) not null
		primary key,
	action_type varchar(20) not null,
	complete_status tinyint(1) default 0 null,
	action_notes varchar(255) null,
	create_user varchar(10) null,
	create_date date not null,
	complete_date date null,
	complete_user varchar(10) null,
	contact_id int(7) null,
	due_date date not null,
	constraint actions_contact_id_fk
		foreign key (contact_id) references contacts (id)
);

create definer = merrymac@localhost trigger before_insert_actions
before INSERT on actions
for each row
begin
   SET new.id = get_next_gid();
end;

