create table contacts
(
    id int(7) not null
        primary key,
    name varchar(45) not null,
    type varchar(20) not null,
    denomination varchar(30) null,
    create_timestamp timestamp null,
    create_user varchar(10) null,
    last_update_timestamp timestamp null,
    last_update_user varchar(10) null,
    status_code varchar(1) default 'A' not null,
    delete_timestamp timestamp null,
    delete_user varchar(10) null,
    email varchar(60) null
)
    comment 'Table for Organization data';

create index contact_types_type_code_fk
    on contacts (type);

create definer = root@localhost trigger after_insert_contacts
    after INSERT on contacts
    for each row
BEGIN
    INSERT into sunshine.aliases(contact_id, name)
    VALUES (new.id, new.name);
END;

create definer = merrymac@localhost trigger before_insert_contacts
    before INSERT on contacts
    for each row
begin
    SET new.id = get_next_gid();
end;