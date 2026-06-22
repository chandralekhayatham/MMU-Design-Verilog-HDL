module page_table(

input [7:0] page_number,

output reg [7:0] frame_number,
output reg valid_bit,
output reg read_perm,
output reg write_perm

);

always @(*)
begin

    frame_number = 8'h00;
    valid_bit    = 0;
    read_perm    = 0;
    write_perm   = 0;

    case(page_number)

        8'h01:
        begin
            frame_number = 8'hA1;
            valid_bit = 1;
            read_perm = 1;
            write_perm = 1;
        end

        8'h02:
        begin
            frame_number = 8'hB2;
            valid_bit = 1;
            read_perm = 1;
            write_perm = 0;
        end

        8'h03:
        begin
            frame_number = 8'hC3;
            valid_bit = 1;
            read_perm = 1;
            write_perm = 1;
        end

        8'h04:
        begin
            frame_number = 8'hD4;
            valid_bit = 0;
            read_perm = 0;
            write_perm = 0;
        end

        default:
        begin
            frame_number = 8'h00;
            valid_bit = 0;
            read_perm = 0;
            write_perm = 0;
        end

    endcase

end

endmodule