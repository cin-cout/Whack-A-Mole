`define TimeExpireCount 32'd25000000
`define TimeExpireDisplay 32'd5000
`define TimeExpireR 32'd50000000

module test(clk, rst, keyrow, keycol, dot_row, dot_col, t_out0, t_out1, dp1, dp2);

input clk,rst;
input [3:0]keycol;

output reg [3:0]keyrow;
output reg [7:0]dot_row,dot_col;
//output [6:0]out;
output reg [6:0]t_out0, t_out1, dp1, dp2;

reg [3:0]state = 4'b0010,next_state,row_count;
//reg [6:0]out;

wire b,c, isclear, done;
wire [3:0]rand, kr;
wire [4:0]time_countdown;
wire [6:0]score, time_out0, time_out1, display1, display2;
wire [7:0]d_r,d_c;

clk_div_display cdd(.clk(clk),.rst(rst),.div_clk(b));
clk_div_count cdc(.clk(clk),.rst(rst),.div_clk(c));
Random rdm(.clk(clk), .score(score), .out(rand));
countdown cd(.clk(c), .reset(rst),.done(done), .out0(time_out0), .out1(time_out1), .count(time_countdown));
ScoreDisplay sd(.score(score), .display1(display1), .display2(display2));
keyPad kp(.clock(b), .reset(rst), .timecountdown(time_countdown), .isclear(isclaer), .dot_row(d_r), .dot_col(d_c), .keypadRow(kr), .keypadCol(keycol), .state(state), .score(score));

always @(posedge state or negedge rst)
begin
	next_state = rand;
end


always @(posedge c or negedge rst)
begin
if(!rst)
	state<=4'h0;
else if(time_countdown == 0)
	state<=4'h0;
else
	state<=next_state;
end

always@(posedge b or negedge rst)
begin
	if(!rst)
	begin
		row_count <= 0;
		dot_row <= 8'b11111111;
		dot_col <= 8'b00000000;
	end
	else
	begin
		if(done == 1)begin
		dot_row<=8'b11111111;
		dot_col<=8'b00000000;
		end
		else if(isclear == 1)
		begin
			row_count<= row_count + 1;
			case(row_count)
				3'd0: dot_row <= 8'b01111111;
				3'd1: dot_row <= 8'b10111111;
				3'd2: dot_row <= 8'b11011111;
				3'd3: dot_row <= 8'b11101111;
				3'd4: dot_row <= 8'b11110111;
				3'd5: dot_row <= 8'b11111011;
				3'd6: dot_row <= 8'b11111101;
				3'd7: dot_row <= 8'b11111110;
			endcase
			case(row_count)
				3'd0: dot_col <= 8'b00000000;
				3'd1: dot_col <= 8'b00000000;
				3'd2: dot_col <= 8'b00000000;
				3'd3: dot_col <= 8'b00000000;
				3'd4: dot_col <= 8'b00000000;
				3'd5: dot_col <= 8'b00000000;
				3'd6: dot_col <= 8'b00000000;
				3'd7: dot_col <= 8'b00000000;
			endcase
		end
		else if(state == 4'h7)
		begin
			row_count<= row_count + 1;
			case(row_count)
				3'd0: dot_row <= 8'b01111111;
				3'd1: dot_row <= 8'b10111111;
				3'd2: dot_row <= 8'b11011111;
				3'd3: dot_row <= 8'b11101111;
				3'd4: dot_row <= 8'b11110111;
				3'd5: dot_row <= 8'b11111011;
				3'd6: dot_row <= 8'b11111101;
				3'd7: dot_row <= 8'b11111110;
			endcase
			case(row_count)
				3'd0: dot_col <= 8'b00000000;
				3'd1: dot_col <= 8'b00000000;
				3'd2: dot_col <= 8'b00000000;
				3'd3: dot_col <= 8'b00000000;
				3'd4: dot_col <= 8'b00000000;
				3'd5: dot_col <= 8'b00000000;
				3'd6: dot_col <= 8'b00000011;
				3'd7: dot_col <= 8'b00000011;
			endcase
		end
		else if(state == 4'h4)begin
			row_count <= row_count + 1;
			case(row_count)
				3'd0: dot_row <= 8'b01111111;
				3'd1: dot_row <= 8'b10111111;
				3'd2: dot_row <= 8'b11011111;
				3'd3: dot_row <= 8'b11101111;
				3'd4: dot_row <= 8'b11110111;
				3'd5: dot_row <= 8'b11111011;
				3'd6: dot_row <= 8'b11111101;
				3'd7: dot_row <= 8'b11111110;
			endcase
			case(row_count)
				3'd0: dot_col <= 8'b00000000;
				3'd1: dot_col <= 8'b00000000;
				3'd2: dot_col <= 8'b00000000;
				3'd3: dot_col <= 8'b00000000;
				3'd4: dot_col <= 8'b00000000;
				3'd5: dot_col <= 8'b00000000;
				3'd6: dot_col <= 8'b00001100;
				3'd7: dot_col <= 8'b00001100;
			endcase
		end
		else if(state == 4'h1)begin
			row_count <= row_count + 1;
			case(row_count)
				3'd0: dot_row <= 8'b01111111;
				3'd1: dot_row <= 8'b10111111;
				3'd2: dot_row <= 8'b11011111;
				3'd3: dot_row <= 8'b11101111;
				3'd4: dot_row <= 8'b11110111;
				3'd5: dot_row <= 8'b11111011;
				3'd6: dot_row <= 8'b11111101;
				3'd7: dot_row <= 8'b11111110;
			endcase
			case(row_count)
				3'd0: dot_col <= 8'b00000000;
				3'd1: dot_col <= 8'b00000000;
				3'd2: dot_col <= 8'b00000000;
				3'd3: dot_col <= 8'b00000000;
				3'd4: dot_col <= 8'b00000000;
				3'd5: dot_col <= 8'b00000000;
				3'd6: dot_col <= 8'b00110000;
				3'd7: dot_col <= 8'b00110000;
			endcase
		end
		else if(state == 4'h0)begin
			row_count <= row_count + 1;
			case(row_count)
				3'd0: dot_row <= 8'b01111111;
				3'd1: dot_row <= 8'b10111111;
				3'd2: dot_row <= 8'b11011111;
				3'd3: dot_row <= 8'b11101111;
				3'd4: dot_row <= 8'b11110111;
				3'd5: dot_row <= 8'b11111011;
				3'd6: dot_row <= 8'b11111101;
				3'd7: dot_row <= 8'b11111110;
			endcase
			case(row_count)
				3'd0: dot_col <= 8'b00000000;
				3'd1: dot_col <= 8'b00000000;
				3'd2: dot_col <= 8'b00000000;
				3'd3: dot_col <= 8'b00000000;
				3'd4: dot_col <= 8'b00000000;
				3'd5: dot_col <= 8'b00000000;
				3'd6: dot_col <= 8'b11000000;
				3'd7: dot_col <= 8'b11000000;
			endcase
		end
		else if(state == 4'h8)begin
			row_count <= row_count + 1;
			case(row_count)
				3'd0: dot_row <= 8'b01111111;
				3'd1: dot_row <= 8'b10111111;
				3'd2: dot_row <= 8'b11011111;
				3'd3: dot_row <= 8'b11101111;
				3'd4: dot_row <= 8'b11110111;
				3'd5: dot_row <= 8'b11111011;
				3'd6: dot_row <= 8'b11111101;
				3'd7: dot_row <= 8'b11111110;
			endcase
			case(row_count)
				3'd0: dot_col <= 8'b00000000;
				3'd1: dot_col <= 8'b00000000;
				3'd2: dot_col <= 8'b00000000;
				3'd3: dot_col <= 8'b00000000;
				3'd4: dot_col <= 8'b00000011;
				3'd5: dot_col <= 8'b00000011;
				3'd6: dot_col <= 8'b00000000;
				3'd7: dot_col <= 8'b00000000;
			endcase
		end
		else if(state == 4'h5)begin
			row_count <= row_count + 1;
			case(row_count)
				3'd0: dot_row <= 8'b01111111;
				3'd1: dot_row <= 8'b10111111;
				3'd2: dot_row <= 8'b11011111;
				3'd3: dot_row <= 8'b11101111;
				3'd4: dot_row <= 8'b11110111;
				3'd5: dot_row <= 8'b11111011;
				3'd6: dot_row <= 8'b11111101;
				3'd7: dot_row <= 8'b11111110;
			endcase
			case(row_count)
				3'd0: dot_col <= 8'b00000000;
				3'd1: dot_col <= 8'b00000000;
				3'd2: dot_col <= 8'b00000000;
				3'd3: dot_col <= 8'b00000000;
				3'd4: dot_col <= 8'b00001100;
				3'd5: dot_col <= 8'b00001100;
				3'd6: dot_col <= 8'b00000000;
				3'd7: dot_col <= 8'b00000000;
			endcase
		end
		else if(state == 4'h2)begin
			row_count <= row_count + 1;
			case(row_count)
				3'd0: dot_row <= 8'b01111111;
				3'd1: dot_row <= 8'b10111111;
				3'd2: dot_row <= 8'b11011111;
				3'd3: dot_row <= 8'b11101111;
				3'd4: dot_row <= 8'b11110111;
				3'd5: dot_row <= 8'b11111011;
				3'd6: dot_row <= 8'b11111101;
				3'd7: dot_row <= 8'b11111110;
			endcase
			case(row_count)
				3'd0: dot_col <= 8'b00000000;
				3'd1: dot_col <= 8'b00000000;
				3'd2: dot_col <= 8'b00000000;
				3'd3: dot_col <= 8'b00000000;
				3'd4: dot_col <= 8'b00110000;
				3'd5: dot_col <= 8'b00110000;
				3'd6: dot_col <= 8'b00000000;
				3'd7: dot_col <= 8'b00000000;
			endcase
		end
		else if(state == 4'ha)begin
			row_count <= row_count + 1;
			case(row_count)
				3'd0: dot_row <= 8'b01111111;
				3'd1: dot_row <= 8'b10111111;
				3'd2: dot_row <= 8'b11011111;
				3'd3: dot_row <= 8'b11101111;
				3'd4: dot_row <= 8'b11110111;
				3'd5: dot_row <= 8'b11111011;
				3'd6: dot_row <= 8'b11111101;
				3'd7: dot_row <= 8'b11111110;
			endcase
			case(row_count)
				3'd0: dot_col <= 8'b00000000;
				3'd1: dot_col <= 8'b00000000;
				3'd2: dot_col <= 8'b00000000;
				3'd3: dot_col <= 8'b00000000;
				3'd4: dot_col <= 8'b11000000;
				3'd5: dot_col <= 8'b11000000;
				3'd6: dot_col <= 8'b00000000;
				3'd7: dot_col <= 8'b00000000;
			endcase
		end
		else if(state == 4'h9)begin
			row_count <= row_count + 1;
			case(row_count)
				3'd0: dot_row <= 8'b01111111;
				3'd1: dot_row <= 8'b10111111;
				3'd2: dot_row <= 8'b11011111;
				3'd3: dot_row <= 8'b11101111;
				3'd4: dot_row <= 8'b11110111;
				3'd5: dot_row <= 8'b11111011;
				3'd6: dot_row <= 8'b11111101;
				3'd7: dot_row <= 8'b11111110;
			endcase
			case(row_count)
				3'd0: dot_col <= 8'b00000000;
				3'd1: dot_col <= 8'b00000000;
				3'd2: dot_col <= 8'b00000011;
				3'd3: dot_col <= 8'b00000011;
				3'd4: dot_col <= 8'b00000000;
				3'd5: dot_col <= 8'b00000000;
				3'd6: dot_col <= 8'b00000000;
				3'd7: dot_col <= 8'b00000000;
			endcase
		end
		else if(state == 4'h6)begin
			row_count <= row_count + 1;
			case(row_count)
				3'd0: dot_row <= 8'b01111111;
				3'd1: dot_row <= 8'b10111111;
				3'd2: dot_row <= 8'b11011111;
				3'd3: dot_row <= 8'b11101111;
				3'd4: dot_row <= 8'b11110111;
				3'd5: dot_row <= 8'b11111011;
				3'd6: dot_row <= 8'b11111101;
				3'd7: dot_row <= 8'b11111110;
			endcase
			case(row_count)
				3'd0: dot_col <= 8'b00000000;
				3'd1: dot_col <= 8'b00000000;
				3'd2: dot_col <= 8'b00001100;
				3'd3: dot_col <= 8'b00001100;
				3'd4: dot_col <= 8'b00000000;
				3'd5: dot_col <= 8'b00000000;
				3'd6: dot_col <= 8'b00000000;
				3'd7: dot_col <= 8'b00000000;
			endcase
		end
		else if(state == 4'h3)begin
			row_count <= row_count + 1;
			case(row_count)
				3'd0: dot_row <= 8'b01111111;
				3'd1: dot_row <= 8'b10111111;
				3'd2: dot_row <= 8'b11011111;
				3'd3: dot_row <= 8'b11101111;
				3'd4: dot_row <= 8'b11110111;
				3'd5: dot_row <= 8'b11111011;
				3'd6: dot_row <= 8'b11111101;
				3'd7: dot_row <= 8'b11111110;
			endcase
			case(row_count)
				3'd0: dot_col <= 8'b00000000;
				3'd1: dot_col <= 8'b00000000;
				3'd2: dot_col <= 8'b00110000;
				3'd3: dot_col <= 8'b00110000;
				3'd4: dot_col <= 8'b00000000;
				3'd5: dot_col <= 8'b00000000;
				3'd6: dot_col <= 8'b00000000;
				3'd7: dot_col <= 8'b00000000;
			endcase
		end
		else if(state == 4'hb)begin
			row_count <= row_count + 1;
			case(row_count)
				3'd0: dot_row <= 8'b01111111;
				3'd1: dot_row <= 8'b10111111;
				3'd2: dot_row <= 8'b11011111;
				3'd3: dot_row <= 8'b11101111;
				3'd4: dot_row <= 8'b11110111;
				3'd5: dot_row <= 8'b11111011;
				3'd6: dot_row <= 8'b11111101;
				3'd7: dot_row <= 8'b11111110;
			endcase
			case(row_count)
				3'd0: dot_col <= 8'b00000000;
				3'd1: dot_col <= 8'b00000000;
				3'd2: dot_col <= 8'b11000000;
				3'd3: dot_col <= 8'b11000000;
				3'd4: dot_col <= 8'b00000000;
				3'd5: dot_col <= 8'b00000000;
				3'd6: dot_col <= 8'b00000000;
				3'd7: dot_col <= 8'b00000000;
			endcase
		end
		else if(state == 4'hc)begin
			row_count <= row_count + 1;
			case(row_count)
				3'd0: dot_row <= 8'b01111111;
				3'd1: dot_row <= 8'b10111111;
				3'd2: dot_row <= 8'b11011111;
				3'd3: dot_row <= 8'b11101111;
				3'd4: dot_row <= 8'b11110111;
				3'd5: dot_row <= 8'b11111011;
				3'd6: dot_row <= 8'b11111101;
				3'd7: dot_row <= 8'b11111110;
			endcase
			case(row_count)
				3'd0: dot_col <= 8'b00000011;
				3'd1: dot_col <= 8'b00000011;
				3'd2: dot_col <= 8'b00000000;
				3'd3: dot_col <= 8'b00000000;
				3'd4: dot_col <= 8'b00000000;
				3'd5: dot_col <= 8'b00000000;
				3'd6: dot_col <= 8'b00000000;
				3'd7: dot_col <= 8'b00000000;
			endcase
		end
		else if(state == 4'hd)begin
			row_count <= row_count + 1;
			case(row_count)
				3'd0: dot_row <= 8'b01111111;
				3'd1: dot_row <= 8'b10111111;
				3'd2: dot_row <= 8'b11011111;
				3'd3: dot_row <= 8'b11101111;
				3'd4: dot_row <= 8'b11110111;
				3'd5: dot_row <= 8'b11111011;
				3'd6: dot_row <= 8'b11111101;
				3'd7: dot_row <= 8'b11111110;
			endcase
			case(row_count)
				3'd0: dot_col <= 8'b00001100;
				3'd1: dot_col <= 8'b00001100;
				3'd2: dot_col <= 8'b00000000;
				3'd3: dot_col <= 8'b00000000;
				3'd4: dot_col <= 8'b00000000;
				3'd5: dot_col <= 8'b00000000;
				3'd6: dot_col <= 8'b00000000;
				3'd7: dot_col <= 8'b00000000;
			endcase
		end
		else if(state == 4'he)begin
			row_count <= row_count + 1;
			case(row_count)
				3'd0: dot_row <= 8'b01111111;
				3'd1: dot_row <= 8'b10111111;
				3'd2: dot_row <= 8'b11011111;
				3'd3: dot_row <= 8'b11101111;
				3'd4: dot_row <= 8'b11110111;
				3'd5: dot_row <= 8'b11111011;
				3'd6: dot_row <= 8'b11111101;
				3'd7: dot_row <= 8'b11111110;
			endcase
			case(row_count)
				3'd0: dot_col <= 8'b00110000;
				3'd1: dot_col <= 8'b00110000;
				3'd2: dot_col <= 8'b00000000;
				3'd3: dot_col <= 8'b00000000;
				3'd4: dot_col <= 8'b00000000;
				3'd5: dot_col <= 8'b00000000;
				3'd6: dot_col <= 8'b00000000;
				3'd7: dot_col <= 8'b00000000;
			endcase
		end
		else begin
			row_count <= row_count + 1;
			case(row_count)
				3'd0: dot_row <= 8'b01111111;
				3'd1: dot_row <= 8'b10111111;
				3'd2: dot_row <= 8'b11011111;
				3'd3: dot_row <= 8'b11101111;
				3'd4: dot_row <= 8'b11110111;
				3'd5: dot_row <= 8'b11111011;
				3'd6: dot_row <= 8'b11111101;
				3'd7: dot_row <= 8'b11111110;
			endcase
			case(row_count)
				3'd0: dot_col <= 8'b11000000;
				3'd1: dot_col <= 8'b11000000;
				3'd2: dot_col <= 8'b00000000;
				3'd3: dot_col <= 8'b00000000;
				3'd4: dot_col <= 8'b00000000;
				3'd5: dot_col <= 8'b00000000;
				3'd6: dot_col <= 8'b00000000;
				3'd7: dot_col <= 8'b00000000;
			endcase
		end
		
	end
	t_out0 <= time_out0;
	t_out1 <= time_out1;
	dp1 <= display1;
	dp2 <= display2;
	keyrow <= kr;
end

endmodule

module clk_div_display(clk,rst,div_clk);

input clk,rst;
output div_clk;

reg div_clk;
reg [32:0]count;

always@(posedge clk)
begin
    if(!rst) //重置
    begin
        count <= 32'd0;
        div_clk <= 1'b0;
    end
    else
    begin
        if(count == `TimeExpireDisplay)
        begin
            count <= 32'd0;
            div_clk <= ~div_clk;
        end
        else
        begin
            count <= count +32'd1;
        end
    end
