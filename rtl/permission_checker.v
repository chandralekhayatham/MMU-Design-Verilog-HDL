module permission_checker(

input access_type,
input read_perm,
input write_perm,

output reg allow

);

always @(*)
begin

    allow = 0;

    if(access_type == 0)
        allow = read_perm;

    else
        allow = write_perm;

end

endmodule