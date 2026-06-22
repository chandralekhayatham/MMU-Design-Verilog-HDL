set_property PACKAGE_PIN W5 [get_ports enable]
set_property IOSTANDARD LVCMOS33 [get_ports enable]

set_property PACKAGE_PIN U16 [get_ports {physical_addr[0]}]
set_property PACKAGE_PIN E19 [get_ports {physical_addr[1]}]
set_property PACKAGE_PIN U19 [get_ports {physical_addr[2]}]
set_property PACKAGE_PIN V19 [get_ports {physical_addr[3]}]

set_property PACKAGE_PIN W18 [get_ports page_fault]
set_property PACKAGE_PIN V18 [get_ports protection_fault]