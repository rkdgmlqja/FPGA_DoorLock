//Kang HB
`timescale 1ns / 1ps
module state_machine
(
input clk,
input reset_n,
input [3:0]switch_in,
input pw_valid_in,
output reg [16:0]pwsout,
output reg led_out,
output reg [17:0]sevenseg_out,
output reg [1:0]current_state);

//reg [1:0] current_state;
reg [1:0] next_state;
reg [2:0] cnt;
reg [3:0]switch_buffer1;
reg [3:0]switch_buffer2;
localparam lock = 2'b00;
localparam waiting = 2'b01;
localparam open = 2'b10;
localparam change = 2'b11;
//switch edge edge detection
always@(posedge clk) begin
    switch_buffer1<= switch_in;
end
always@(posedge clk) begin
    if(switch_in==switch_buffer1)begin
        switch_buffer2<=0;
    end
    else begin
        switch_buffer2<=switch_in;
    end
end

// state machine loop
always@(posedge clk or negedge reset_n) 
begin
	if (!reset_n) begin
		current_state <= lock;
	end
	else begin
		current_state <= next_state;
	end
end

//state machine conditional statement
always@(*)
begin
	case(current_state)
	lock : if(switch_buffer2==4'd11)
			next_state = waiting;
		else
			next_state = lock;
	waiting : if(switch_buffer2==4'd11)begin
			
	       if(pw_valid_in)begin
			next_state = open;
		   end
		   else begin
			next_state = lock;
		   end
		end
		else begin
			next_state = waiting;
		end
	open : if(switch_buffer2==4'd11)
			next_state = lock;
		else if (switch_buffer2==4'd12)
			next_state = change;
		else
			next_state = open;
	change : if (switch_buffer2==4'd12)
			next_state = open;

		else 
			next_state = change;
	endcase
end

// counter for password keyinput 


always@(posedge clk)
begin
	if (current_state==lock||current_state==open)begin
		cnt<=0;
	end
	else if (switch_buffer2==4'd1)begin
	    if(cnt==3'd3)begin
	       cnt<=0;
	    end
	    else begin
		cnt<=cnt+1;
		end
	end
	else begin
		cnt <= cnt;
	end
end

//save password key input to buffer
reg pwen;
reg[23:0] pwd;
always@(posedge clk)
begin
	if(current_state==change||current_state==waiting)begin
		if(switch_buffer2!=4'd11||switch_buffer2!=4'd12||switch_buffer2!=4'd0)begin
			if(switch_buffer2==4'd2)begin
			    if (cnt==0)begin
			         if(pwsout[15:12]==9)begin
			             pwsout[15:12]<=0;
			         end
			         else begin
			         pwsout[15:12]<=pwsout[15:12]+1;
			         end
			    end
			    else if (cnt==1)begin
			         if(pwsout[11:8]==9)begin
			             pwsout[11:8]<=0;
			         end
			         else begin
			         pwsout[11:8]<=pwsout[11:8]+1;
			         end
			    end
			    else if (cnt==2)begin
			         if(pwsout[7:4]==9)begin
			             pwsout[7:4]<=0;
			         end
			         else begin
			         pwsout[7:4]<=pwsout[7:4]+1;
			         end
			    end
			    else begin
			         if(pwsout[3:0]==9)begin
			             pwsout[3:0]<=0;
			         end
			         else begin
			         pwsout[3:0]<=pwsout[3:0]+1;
			         end
			    end
			end
			else begin
				if (cnt==0)begin
			         pwsout[15:12]<= pwsout[15:12];
			    end
			    else if (cnt==1)begin
			         pwsout[11:8]<= pwsout[11:8];
			    end
			    else if (cnt==2)begin
			         pwsout[7:4]<= pwsout[7:4];
			    end
			    else begin
			         pwsout[3:0]<= pwsout[3:0];
			    end
			end
		end
	end
	else begin
	pwsout[15:0] <= 16'b0000_0000_0000_0000;//set to invalid number
	end
end

//assign pwsout(if mode is change, pwsout[24]=0)
always@(posedge clk)
begin
	if (current_state==change) 
	begin
		pwsout[16] <= 1;
	end
	
	else 
	begin
		pwsout[16] <= 0;
	end
end

//led out assign
always@(posedge clk)
begin
	if (current_state==open||current_state==change)
	begin
		led_out<=0;
	end
	
	else
	begin
		led_out<=1;
	end
end

//7seg assign(waiting:10 change: 01, lock: 00)
always@(posedge clk)
begin
	
	if (current_state==waiting) begin
		sevenseg_out[17:16] <= 2'b10;
		sevenseg_out[15:0]<=pwsout[15:0]; 
	end
	else if(current_state==change) begin
		sevenseg_out[17:16] <= 2'b01;
		sevenseg_out[15:0]<=pwsout[15:0]; 
	end
	else begin
		sevenseg_out[17:16] <= 2'b00;
		sevenseg_out[15:0]<=pwsout[15:0]; 
	end
end

endmodule
