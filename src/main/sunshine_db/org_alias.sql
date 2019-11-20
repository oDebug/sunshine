create table sunshine.org_alias
(
    id       int auto_increment
        primary key,
    org_id   int(7)      not null,
    org_name varchar(55) not null,
    constraint org_alias_orgs_id_fk
        foreign key (org_id) references sunshine.contacts (id)
);


