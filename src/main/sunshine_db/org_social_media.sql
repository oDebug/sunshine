create table sunshine.org_social_media
(
    id         int(7)      not null
        primary key,
    org_id     int(7)      null,
    sm_type    varchar(2)  null,
    sm_address varchar(50) null,
    constraint org_social_media_orgs_id_fk
        foreign key (org_id) references sunshine.contacts (id),
    constraint org_social_media_soc_med_types_social_media_type_fk
        foreign key (sm_type) references sunshine.soc_med_types (social_media_type)
);


