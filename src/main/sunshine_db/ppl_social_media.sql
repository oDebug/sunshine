create table sunshine.ppl_social_media
(
    id         int(7)       null,
    ppl_id     int(7)       null,
    sm_type    varchar(2)   not null,
    sm_address varchar(100) null,
    constraint ppl_social_media_people_id_fk
        foreign key (ppl_id) references sunshine.people (id),
    constraint social_media_soc_med_types_social_media_type_fk
        foreign key (sm_type) references sunshine.soc_med_types (social_media_type)
)
    comment 'List of Social Media accounts for a contact';


