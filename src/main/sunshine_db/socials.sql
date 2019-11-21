create table socials
(
	id int(7) not null
		primary key,
	org_id int(7) null,
	sm_type varchar(2) null,
	sm_address varchar(50) null,
	constraint org_social_media_orgs_id_fk
		foreign key (org_id) references contacts (id),
	constraint org_social_media_soc_med_types_social_media_type_fk
		foreign key (sm_type) references soc_med_types (social_media_type)
);

create definer = merrymac@localhost trigger before_insert_socials
before INSERT on socials
for each row
begin
    SET new.id = get_next_gid();
end;

