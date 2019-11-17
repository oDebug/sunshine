create table user_table
(
    id           int auto_increment,
    username     text     not null,
    pw           text     not null,
    date_created datetime null,
    constraint user_table_id_uindex
        unique (id)
);

alter table user_table
    add primary key (id);


