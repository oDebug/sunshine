create
    definer = root@localhost function sunshine.get_next_gid() returns int(8)
begin
    DECLARE next_val int(8);
    update sunshine.gid_seq set gid = gid + 1;
    select gid into next_val from sunshine.gid_seq;

    return next_val;
end;


