////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2003 Xilinx, Inc.
// All Right Reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 10.1
//  \   \         Application : ISE
//  /   /         Filename : PipelineDatpath_selfcheck.tfw
// /___/   /\     Timestamp : Tue Feb 17 17:54:38 2026
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: 
//Design Name: PipelineDatpath_selfcheck_beh
//Device: Xilinx
//
`timescale 1ns/1ps

module PipelineDatpath_selfcheck_beh;
    reg clk = 1'b0;
    reg [31:0] InstData = 32'b00000000000000000000000000000000;
    reg rst = 1'b0;
    reg wea = 1'b0;

    parameter PERIOD = 20;
    parameter real DUTY_CYCLE = 0.5;
    parameter OFFSET = 0;

    initial    // Clock process for clk
    begin
        #OFFSET;
        forever
        begin
            clk = 1'b0;
            #(PERIOD-(PERIOD*DUTY_CYCLE)) clk = 1'b1;
            #(PERIOD*DUTY_CYCLE);
        end
    end

    PipelinedDatapath UUT (
        .clk(clk),
        .InstData(InstData),
        .rst(rst),
        .wea(wea));

    integer TX_ERROR = 0;
    
    initial begin  // Open the results file...
        #1020 // Final time:  1020 ns
        if (TX_ERROR == 0) begin
            $display("No errors or warnings.");
        end else begin
            $display("%d errors found in simulation.", TX_ERROR);
        end
        $stop;
    end

    initial begin
    end


endmodule

