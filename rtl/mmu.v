module mmu(

input [15:0] virtual_addr,
input access_type,      // 0 = Read, 1 = Write
input enable,

output reg [15:0] physical_addr,
output reg page_fault,
output reg protection_fault,
output reg translation_valid

);

wire [7:0] page_number;
wire [7:0] offset;

wire [7:0] frame_number;
wire valid_bit;
wire read_perm;
wire write_perm;

assign page_number = virtual_addr[15:8];
assign offset      = virtual_addr[7:0];

page_table PT(
    .page_number(page_number),
    .frame_number(frame_number),
    .valid_bit(valid_bit),
    .read_perm(read_perm),
    .write_perm(write_perm)
);

always @(*)
begin

    page_fault = 0;
    protection_fault = 0;
    translation_valid = 0;
    physical_addr = 16'h0000;

    if(enable)
    begin

        if(valid_bit == 0)
        begin
            page_fault = 1;
        end

        else if(access_type == 0 && read_perm == 0)
        begin
            protection_fault = 1;
        end

        else if(access_type == 1 && write_perm == 0)
        begin
            protection_fault = 1;
        end

        else
        begin
            physical_addr = {frame_number, offset};
            translation_valid = 1;
        end

    end

end

endmodule