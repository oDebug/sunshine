create table sunshine.org_phone
(
    id         int(7)      not null
        primary key,
    org_id     int(7)      null,
    phone      bigint      not null,
    phone_type varchar(10) null,
    constraint org_phone_id_phone_uindex
        unique (id, phone),
    constraint org_phone_orgs_id_fk
        foreign key (org_id) references sunshine.orgs (id)
)
    comment 'Phone numbers for Organizations';

create index org_phone_id_index
    on sunshine.org_phone (id);


