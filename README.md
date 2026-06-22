# MMU-Design-Verilog-HDL
Memory Management Unit (MMU) Design using Verilog HDL featuring virtual-to-physical address translation, page table lookup, permission checking, page fault generation, and verification through simulation.
# 🧠 Memory Management Unit (MMU) Design using Verilog HDL

## 📌 Overview

The Memory Management Unit (MMU) is a critical hardware component in modern processors that translates Virtual Addresses into Physical Addresses while enforcing memory protection and access permissions.

This project implements a simplified MMU using Verilog HDL. The design performs page table lookup, virtual-to-physical address translation, valid-bit verification, permission checking, page fault generation, and protection fault detection.

The project demonstrates important VLSI, FPGA, and Computer Architecture concepts used in CPUs, Operating Systems, and Embedded Systems.

---

# 🎯 Project Objective

To design and verify a Memory Management Unit (MMU) using Verilog HDL capable of:

- Virtual Address Translation
- Physical Address Generation
- Page Table Lookup
- Memory Protection
- Page Fault Detection
- Permission Verification
- RTL Verification using Testbench Simulation

---

# ❓ Problem Statement

Modern processors use Virtual Memory to provide:

- Process Isolation
- Memory Protection
- Efficient Memory Utilization
- Secure Access Control

The MMU performs address translation and permission checking before memory access is allowed.

Without an MMU:

- Programs can access unauthorized memory
- No process isolation exists
- Memory management becomes inefficient

---

# 🏗 MMU Architecture

```text
Virtual Address
       │
       ▼
Page Number Extraction
       │
       ▼
Page Table Lookup
       │
       ▼
Valid Bit Check
       │
       ▼
Permission Check
       │
       ▼
Physical Frame Mapping
       │
       ▼
Physical Address Output
       │
       ├── Page Fault
       └── Protection Fault
```

---

# ⚙️ Address Format

## Virtual Address (16-bit)

```text
15                8 7               0
+------------------+----------------+
|  Page Number     |    Offset      |
+------------------+----------------+
```

### Page Number

```text
VA[15:8]
```

### Offset

```text
VA[7:0]
```

---

## Physical Address (16-bit)

```text
15                8 7               0
+------------------+----------------+
|  Frame Number    |    Offset      |
+------------------+----------------+
```

---

# 📋 Page Table Entry Format

| Field | Width | Description |
|---------|--------|------------|
| Valid Bit | 1 | Page Exists |
| Read Permission | 1 | Read Allowed |
| Write Permission | 1 | Write Allowed |
| Frame Number | 8 | Physical Frame |

---

# 📥 Inputs

| Signal | Description |
|----------|------------|
| virtual_addr | Virtual Address |
| access_type | Read / Write |
| enable | MMU Enable |

---

# 📤 Outputs

| Signal | Description |
|----------|------------|
| physical_addr | Translated Address |
| page_fault | Invalid Page |
| protection_fault | Permission Error |
| translation_valid | Translation Success |

---

# 🔄 Address Translation Logic

### Step 1

Extract:

```text
Page Number
Offset
```

from Virtual Address.

---

### Step 2

Search corresponding entry in Page Table.

---

### Step 3

Check Valid Bit.

```text
Valid = 1
```

Proceed Translation.

```text
Valid = 0
```

Generate Page Fault.

---

### Step 4

Verify Access Permission.

```text
Read Request
→ Check Read Permission

Write Request
→ Check Write Permission
```

---

### Step 5

Generate Physical Address.

```text
Physical Address
=
Frame Number + Offset
```

---

# 🚨 Fault Conditions

## Page Fault

Occurs when:

```text
Valid Bit = 0
```

Example:

```text
Page Not Present
```

---

## Protection Fault

Occurs when:

```text
Write Access Requested

AND

Write Permission = 0
```

Example:

```text
Write Attempt on Read-Only Page
```

---

# 🧠 VLSI Concepts Used

- Verilog HDL
- RTL Design
- Digital Logic Design
- Address Translation
- Page Table Architecture
- Memory Protection
- Combinational Logic
- Verification Methodology
- Testbench Development
- Waveform Analysis
- FPGA Design Flow

---

# 📂 Project Structure

```text
MMU-Design-Verilog-HDL/

├── rtl/
│   ├── mmu.v
│   ├── page_table.v
│   └── permission_checker.v

├── tb/
│   └── tb_mmu.v

├── constraints/
│   └── mmu.xdc

├── simulation/

├── waveforms/

├── reports/

├── images/

├── docs/

├── scripts/

├── README.md

└── .gitignore
```

---

# 🛠 Tools Used

| Tool | Purpose |
|---------|----------|
| Verilog HDL | RTL Design |
| ModelSim | Simulation |
| Vivado | FPGA Flow |
| GTKWave | Waveform Analysis |
| Yosys | Synthesis |
| GitHub | Version Control |

---

# ▶️ Simulation Steps

## Using Icarus Verilog

### Compile

```bash
iverilog -o mmu_sim rtl/mmu.v rtl/page_table.v rtl/permission_checker.v tb/tb_mmu.v
```

### Run

```bash
vvp mmu_sim
```

### Open Waveform

```bash
gtkwave mmu.vcd
```

---

## Using ModelSim

### Compile

```bash
vlog rtl/page_table.v
vlog rtl/permission_checker.v
vlog rtl/mmu.v
vlog tb/tb_mmu.v
```

### Simulate

```bash
vsim tb_mmu
```

### Run

```bash
run -all
```

---

# 📊 Expected Results

| Test Case | Expected Result |
|------------|----------------|
| Page 01 Read | Successful Translation |
| Page 01 Write | Successful Translation |
| Page 02 Write | Protection Fault |
| Page 04 Read | Page Fault |
| Page 05 Read | Page Fault |

---

# 📈 Applications

- CPU Design
- Microprocessors
- Embedded Systems
- Operating Systems
- Virtual Memory Systems
- Secure Computing
- FPGA-Based Processors
- System-on-Chip (SoC) Design

---

# 📸 Screenshots Checklist

Capture the following:

✅ RTL Code Screenshot

✅ Page Table Design

✅ Address Format Diagram

✅ Testbench Screenshot

✅ Simulation Run

✅ Valid Translation Waveform

✅ Page Fault Waveform

✅ Protection Fault Waveform

✅ Synthesis Report

✅ Utilization Report

✅ GitHub Repository Preview

---

# 🚀 Future Enhancements

- Translation Lookaside Buffer (TLB)
- Multi-Level Page Tables
- Cache Integration
- ASID Support
- User/Supervisor Privileges
- Exception Handling
- 32-bit MMU Architecture
- AXI Bus Interface
- FPGA Hardware Validation

---

# 🎓 Learning Outcomes

Through this project, I gained practical experience in:

- Verilog HDL Programming
- RTL Design
- Digital Logic Design
- Computer Architecture
- Virtual Memory Concepts
- Address Translation
- Memory Protection
- Verification & Debugging
- FPGA Design Flow

B.Tech Computer Science and Engineering

VLSI / FPGA Design Project

---

# ⭐ Support

If you found this project useful:

⭐ Star the repository

🍴 Fork the project

📢 Share with fellow VLSI and FPGA enthusiasts
