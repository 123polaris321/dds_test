`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/13 20:26:36
// Design Name: 
// Module Name: dds_easy
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module dds_easy(
        input  wire         clk     ,
        input  wire         rstn    ,
        input  wire [2:0]   f_sel   ,   
        input  wire         en      ,
        output wire [7:0]   dds_data
    );

    reg [7:0] addr;
    reg [2:0] fword;

  always @(*) begin
    case (f_sel)
        0:fword = 0+1;
        1:fword = 1+1;
        2:fword = 2+1;
        3:fword = 3+1;
        4:fword = 4+1;
        5:fword = 5+1;
        6:fword = 6+1;
        default :
            fword = 1;
    endcase
  end

always @(posedge clk or negedge rstn) begin
    if(!rstn)
        addr <= 'd0;
    else if(en)
        addr <= addr + fword;
    else
        addr <= 'd0;
end

blk_mem_gen_0 your_instance_name (
  .clka (clk) ,    // input wire clka
  .addra(addr),  // input wire [7 : 0] addra
  .douta(dds_data)  // output wire [7 : 0] douta
);



endmodule
