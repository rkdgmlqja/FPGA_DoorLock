//Kang HB
`timescale 1ns / 1ps
module top(

input wire clkt,
input wire rstt,
input wire numbupt,
input wire change_digitt,
input wire switchAt,
input wire switchBt,
output wire led0t, led1t, led2t, led3t,
output wire select_seg1, select_seg2,
output wire [6:0] segAout, segBout
);
wire [16:0]pwt;
wire pw_validt;
wire rst_nt;
wire [3:0]switch_outt;
wire ledt;
wire [17:0]sevensegt;
reg select_seg;
wire [6:0]   seg0t, seg1t, seg2t, seg3t;
wire [1:0] statenum;
switch_interface si(
    .clk(clkt),
    .rst(rstt),
    .numbup(numbupt),
    .change_digit(change_digitt),
    .switchA(switchAt),
    .switchB(switchBt),
    .switch_out(switch_outt),
    .rst_n(rst_nt)
);

state_machine sm(
    .clk(clkt),
    .reset_n(rst_nt),
    .switch_in(switch_outt),
    .pw_valid_in(pw_validt),
    .pwsout(pwt),
    .led_out(ledt),
    .sevenseg_out(sevensegt),
    .current_state(statenum)
);

led ld(
    .rst_n(rst_nt),
    .clk(clkt),
    .led_in(ledt),
    .led0(led0t),
    .led1(led1t),
    .led2(led2t),
    .led3(led3t)
);

sseg sg(
    .clk(clkt),
    .reset_n(rst_nt),
    .sevenseg_in(sevensegt),
    .seg0(seg0t),
    .seg1(seg1t),
    .seg2(seg2t),
    .seg3(seg3t)    
);

password_verifier pv(
    .clk(clkt),
    .reset_n(rst_nt),
    .pwsin(pwt),
    .pw_valid_out(pw_validt),
    .current_state(statenum)
);
reg [12:0] cnt;
always@(posedge clkt or negedge rst_nt)begin
    if (!rst_nt)begin
        cnt<=0;
        select_seg<=0;
    end
    else if(cnt==13'd1) begin
        select_seg<=~select_seg;
        cnt<= cnt+1;
    end
    
    else if (cnt==13'b1111_1111_1111_1)begin
        cnt<=0;
    end
    else begin
        cnt<= cnt+1;
    end        
    
end

//assgin section
assign select_seg1 = select_seg;
assign select_seg2 = select_seg;
assign segAout = (!select_seg) ? seg0t:seg1t;
assign segBout = (!select_seg) ? seg2t:seg3t;


//always@(posedge clk)begin
//    if(cnt==12'd1)begin
//        select_seg<=~select_seg;
//    end
    
//    if (cnt==12'b1111_1111_1111_1)begin
//        cnt <=0;
            
//    end
//    else begin
//        cnt<= cnt+1;
//    end        
    
//end

//always @ (posedge clk)begin
//    //select_segone<=1;
//    //select_segtwo<=0;
//    if (select_seg) begin
//        segAoutp<=n1;
//    end
//    else begin
//        segAoutp<=n2;
//    end
//    if (select_seg) begin
//        segBoutp<=n3;
//    end
//    else begin
//        segBoutp<=n4;
//    end
//    select_segone<=select_seg;
//    select_segtwo<=select_seg;
//end

endmodule