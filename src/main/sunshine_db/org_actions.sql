create table sunshine.org_actions
(
    id              int(7)               not null
        primary key,
    action_type     varchar(20)          not null,
    complete_status tinyint(1) default 0 null,
    action_notes    text                 null,
    create_user     varchar(10)          null,
    create_date     date                 not null,
    complete_date   date                 null,
    complete_user   varchar(10)          null,
    org_id          int(7)               null,
    due_date        date                 not null,
    constraint org_actions_orgs_id_fk
        foreign key (org_id) references sunshine.orgs (id)
);

create definer = merrymac@localhost trigger sunshine.before_insert_org_actions
    before INSERT
    on sunshine.org_actions
    for each row
begin
    SET new.id = get_next_gid();
end;


