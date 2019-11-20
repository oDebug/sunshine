create schema sunshine collate utf8mb4_general_ci;

create table gid_seq
(
    gid int(7) not null
        primary key
)
    comment 'GUID Generator';

create table org_types
(
    type_desc varchar(25) not null,
    type_code varchar(2) not null
        primary key
);

create table orgs
(
    id int(7) not null
        primary key,
    org_name varchar(45) not null,
    org_type varchar(2) not null,
    create_timestamp timestamp null,
    create_user varchar(10) null,
    last_update_timestamp timestamp null,
    last_update_user varchar(10) null,
    status_code varchar(1) default 'A' not null,
    delete_timestamp timestamp null,
    delete_user varchar(10) null,
    constraint orgs_org_types_type_code_fk
        foreign key (org_type) references contact_types (type_code)
)
    comment 'Table for Contact data';

create table org_actions
(
    id int(7) not null
        primary key,
    action_type varchar(20) not null,
    complete_status tinyint(1) default 0 null,
    action_notes text null,
    create_user varchar(10) null,
    create_date date not null,
    complete_date date null,
    complete_user varchar(10) null,
    org_id int(7) null,
    due_date date not null,
    constraint org_actions_orgs_id_fk
        foreign key (org_id) references contacts (id)
);

create definer = merrymac@localhost trigger before_insert_org_actions
    before INSERT on org_actions
    for each row
begin
    SET new.id = get_next_gid();
end;

create table org_address
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

create definer = merrymac@localhost trigger before_insert_org_address
    before INSERT on org_address
    for each row
begin
    SET new.id = get_next_gid();
end;

create table org_alias
(
    id int auto_increment
        primary key,
    org_id int(7) not null,
    org_name varchar(55) not null,
    constraint org_alias_orgs_id_fk
        foreign key (org_id) references contacts (id)
);

create table org_phone
(
    id int(7) not null
        primary key,
    org_id int(7) null,
    phone bigint not null,
    constraint org_phone_id_phone_uindex
        unique (id, phone),
    constraint org_phone_orgs_id_fk
        foreign key (org_id) references contacts (id)
)
    comment 'Phone numbers for Organizations';

create index org_phone_id_index
    on org_phone (id);

create definer = root@localhost trigger after_insert_orgs
    after INSERT on orgs
    for each row
BEGIN
    INSERT into sunshine.aliases(contact_id, name)
    VALUES (new.id, new.org_name);
END;

create definer = merrymac@localhost trigger before_insert_orgs
    before INSERT on orgs
    for each row
begin
    SET new.id = get_next_gid();
end;

create table people
(
    id int(7) not null
        primary key,
    last_name varchar(45) null,
    first_name varchar(45) null,
    member_org int(7) null,
    create_timestamp timestamp default current_timestamp() not null on update current_timestamp(),
    create_user varchar(10) not null,
    last_update_timestamp timestamp null,
    last_update_user varchar(10) null,
    status_code varchar(1) default 'A' not null,
    delete_timestamp timestamp null,
    delete_user varchar(10) null,
    constraint people_orgs_id_fk
        foreign key (member_org) references contacts (id)
);

create definer = merrymac@localhost trigger before_insert_people
    before INSERT on people
    for each row
BEGIN
    DECLARE newAlias VARCHAR(100);
    SET newAlias = concat(new.first_name,' ',new.last_name);
    SET new.id = get_next_gid();
    INSERT into sunshine.ppl_alias(ppl_id, ppl_name)
    VALUES (new.id, newAlias);
END;

create table ppl_actions
(
    id int null,
    action_type tinytext null,
    complete_status tinyint null,
    action_notes mediumtext null,
    create_user tinytext null,
    create_date date null,
    complete_date date null,
    complete_user tinytext null,
    ppl_id int null,
    constraint ppl_actions_people_id_fk
        foreign key (ppl_id) references people (id)
);

create table ppl_address
(
    id int(7) not null
        primary key,
    ppl_id int(7) not null,
    street varchar(100) not null,
    city varchar(50) not null,
    state varchar(2) not null,
    zip_cde int(5) not null,
    constraint ppl_address_ppl_id_fk
        foreign key (ppl_id) references people (id)
            on delete cascade
);

create table ppl_alias
(
    ppl_id int(7) not null,
    ppl_name varchar(100) null,
    constraint ppl_alias_people_id_fk
        foreign key (ppl_id) references people (id)
            on delete cascade
);

create table soc_med_types
(
    social_media_type varchar(20) not null
        primary key,
    social_media_desc varchar(50) not null
);

create table org_social_media
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

create table ppl_social_media
(
    id int(7) null,
    ppl_id int(7) null,
    sm_type varchar(2) not null,
    sm_address varchar(100) null,
    constraint ppl_social_media_people_id_fk
        foreign key (ppl_id) references people (id),
    constraint social_media_soc_med_types_social_media_type_fk
        foreign key (sm_type) references soc_med_types (social_media_type)
)
    comment 'List of Social Media accounts for a contact';

create definer = root@localhost function get_next_gid() returns int(8)
begin
    DECLARE next_val int(8);
    update sunshine.gid_seq set gid = gid + 1;
    select gid into next_val from sunshine.gid_seq;

    return next_val;
end;

