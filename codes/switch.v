//Kang HB
`timescale 1ns / 1ps

module switch_interface(
input clk,
input rst,
input numbup,
input change_digit,
input switchA,
input switchB,
output reg [3:0]switch_out,
output reg rst_n
);

reg rstq1, rstq2;
reg numbupq1, numbupq2;
reg change_digitq1, change_digitq2;
reg switchAq1, switchAq2;
reg switchBq1, switchBq2;

wire fmscnt;
reg [19:00] mscnt ;
localparam ms = 625000;

wire rstd, numbupd, change_digitd, switchAd, switchBd;
assign  rstd = (rstq1)&(~rstq2);
assign  numbupd = (numbupq1)&(~numbupq2);
assign  change_digitd = (change_digitq1)&(~change_digitq2);
assign  switchAd = (switchAq1)&(~switchAq2);
assign  switchBd = (switchBq1)&(~switchBq2);

//5msclkgen
always @(posedge clk) begin
    if(fmscnt)begin
        if(rstd)begin
            mscnt<=0;
         end
         else begin
            mscnt<=mscnt;
         end
    end
    else begin
        mscnt<=mscnt+1;
        if(mscnt==ms-1)begin
            mscnt<=0;
        end
    end
end
assign fmscnt = (mscnt==ms-1) ? 1'b1:1'b0; 

always@(posedge clk) begin
    if(fmscnt) begin
        rstq1<=rst;
        rstq2<=rstq1;
        
        numbupq1<=numbup;
        numbupq2<=numbupq1;
        
        change_digitq1<=change_digit;
        change_digitq2<=change_digitq1;
        
        switchAq1<=switchA;
        switchAq2<=switchAq2;
        
        switchBq1<=switchB;
        switchBq2<=switchBq1;
    end
end

always@(posedge clk)begin
    if(fmscnt)begin
        if(rstd) begin
            rst_n<=0;
        end
        else begin
            rst_n<=1;
        end
        
        if(numbupd) begin
            switch_out<= 4'd2;
        end
        else if(change_digitd) begin
            switch_out<= 4'd1;
        end
        else if(switchAd) begin
            switch_out<= 4'd11;
        end
        else if(switchBd) begin
            switch_out<= 4'd12;
        end
        else begin
            switch_out<= 4'd0;
        end
    end
end


endmodule