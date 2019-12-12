create table phone_numbers
(
    id int(7) not null
        primary key,
    contact_id int(7) null,
    phone bigint not null,
    phone_type varchar(10) null,
    extension int(7) null,
    constraint contact_phone_id_uindex
        unique (id, phone),
    constraint contact_phone_contacts_id_fk
        foreign key (contact_id) references contacts (id)
)
    comment 'Phone numbers for Contacts';

create index org_phone_id_index
    on phone_numbers (id);

create definer = merrymac@localhost trigger before_insert_phone
    before INSERT on phone_numbers
    for each row
begin
    SET new.id = get_next_gid();
end;

