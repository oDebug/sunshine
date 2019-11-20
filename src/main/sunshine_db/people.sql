create table sunshine.people
(
    id                    int(7)                               not null
        primary key,
    last_name             varchar(45)                          null,
    first_name            varchar(45)                          null,
    member_org            int(7)                               null,
    create_timestamp      timestamp  default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
    create_user           varchar(10)                          not null,
    last_update_timestamp timestamp                            null,
    last_update_user      varchar(10)                          null,
    status_code           varchar(1) default 'A'               not null,
    delete_timestamp      timestamp                            null,
    delete_user           varchar(10)                          null,
    constraint people_orgs_id_fk
        foreign key (member_org) references sunshine.contacts (id)
);

create definer = merrymac@localhost trigger sunshine.before_insert_people
    before INSERT
    on sunshine.people
    for each row
BEGIN
    DECLARE newAlias VARCHAR(100);
    SET newAlias = concat(new.first_name, ' ', new.last_name);
    SET new.id = get_next_gid();
    INSERT into sunshine.ppl_alias(ppl_id, ppl_name)
    VALUES (new.id, newAlias);
END;