end
endmodule

module clk_div_count(clk,rst,div_clk);

input clk,rst;
output div_clk;

reg div_clk;
reg [32:0]count;

always@(posedge clk)
begin
    if(!rst) //重置
    begin
        count <= 32'd0;
        div_clk <= 1'b0;
    end
    else
    begin
        if(count == `TimeExpireCount)
        begin
            count <= 32'd0;
            div_clk <= ~div_clk;
        end
        else
        begin
            count <= count +32'd1;
        end
    end
end
endmodule

module Random(clk, score, out);

input clk;
input [6:0]score;
output [3:0]out;

reg [31:0]count, temp;
reg [3:0]out;

always @(posedge clk)
begin
	if(count == `TimeExpireR)begin
		count <= 32'd0;
	end
	else begin
		count <= count +32'd1;
	end
end

always @(count or score)
begin
	temp = score*score*score;
	if(count > temp) out = ((count - temp)%16);
	else out = ((temp - count)%16);
end

endmodule

module countdown(clk, reset,done , out0, out1, count);

input clk, reset;

output reg [6:0] out0, out1;
output reg [4:0] count = 5'd30;
reg [3:0] bit1, bit0;
output reg done = 0;


wire [6:0] out00, out10;

seven s1(.count(bit1), .out(out10));
seven s0(.count(bit0), .out(out00));

