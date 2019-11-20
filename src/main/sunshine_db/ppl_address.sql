create table sunshine.ppl_address
(
    id      int(7)       not null
        primary key,
    ppl_id  int(7)       not null,
    street  varchar(100) not null,
    city    varchar(50)  not null,
    state   varchar(2)   not null,
    zip_cde int(5)       not null,
    constraint ppl_address_ppl_id_fk
        foreign key (ppl_id) references sunshine.people (id)
            on delete cascade
);


