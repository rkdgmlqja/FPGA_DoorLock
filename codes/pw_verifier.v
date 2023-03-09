//Kang HB
`timescale 1ns / 1ps
module password_verifier(
input clk,
input reset_n,
input[16:0] pwsin,
input[1:0] current_state,
output reg pw_valid_out
);

reg [15:0] pswd;



always @(posedge clk or negedge reset_n) begin
    if(!reset_n)begin
        pswd[3:0] <= 4'd4;
		pswd[7:4] <= 4'd3;
		pswd[11:8] <= 4'd2;
		pswd[15:12] <= 4'd1;
		pw_valid_out <= 0;
    end
	else if(current_state==2'b11)begin
		pswd <= pwsin[15:0];
		pw_valid_out <= 0;
	end
	
	else if (current_state==2'b01)begin
		if(pwsin[15:0]==pswd) begin
			pw_valid_out <= 1;
		end
		else begin
			pw_valid_out <= 0;
		end
	end
    else begin
        pw_valid_out <= 0;
    end
end

endmodule