always@(posedge clk or negedge reset)
begin

	if(~reset)
	begin
		done <= 0;
		count <= 5'd30;
		bit0 <= 4'd0;
		bit1 <= 4'd3;
	end
	else
	begin
		if(count == 0)
		begin
			count <= 0;
			done <= 1;
		end
		else
		begin
			count <= count - 1;
		end
		
		if(count >= 5'd30)
		begin
			bit1 <= 4'd3;
			bit0 <= count - 5'd30;
		end
		else if(count >= 5'd20)
		begin
			bit1 <= 4'd2;
			bit0 <= count - 5'd20;
		end
		else if(count >= 5'd10)
		begin
			bit1 <= 4'd1;
			bit0 <= count - 5'd10;
		end
		else
		begin
			bit1 <= 4'd0 ;
			bit0 <= count;
		end
	end
	
	out0 <= out00;
	out1 <= out10;
	
end

endmodule

module seven(count, out);
input [3:0]count;
output reg [6:0]out;

always@(count)
begin
	case(count)
		4'b0000:begin
			out = 7'b1000000;
		end
		4'b0001:begin
			out = 7'b1111001;
		end
		4'b0010:begin
			out = 7'b0100100;
		end
		4'b0011:begin
			out = 7'b0110000;
		end
		4'b0100:begin
			out = 7'b0011001;
		end
		4'b0101:begin
			out = 7'b0010010;
		end
		4'b0110:begin
			out = 7'b0000010;
		end
		4'b0111:begin
			out = 7'b1111000;
		end
		4'b1000:begin
			out = 7'b0000000;
		end
		4'b1001:begin
			out = 7'b0010000;
		end
	endcase
end

endmodule

module ScoreDisplay(score, display1, display2);

input [6:0]score;
output [6:0]display1, display2;

reg [3:0]Ten, One;
reg [6:0]display1,display2;

always @(score)
begin
	if(score == 7'd127)begin
		display1 = 7'b1000000;
		display2 = 7'b1000000;
	end else begin 
		Ten = score / 10;
		One = score % 10;
		case(Ten)
			4'h0: display1 = 7'b1000000;
			4'h1: display1 = 7'b1111001;
			4'h2: display1 = 7'b0100100;
			4'h3: display1 = 7'b0110000;
			4'h4: display1 = 7'b0011001;
			4'h5: display1 = 7'b0010010;
			4'h6: display1 = 7'b0000010;
			4'h7: display1 = 7'b1111000;
			4'h8: display1 = 7'b0000000;
			4'h9: display1 = 7'b0010000;
        default: display1 = 7'b0111111;
		endcase
		case(One)
			4'h0: display2 = 7'b1000000;
			4'h1: display2 = 7'b1111001;
			4'h2: display2 = 7'b0100100;
			4'h3: display2 = 7'b0110000;
			4'h4: display2 = 7'b0011001;
			4'h5: display2 = 7'b0010010;
			4'h6: display2 = 7'b0000010;
			4'h7: display2 = 7'b1111000;
			4'h8: display2 = 7'b0000000;
			4'h9: display2 = 7'b0010000;
        default: display2 = 7'b111111;
		endcase
	end
end
endmodule

module keyPad(clock,reset,timecountdown,isclear,dot_row,dot_col,keypadRow,keypadCol,state, score);
input clock,reset;
input[3:0] keypadCol;
input[3:0] state;
input[4:0] timecountdown;
output reg isclear;
output reg[7:0] dot_row,dot_col;
output reg[3:0] keypadRow;
output reg[6:0] score = 7'd127;
reg[31:0] count1;
reg[3:0]keypadBuf;
reg[2:0]row_count;
reg[3:0]State_Temp = 4'b0001;
reg Hit;

always@(posedge clock or negedge reset)
begin
	if(!reset)
	begin
		State_Temp<=4'b0001;
		score <= 7'd127;
		isclear<=0;
		keypadRow<=4'b1110;
		keypadBuf<=4'b0000;
		dot_row<=8'b11111111;
		dot_col<=8'b00000000;
		count1<=32'b0;
	end
	else
	begin
		if(count1==32'd100)
		begin
			count1<=32'b0;
			case({keypadRow,keypadCol})
				8'b1110_1110:keypadBuf<=4'h7;
				8'b1110_1101:keypadBuf<=4'h4;
				8'b1110_1011:keypadBuf<=4'h1;
				8'b1110_0111:keypadBuf<=4'h0;
				8'b1101_1110:keypadBuf<=4'h8;
				8'b1101_1101:keypadBuf<=4'h5;
				8'b1101_1011:keypadBuf<=4'h2;
				8'b1101_0111:keypadBuf<=4'ha;
				8'b1011_1110:keypadBuf<=4'h9;
				8'b1011_1101:keypadBuf<=4'h6;
				8'b1011_1011:keypadBuf<=4'h3;
				8'b1011_0111:keypadBuf<=4'hb;
				8'b0111_1110:keypadBuf<=4'hc;
				8'b0111_1101:keypadBuf<=4'hd;
				8'b0111_1011:keypadBuf<=4'he;
				8'b0111_0111:keypadBuf<=4'hf;
				default :keypadBuf<=keypadBuf;
			endcase

			case(keypadRow)
				4'b1110:keypadRow<=4'b1101;
				4'b1101:keypadRow<=4'b1011;
				4'b1011:keypadRow<=4'b0111;
				4'b0111:keypadRow<=4'b1110;
				default:keypadRow<=4'b1110;
			endcase

		end
		else
		begin
			count1<=count1+32'b1;
		end
		
		
		if(timecountdown == 0)
		begin
			score <= score;
		end
		else if(State_Temp != state && keypadBuf == state)begin
			score <= score + 1;
			isclear <= 1;
			State_Temp <= state;
			case(row_count)
				3'd0:dot_col<=8'b00000000;
				3'd1:dot_col<=8'b00000000;
				3'd2:dot_col<=8'b00000000;
				3'd3:dot_col<=8'b00000000;
				3'd4:dot_col<=8'b00000000;
				3'd5:dot_col<=8'b00000000;
				3'd6:dot_col<=8'b00000000;
				3'd7:dot_col<=8'b00000000;
			endcase
		end
		else
		begin
			score <= score;
			isclear <= 0;
		end
	end
end

endmodule
