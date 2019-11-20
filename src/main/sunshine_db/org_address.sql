create table sunshine.org_address
(
    id          int(7)       not null
        primary key,
    org_id      int(7)       not null,
    street      varchar(100) not null,
    city        varchar(50)  not null,
    state       varchar(2)   not null,
    postal_code int(5)       not null,
    constraint org_address_orgs_id_fk
        foreign key (org_id) references sunshine.orgs (id)
            on delete cascade
);

create definer = merrymac@localhost trigger sunshine.before_insert_org_address
    before INSERT
    on sunshine.org_address
    for each row
begin
    SET new.id = get_next_gid();
end;


