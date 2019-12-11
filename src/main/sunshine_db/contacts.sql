create table sunshine.contacts
(
    id int(7) not null
        primary key,
    name varchar(45) not null,
    type varchar(20) not null,
    description varchar(30) null,
    create_timestamp timestamp null,
    create_user varchar(10) null,
    last_update_timestamp timestamp null,
    last_update_user varchar(10) null,
    status_code varchar(1) default 'A' not null,
    delete_timestamp timestamp null,
    delete_user varchar(10) null
)
    comment 'Table for Contact data';

create index contact_types_type_code_fk
    on sunshine.contacts (type);

create definer = root@localhost trigger sunshine.after_insert_contacts
    after INSERT on sunshine.contacts
    for each row
BEGIN
    INSERT into sunshine.aliases(contact_id, name)
    VALUES (new.id, new.id), (new.id, new.name);
END;

create definer = merrymac@localhost trigger sunshine.before_insert_contacts
    before INSERT on sunshine.contacts
    for each row
begin
    SET new.id = get_next_gid();
end;

create definer = merrymac@localhost trigger sunshine.after_update_contacts
    after UPDATE on sunshine.contacts
    for each row
begin
    IF (new.name != old.name) THEN
        update sunshine.aliases set name = new.name WHERE contact_id = old.id AND name = old.name;
    END IF;
end;