create table sunshine.ppl_alias
(
    ppl_id   int(7)       not null,
    ppl_name varchar(100) null,
    constraint ppl_alias_people_id_fk
        foreign key (ppl_id) references sunshine.people (id)
            on delete cascade
);


