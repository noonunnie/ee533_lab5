////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 10.1
//  \   \         Application : sch2verilog
//  /   /         Filename : PipelinedDatapath.vf
// /___/   /\     Timestamp : 02/17/2026 18:13:02
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: C:\Xilinx\10.1\ISE\bin\nt\unwrapped\sch2verilog.exe -intstyle ise -family virtex2p -w Z:/shared/SharedProjects/EE533Lab5-main/PipelinedDatapath/PipelinedDatapath.sch PipelinedDatapath.vf
//Design Name: PipelinedDatapath
//Device: virtex2p
//Purpose:
//    This verilog netlist is translated from an ECS schematic.It can be 
//    synthesized and simulated, but it should not be modified. 
//
`timescale 1ns / 1ps

module FTCE_MXILINX_PipelinedDatapath(C, 
                                      CE, 
                                      CLR, 
                                      T, 
                                      Q);

    input C;
    input CE;
    input CLR;
    input T;
   output Q;
   
   wire TQ;
   wire Q_DUMMY;
   
   assign Q = Q_DUMMY;
   XOR2 I_36_32 (.I0(T), 
                 .I1(Q_DUMMY), 
                 .O(TQ));
   FDCE I_36_35 (.C(C), 
                 .CE(CE), 
                 .CLR(CLR), 
                 .D(TQ), 
                 .Q(Q_DUMMY));
   // synthesis attribute RLOC of I_36_35 is "X0Y0"
   defparam I_36_35.INIT = 1'b0;
endmodule
`timescale 1ns / 1ps

module CB8CE_MXILINX_PipelinedDatapath(C, 
                                       CE, 
                                       CLR, 
                                       CEO, 
                                       Q, 
                                       TC);

    input C;
    input CE;
    input CLR;
   output CEO;
   output [7:0] Q;
   output TC;
   
   wire T2;
   wire T3;
   wire T4;
   wire T5;
   wire T6;
   wire T7;
   wire tie_high;  // VCC to LSB T input for counter
   wire [7:0] Q_DUMMY;
   wire TC_DUMMY;
   
   assign Q[7:0] = Q_DUMMY[7:0];
   assign TC = TC_DUMMY;
   FTCE_MXILINX_PipelinedDatapath I_Q0 (.C(C), 
                                        .CE(CE), 
                                        .CLR(CLR), 
                                        .T(tie_high), 
                                        .Q(Q_DUMMY[0]));
   // synthesis attribute HU_SET of I_Q0 is "I_Q0_6"
   FTCE_MXILINX_PipelinedDatapath I_Q1 (.C(C), 
                                        .CE(CE), 
                                        .CLR(CLR), 
                                        .T(Q_DUMMY[0]), 
                                        .Q(Q_DUMMY[1]));
   // synthesis attribute HU_SET of I_Q1 is "I_Q1_7"
   FTCE_MXILINX_PipelinedDatapath I_Q2 (.C(C), 
                                        .CE(CE), 
                                        .CLR(CLR), 
                                        .T(T2), 
                                        .Q(Q_DUMMY[2]));
   // synthesis attribute HU_SET of I_Q2 is "I_Q2_3"
   FTCE_MXILINX_PipelinedDatapath I_Q3 (.C(C), 
                                        .CE(CE), 
                                        .CLR(CLR), 
                                        .T(T3), 
                                        .Q(Q_DUMMY[3]));
   // synthesis attribute HU_SET of I_Q3 is "I_Q3_4"
   FTCE_MXILINX_PipelinedDatapath I_Q4 (.C(C), 
                                        .CE(CE), 
                                        .CLR(CLR), 
                                        .T(T4), 
                                        .Q(Q_DUMMY[4]));
   // synthesis attribute HU_SET of I_Q4 is "I_Q4_5"
   FTCE_MXILINX_PipelinedDatapath I_Q5 (.C(C), 
                                        .CE(CE), 
                                        .CLR(CLR), 
                                        .T(T5), 
                                        .Q(Q_DUMMY[5]));
   // synthesis attribute HU_SET of I_Q5 is "I_Q5_2"
   FTCE_MXILINX_PipelinedDatapath I_Q6 (.C(C), 
                                        .CE(CE), 
                                        .CLR(CLR), 
                                        .T(T6), 
                                        .Q(Q_DUMMY[6]));
   // synthesis attribute HU_SET of I_Q6 is "I_Q6_1"
   FTCE_MXILINX_PipelinedDatapath I_Q7 (.C(C), 
                                        .CE(CE), 
                                        .CLR(CLR), 
                                        .T(T7), 
                                        .Q(Q_DUMMY[7]));
   // synthesis attribute HU_SET of I_Q7 is "I_Q7_0"
   AND5 I_36_1 (.I0(Q_DUMMY[7]), 
                .I1(Q_DUMMY[6]), 
                .I2(Q_DUMMY[5]), 
                .I3(Q_DUMMY[4]), 
                .I4(T4), 
                .O(TC_DUMMY));
   AND2 I_36_2 (.I0(Q_DUMMY[4]), 
                .I1(T4), 
                .O(T5));
   AND3 I_36_11 (.I0(Q_DUMMY[5]), 
                 .I1(Q_DUMMY[4]), 
                 .I2(T4), 
                 .O(T6));
   AND4 I_36_15 (.I0(Q_DUMMY[3]), 
                 .I1(Q_DUMMY[2]), 
                 .I2(Q_DUMMY[1]), 
                 .I3(Q_DUMMY[0]), 
                 .O(T4));
   VCC I_36_16 (.P(tie_high));
   AND2 I_36_24 (.I0(Q_DUMMY[1]), 
                 .I1(Q_DUMMY[0]), 
                 .O(T2));
   AND3 I_36_26 (.I0(Q_DUMMY[2]), 
                 .I1(Q_DUMMY[1]), 
                 .I2(Q_DUMMY[0]), 
                 .O(T3));
   AND4 I_36_28 (.I0(Q_DUMMY[6]), 
                 .I1(Q_DUMMY[5]), 
                 .I2(Q_DUMMY[4]), 
                 .I3(T4), 
                 .O(T7));
   AND2 I_36_31 (.I0(CE), 
                 .I1(TC_DUMMY), 
                 .O(CEO));
