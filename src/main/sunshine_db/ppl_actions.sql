create table sunshine.ppl_actions
(
    id              int        null,
    action_type     tinytext   null,
    complete_status tinyint    null,
    action_notes    mediumtext null,
    create_user     tinytext   null,
    create_date     date       null,
    complete_date   date       null,
    complete_user   tinytext   null,
    ppl_id          int        null,
    constraint ppl_actions_people_id_fk
        foreign key (ppl_id) references sunshine.people (id)
);


