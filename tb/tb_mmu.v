`timescale 1ns/1ps

module tb_mmu;

reg [15:0] virtual_addr;
reg access_type;
reg enable;

wire [15:0] physical_addr;
wire page_fault;
wire protection_fault;
wire translation_valid;

mmu DUT(

.virtual_addr(virtual_addr),
.access_type(access_type),
.enable(enable),

.physical_addr(physical_addr),
.page_fault(page_fault),
.protection_fault(protection_fault),
.translation_valid(translation_valid)

);

initial
begin

    $dumpfile("mmu.vcd");
    $dumpvars(0,tb_mmu);

    enable = 1;

    // Test 1: Valid Read
    virtual_addr = 16'h0110;
    access_type = 0;
    #20;

    // Test 2: Valid Write
    virtual_addr = 16'h0120;
    access_type = 1;
    #20;

    // Test 3: Read Only Page
    virtual_addr = 16'h0230;
    access_type = 1;
    #20;

    // Test 4: Invalid Page
    virtual_addr = 16'h0440;
    access_type = 0;
    #20;

    // Test 5: Unknown Page
    virtual_addr = 16'h0550;
    access_type = 0;
    #20;

    $finish;

end

initial
begin

$monitor(
"Time=%0t VA=%h PA=%h Access=%b Valid=%b PF=%b ProtF=%b",
$time,
virtual_addr,
physical_addr,
access_type,
translation_valid,
page_fault,
protection_fault
);

end

endmodule