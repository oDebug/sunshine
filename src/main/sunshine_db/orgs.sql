create table sunshine.orgs
(
    id                    int(7)                 not null
        primary key,
    org_name              varchar(45)            not null,
    org_type              varchar(2)             not null,
    create_timestamp      timestamp              null,
    create_user           varchar(10)            null,
    last_update_timestamp timestamp              null,
    last_update_user      varchar(10)            null,
    status_code           varchar(1) default 'A' not null,
    delete_timestamp      timestamp              null,
    delete_user           varchar(10)            null,
    constraint orgs_org_types_type_code_fk
        foreign key (org_type) references sunshine.org_types (type_code)
)
    comment 'Table for Organization data';

create definer = root@localhost trigger sunshine.after_insert_orgs
    after INSERT
    on sunshine.orgs
    for each row
BEGIN
    INSERT into sunshine.org_alias(org_id, org_name)
    VALUES (new.id, new.org_name);
END;

create definer = merrymac@localhost trigger sunshine.before_insert_orgs
    before INSERT
    on sunshine.orgs
    for each row
begin
    SET new.id = get_next_gid();
end;