endmodule
`timescale 1ns / 1ps

module PipelinedDatapath(clk, 
                         InstData, 
                         rst, 
                         wea,
                         host_inst_addr,
                         host_pc_load,
                         host_pc_value,
                         host_pc_current);

    input clk;
    input [31:0] InstData;
    input rst;
    input wea;
    input [7:0] host_inst_addr;
    input host_pc_load;
    input [7:0] host_pc_value;
    output [7:0] host_pc_current;
   
   wire [7:0] InstAddr;
   wire [63:0] ProgCounter;
   wire [31:0] InstID;
   wire [31:0] InstIF;
   wire [63:0] RegData1;
   // ID/EX stage (first IntStageReg) outputs
   wire [1:0] WReg1_ID_EX;
   wire [63:0] Reg2Data_ID_EX;
   wire [63:0] Reg1Data_ID_EX;
   wire        WriteRegEn_ID_EX;
   wire        WriteMemEn_ID_EX;
   // Register file read outputs
   wire [63:0] RegFile_R0Data;
   wire [63:0] RegFile_R1Data;
   // WB stage to register file
   wire [63:0] WB_RegWriteData;
   wire        WB_RegWriteEn;
   wire [1:0]  WB_RegWriteAddr;
   // EX/MEM stage (second IntStageReg) to MEM/WB and data memory
   wire        WriteRegEn_EX_MEM;
   wire [1:0]  WReg1_EX_MEM;
   wire [63:0] MemWriteData_EX;
   wire        MemWriteEn_EX;
   // Data memory read → MEM/WB
   wire [63:0] MemReadData;

   reg_file XLXI_13 (.clk(clk), 
                     .r0addr(InstID[9:8]), 
                     .r1addr(InstID[11:10]), 
                     .waddr(WB_RegWriteAddr[1:0]), 
                     .wdata(WB_RegWriteData[63:0]), 
                     .wena(WB_RegWriteEn), 
                     .r0data(RegFile_R0Data[63:0]), 
                     .r1data(RegFile_R1Data[63:0]));
   IntStageReg XLXI_16 (.clk(clk), 
                        .REG1I(RegFile_R0Data[63:0]), 
                        .REG2I(RegFile_R1Data[63:0]), 
                        .WMEI(InstID[31]), 
                        .WREG1I(InstID[29:28]), 
                        .WREI(InstID[30]), 
                        .REG1O(Reg1Data_ID_EX[63:0]), 
                        .REG2O(Reg2Data_ID_EX[63:0]), 
                        .WMEO(WriteMemEn_ID_EX), 
                        .WREG1O(WReg1_ID_EX[1:0]), 
                        .WREO(WriteRegEn_ID_EX));
   IntStageReg XLXI_19 (.clk(clk), 
                        .REG1I(Reg1Data_ID_EX[63:0]), 
                        .REG2I(Reg2Data_ID_EX[63:0]), 
                        .WMEI(WriteMemEn_ID_EX), 
                        .WREG1I(WReg1_ID_EX[1:0]), 
                        .WREI(WriteRegEn_ID_EX), 
                        .REG1O(RegData1[63:0]), 
                        .REG2O(MemWriteData_EX[63:0]), 
                        .WMEO(MemWriteEn_EX), 
                        .WREG1O(WReg1_EX_MEM[1:0]), 
                        .WREO(WriteRegEn_EX_MEM));
   MEMWBStageReg XLXI_20 (.clk(clk), 
                          .WDataI(MemReadData[63:0]), 
                          .WREG1I(WReg1_EX_MEM[1:0]), 
                          .WREI(WriteRegEn_EX_MEM), 
                          .WDataO(WB_RegWriteData[63:0]), 
                          .WREG1O(WB_RegWriteAddr[1:0]), 
                          .WREO(WB_RegWriteEn));
   IFISReg XLXI_29 (.clk(clk), 
                    .Inst(InstIF[31:0]), 
                    .InstOut(InstID[31:0]));
   // Instruction address: host when writing, else PC word address (ProgCounter[9:2])
   assign InstAddr = ProgCounter[9:2];
   assign host_pc_current = ProgCounter[9:2];
   ProgCount pc_inst (.clk(clk), 
                      .rst(rst), 
                      .load_en(host_pc_load), 
                      .next_pc({56'b0, host_pc_value, 2'b0}), 
                      .ProgCounter(ProgCounter));
   InstructionMem XLXI_32 (.addr(wea ? host_inst_addr : InstAddr), 
                           .clk(clk), 
                           .din(InstData[31:0]), 
                           .we(wea), 
                           .dout(InstIF[31:0]));
   DataMemory XLXI_34 (.addra(RegData1[7:0]), 
                       .addrb(RegData1[7:0]), 
                       .clka(clk), 
                       .clkb(clk), 
                       .dina(MemWriteData_EX[63:0]), 
                       .wea(MemWriteEn_EX), 
                       .doutb(MemReadData[63:0]));
endmodule
