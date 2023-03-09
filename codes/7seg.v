//Kang HB
`timescale 1ns / 1ps

module sseg(

input clk,
input reset_n,
input [17:0]sevenseg_in,
output reg [6:0]   seg0,
output reg [6:0]   seg1,
output reg [6:0]   seg2,
output reg [6:0]   seg3
);

localparam d0 = 4'd0;
localparam d1 = 4'd1;
localparam d2 = 4'd2;
localparam d3 = 4'd3;    
localparam d4 = 4'd4;
localparam d5 = 4'd5;
localparam d6 = 4'd6;
localparam d7 = 4'd7;
localparam d8 = 4'd8;
localparam d9 = 4'd9;

localparam n0 = 7'b011_1111;
localparam n1 = 7'b000_0110;
localparam n2 = 7'b101_1011;
localparam n3 = 7'b100_1111;    
localparam n4 = 7'b110_0110;
localparam n5 = 7'b110_1101;
localparam n6 = 7'b111_1100;
localparam n7 = 7'b010_0111;
localparam n8 = 7'b111_1111;
localparam n9 = 7'b110_1111;
localparam nl = 7'b000_0000;
localparam no = 7'b100_0000;

//reg seg0w, seg1w, seg2w, seg3w;

always @ (posedge clk or negedge reset_n)begin
    if(!reset_n)begin
        seg0<=no;
        seg1<=no;
        seg2<=no;
        seg3<=no;
    end
    else if (sevenseg_in[17:16]==2'b10||sevenseg_in[17:16]==2'b01)begin
        if (sevenseg_in[3:0]==d0)
            seg0<=n0;
        else if(sevenseg_in[3:0]==d1)
            seg0<=n1;
        else if(sevenseg_in[3:0]==d2)
            seg0<=n2;
        else if(sevenseg_in[3:0]==d3)
            seg0<=n3;
        else if(sevenseg_in[3:0]==d4)
            seg0<=n4;
        else if(sevenseg_in[3:0]==d5)
            seg0<=n5;
        else if(sevenseg_in[3:0]==d6)
            seg0<=n6;
        else if(sevenseg_in[3:0]==d7)
            seg0<=n7;
        else if(sevenseg_in[3:0]==d8)
            seg0<=n8;
        else if(sevenseg_in[3:0]==d9)
            seg0<=n9;
        else
            seg0<=nl;
        ///
        if (sevenseg_in[7:4]==d0)
            seg1<=n0;
        else if(sevenseg_in[7:4]==d1)
            seg1<=n1;
        else if(sevenseg_in[7:4]==d2)
            seg1<=n2;
        else if(sevenseg_in[7:4]==d3)
            seg1<=n3;
        else if(sevenseg_in[7:4]==d4)
            seg1<=n4;
        else if(sevenseg_in[7:4]==d5)
            seg1<=n5;
        else if(sevenseg_in[7:4]==d6)
            seg1<=n6;
        else if(sevenseg_in[7:4]==d7)
            seg1<=n7;
        else if(sevenseg_in[7:4]==d8)
            seg1<=n8;
        else if(sevenseg_in[7:4]==d9)
            seg1<=n9;
        else
            seg1<=nl;      
///
        if (sevenseg_in[11:8]==d0)
            seg2<=n0;
        else if(sevenseg_in[11:8]==d1)
            seg2<=n1;
        else if(sevenseg_in[11:8]==d2)
            seg2<=n2;
        else if(sevenseg_in[11:8]==d3)
            seg2<=n3;
        else if(sevenseg_in[11:8]==d4)
            seg2<=n4;
        else if(sevenseg_in[11:8]==d5)
            seg2<=n5;
        else if(sevenseg_in[11:8]==d6)
            seg2<=n6;
        else if(sevenseg_in[11:8]==d7)
            seg2<=n7;
        else if(sevenseg_in[11:8]==d8)
            seg2<=n8;
        else if(sevenseg_in[11:8]==d9)
            seg2<=n9;
        else
            seg2<=nl;   
///
        if (sevenseg_in[15:12]==d0)
            seg3<=n0;
        else if(sevenseg_in[15:12]==d1)
            seg3<=n1;
        else if(sevenseg_in[15:12]==d2)
            seg3<=n2;
        else if(sevenseg_in[15:12]==d3)
            seg3<=n3;
        else if(sevenseg_in[15:12]==d4)
            seg3<=n4;
        else if(sevenseg_in[15:12]==d5)
            seg3<=n5;
        else if(sevenseg_in[15:12]==d6)
            seg3<=n6;
        else if(sevenseg_in[15:12]==d7)
            seg3<=n7;
        else if(sevenseg_in[15:12]==d8)
            seg3<=n8;
        else if(sevenseg_in[15:12]==d9)
            seg3<=n9;
        else
            seg3<=nl;                                                           
    end
    else begin
        seg0<=no;
        seg1<=no;
        seg2<=no;
        seg3<=no;
    end
end

//always@(*)begin
//    case(sevenseg_in[3:0])
//    d0 : seg0w=n1;
//    d1 : seg0w=n1;
//    d2 : seg0w=n1;
//    d3 : seg0w=n1;
//    d4 : seg0w=n1;
//    d5 : seg0w=n1;
//    d6 : seg0w=n1;
//    d7 : seg0w=n1;
//    d8 : seg0w=n1;
//    d9 : seg0w=n1;
//    default : seg0w=n1;
//    endcase
//end
//always@(*)begin
//    case(sevenseg_in[7:4])
//    d0 : seg1w=n1;
//    d1 : seg1w=n1;
//    d2 : seg1w=n1;
//    d3 : seg1w=n1;
//    d4 : seg1w=n1;
//    d5 : seg1w=n1;
//    d6 : seg1w=n1;
//    d7 : seg1w=n1;
//    d8 : seg1w=n1;
//    d9 : seg1w=n1;
//    default : seg1w=n1;
//    endcase
//end

//always@(*)begin
    
//    case(sevenseg_in[11:8])
//    d0 : seg2w=n1;
//    d1 : seg2w=n1;
//    d2 : seg2w=n1;
//    d3 : seg2w=n1;
//    d4 : seg2w=n1;
//    d5 : seg2w=n1;
//    d6 : seg2w=n1;
//    d7 : seg2w=n1;
//    d8 : seg2w=n1;
//    d9 : seg2w=n1;
//    default : seg2w=n1;
//    endcase
//end

//always@(*)begin    
//    case(sevenseg_in[15:12])
//    d0 : seg3w=n1;
//    d1 : seg3w=n1;
//    d2 : seg3w=n1;
//    d3 : seg3w=n1;
//    d4 : seg3w=n1;
//    d5 : seg3w=n1;
//    d6 : seg3w=n1;
//    d7 : seg3w=n1;
//    d8 : seg3w=n1;
//    d9 : seg3w=n1;
//    default : seg3w=n1;
//    endcase
//end
/////////////////////////////////////////backup
//always@(*)begin
//    case(sevenseg_in[3:0])
//    d0 : seg0w=n0;
//    d1 : seg0w=n1;
//    d2 : seg0w=n2;
//    d3 : seg0w=n3;
//    d4 : seg0w=n4;
//    d5 : seg0w=n5;
//    d6 : seg0w=n6;
//    d7 : seg0w=n7;
//    d8 : seg0w=n8;
//    d9 : seg0w=n9;
//    default : seg0w=nl;
//    endcase
//end
//always@(*)begin
//    case(sevenseg_in[7:4])
//    d0 : seg1w=n0;
//    d1 : seg1w=n1;
//    d2 : seg1w=n2;
//    d3 : seg1w=n3;
//    d4 : seg1w=n4;
//    d5 : seg1w=n5;
//    d6 : seg1w=n6;
//    d7 : seg1w=n7;
//    d8 : seg1w=n8;
//    d9 : seg1w=n9;
//    default : seg1w=nl;
//    endcase
//end

//always@(*)begin
    
//    case(sevenseg_in[11:8])
//    d0 : seg2w=n0;
//    d1 : seg2w=n1;
//    d2 : seg2w=n2;
//    d3 : seg2w=n3;
//    d4 : seg2w=n4;
//    d5 : seg2w=n5;
//    d6 : seg2w=n6;
//    d7 : seg2w=n7;
//    d8 : seg2w=n8;
//    d9 : seg2w=n9;
//    default : seg2w=nl;
//    endcase
//end

//always@(*)begin    
//    case(sevenseg_in[15:12])
//    d0 : seg3w=n0;
//    d1 : seg3w=n1;
//    d2 : seg3w=n2;
//    d3 : seg3w=n3;
//    d4 : seg3w=n4;
//    d5 : seg3w=n5;
//    d6 : seg3w=n6;
//    d7 : seg3w=n7;
//    d8 : seg3w=n8;
//    d9 : seg3w=n9;
//    default : seg3w=nl;
//    endcase
//end

endmodule