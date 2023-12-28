module main(clk, rst, keypadCol, keypadRow, dot_row, dot_col);
input clk, rst;

input [3:0]keypadCol;
output[3:0]keypadRow;

output [7:0]dot_row;
output [7:0]dot_col;

wire clk_light_div;
wire clk_div;
wire [4:0]keypadBuf;
wire [1:0]status_0;
wire [1:0]status_1;
wire [1:0]status_2;
wire [1:0]status_3;
wire [1:0]status_4;
wire [1:0]status_5;
wire [1:0]status_6;
wire [1:0]status_7;
wire [1:0]status_8;
wire [1:0]status_9;
wire [1:0]status_10;
wire [1:0]status_11;
wire [1:0]status_12;
wire [1:0]status_13;
wire [1:0]status_14;
wire [1:0]status_15;

wire [2:0]No0_state;
wire [2:0]No1_state;
wire [2:0]No2_state;
wire [2:0]No3_state;
wire [2:0]No4_state;
wire [2:0]No5_state;
wire [2:0]No6_state;
wire [2:0]No7_state;
wire [2:0]No8_state;
wire [2:0]No9_state;
wire [2:0]No10_state;
wire [2:0]No11_state;
wire [2:0]No12_state;
wire [2:0]No13_state;
wire [2:0]No14_state;
wire [2:0]No15_state;

//wire mouse_bomb;
//wire [3:0] which_box;

clock_divider divider_unit(.clk(clk), .rst(rst), .clk_div(clk_div));
clock_light_divider(.clk(clk), .rst(rst), .clk_light_div(clk_light_div));
checkKeyboard check(.clk(clk_light_div), .rst(rst), .keypadCol(keypadCol), .keypadRow(keypadRow), .keypadBuf(keypadBuf));

//Random_Box ran(.clk(clk), .clk_1Hz(clk_div), .reset(rst), .mouse_bomb(mouse_bomb), .which_box(which_box))

No0_box boxer_0(.clk(clk), .clk_1Hz(clk_div), .reset(rst), .threesec(1), .mouse_bomb(0), .which_box(4'b0000), .keypadBuf(keypadBuf), .status(status_0), .No0_state(No0_state));
No1_box boxer_1(.clk(clk), .clk_1Hz(clk_div), .reset(rst), .threesec(1), .mouse_bomb(1), .which_box(4'b0001), .keypadBuf(keypadBuf), .status(status_1), .No1_state(No1_state));
No2_box boxer_2(.clk(clk), .clk_1Hz(clk_div), .reset(rst), .threesec(1), .mouse_bomb(0), .which_box(4'b0010), .keypadBuf(keypadBuf), .status(status_2), .No2_state(No2_state));
No3_box boxer_3(.clk(clk), .clk_1Hz(clk_div), .reset(rst), .threesec(1), .mouse_bomb(1), .which_box(4'b0011), .keypadBuf(keypadBuf), .status(status_3), .No3_state(No3_state));
No4_box boxer_4(.clk(clk), .clk_1Hz(clk_div), .reset(rst), .threesec(1), .mouse_bomb(0), .which_box(4'b0100), .keypadBuf(keypadBuf), .status(status_4), .No4_state(No4_state));
No5_box boxer_5(.clk(clk), .clk_1Hz(clk_div), .reset(rst), .threesec(1), .mouse_bomb(1), .which_box(4'b0101), .keypadBuf(keypadBuf), .status(status_5), .No5_state(No5_state));
No6_box boxer_6(.clk(clk), .clk_1Hz(clk_div), .reset(rst), .threesec(1), .mouse_bomb(0), .which_box(4'b0110), .keypadBuf(keypadBuf), .status(status_6), .No6_state(No6_state));
No7_box boxer_7(.clk(clk), .clk_1Hz(clk_div), .reset(rst), .threesec(1), .mouse_bomb(1), .which_box(4'b0111), .keypadBuf(keypadBuf), .status(status_7), .No7_state(No7_state));
No8_box boxer_8(.clk(clk), .clk_1Hz(clk_div), .reset(rst), .threesec(1), .mouse_bomb(0), .which_box(4'b1000), .keypadBuf(keypadBuf), .status(status_8), .No8_state(No8_state));
No9_box boxer_9(.clk(clk), .clk_1Hz(clk_div), .reset(rst), .threesec(1), .mouse_bomb(1), .which_box(4'b1001), .keypadBuf(keypadBuf), .status(status_9), .No9_state(No9_state));
No10_box boxer_10(.clk(clk), .clk_1Hz(clk_div), .reset(rst), .threesec(1), .mouse_bomb(1), .which_box(4'b1010), .keypadBuf(keypadBuf), .status(status_10), .No10_state(No10_state));
No11_box boxer_11(.clk(clk), .clk_1Hz(clk_div), .reset(rst), .threesec(1), .mouse_bomb(0), .which_box(4'b1011), .keypadBuf(keypadBuf), .status(status_11), .No11_state(No11_state));
No12_box boxer_12(.clk(clk), .clk_1Hz(clk_div), .reset(rst), .threesec(1), .mouse_bomb(0), .which_box(4'b1100), .keypadBuf(keypadBuf), .status(status_12), .No12_state(No12_state));
No13_box boxer_13(.clk(clk), .clk_1Hz(clk_div), .reset(rst), .threesec(1), .mouse_bomb(1), .which_box(4'b1101), .keypadBuf(keypadBuf), .status(status_13), .No13_state(No13_state));
No14_box boxer_14(.clk(clk), .clk_1Hz(clk_div), .reset(rst), .threesec(1), .mouse_bomb(0), .which_box(4'b1110), .keypadBuf(keypadBuf), .status(status_14), .No14_state(No14_state));
No15_box boxer_15(.clk(clk), .clk_1Hz(clk_div), .reset(rst), .threesec(1), .mouse_bomb(1), .which_box(4'b1111), .keypadBuf(keypadBuf), .status(status_15), .No15_state(No15_state));


Matrix_Display displayer(
    .clk_10000Hz(clk_light_div), 
    .clk_div(clk_div), 
    .threesec(1), 
    .reset(rst), 
    .No0_state(No0_state),
    .No1_state(No1_state),
    .No2_state(No2_state),
    .No3_state(No3_state),
    .No4_state(No4_state),
    .No5_state(No5_state),
    .No6_state(No6_state),
    .No7_state(No7_state),
    .No8_state(No8_state),
    .No9_state(No9_state),
    .No10_state(No10_state),
    .No11_state(No11_state),
    .No12_state(No12_state),
    .No13_state(No13_state), 
    .No14_state(No14_state), 
    .No15_state(No15_state), 
    .dot_row(dot_row), 
    .dot_column(dot_col)
);
endmodule



//KeyBoard
module checkKeyboard(clk, rst, keypadCol, keypadRow, keypadBuf);

input clk, rst;
input [3:0]keypadCol;
output reg [3:0]keypadRow;
output reg [4:0]keypadBuf;

always@(posedge clk or negedge rst) begin
	if(!rst) begin
		keypadRow <= 4'b1111;
		keypadBuf <= 5'b10000;
		
	end
	else begin
			//check keyboard
			case({keypadRow, keypadCol})
				8'b1110_1110: keypadBuf <= 5'b00111;
				8'b1110_1101: keypadBuf <= 5'b00100;
				8'b1110_1011: keypadBuf <= 5'b00001;
				8'b1110_0111: keypadBuf <= 5'b00000;
				
				8'b1101_1110: keypadBuf <= 5'b01000;
				8'b1101_1101: keypadBuf <= 5'b00101;
				8'b1101_1011: keypadBuf <= 5'b00010;
				8'b1101_0111: keypadBuf <= 5'b01010;
				
				8'b1011_1110: keypadBuf <= 5'b01001;
				8'b1011_1101: keypadBuf <= 5'b00110;
				8'b1011_1011: keypadBuf <= 5'b00011;
				8'b1011_0111: keypadBuf <= 5'b01011;
				
				8'b0111_1110: keypadBuf <= 5'b01100;
				8'b0111_1101: keypadBuf <= 5'b01101;
				8'b0111_1011: keypadBuf <= 5'b01110;
				8'b0111_0111: keypadBuf <= 5'b01111;
				default		: keypadBuf <= keypadBuf;
			endcase
			//change detect Row;
			case(keypadRow)
				4'b1110: keypadRow <= 4'b1101;
				4'b1101: keypadRow <= 4'b1011;
				4'b1011: keypadRow <= 4'b0111;
				4'b0111: keypadRow <= 4'b1110;
				default: keypadRow <= 4'b1110;
			endcase
	end
end
endmodule

module No0_box(
	input clk,
	input clk_1Hz,
	input reset,
	input threesec,
	input mouse_bomb,
	input [3:0] which_box,
	input [4:0] keypadBuf,
	output reg [1:0] status,
	output reg [2:0] No0_state
);

	reg	which_box_changed;
	reg mouse_bomb_memory;
	reg button_clicked;
	reg [1:0] count;

	always@(posedge clk)
	begin
		if(!reset)
		begin
			which_box_changed<=1'b0;
			mouse_bomb_memory<=1'b0;
		end
		else if(threesec)
		begin
			if(which_box==4'd0)//here
			begin
				if(!which_box_changed)
				begin
					case(mouse_bomb)
					1'b0:mouse_bomb_memory<=1'b0;
					1'b1:mouse_bomb_memory<=1'b1;
					endcase
					which_box_changed<=1'b1;
				end
				else
				begin
					//do nothing
				end
			end
			else
			begin
				which_box_changed<=1'b0;
			end
		end
		else
		begin
			which_box_changed<=1'b0;
			mouse_bomb_memory<=1'b0;
		end
	end

	always@(posedge clk_1Hz)
	begin
		if(!reset)
		begin
			count<=2'd0;
		end
		else if(threesec)
		begin
			if(which_box_changed || count!=2'd0)
			begin
				if(count == 2'd3)
				begin
					count<= 2'd0;
				end
				else
				begin
					count<=count+2'd1;
				end
			end
			else
			begin
				count<=2'd0;
			end
		end
		else
		begin
			count<=2'd0;
		end
	end

	always@(posedge clk)
	begin
		if(!reset)
		begin
			button_clicked<=1'b0;
			status<=2'd0;
			No0_state<=3'd0;
		end
		else if(threesec)
		begin
			if(count!=2'd0)
			begin
				if(button_clicked)
				begin
					if(mouse_bomb_memory)//bomb 100
					begin
						No0_state<=3'd4; //hitted bomb
					end
					else//mouse 011
					begin
						No0_state<=3'd3; //hitted mouse
					end
				end
				else
				begin
					if(mouse_bomb_memory)//bomb 010
					begin
						No0_state<=3'd2; //usual bomb
					end
					else//mouse 001
					begin
						No0_state<=3'd1; //usual mouse
					end
				end
				if(count == 2'd3)
				begin
					if(mouse_bomb_memory)
					begin
						No0_state<= 3'd4; //if not be pressed -> bomb delete
					end
					else
					begin
						No0_state<= 3'd3; //if not be pressed -> mouse deleted
					end
				end
			end
			else
			begin
				No0_state<=3'd0;
			end

			if(count!=2'd0 && keypadBuf==5'b00000)//here
			begin
				if(mouse_bomb_memory)//bomb
				begin
					status<=2'b10;
					button_clicked<=1'b1;
				end
				else//mouse
				begin
					status<=2'b01;
					button_clicked<=1'b1;
				end
			end
			else
			begin
				status<=2'd0;
			end
		end
		else
		begin
			button_clicked<=1'b0;
			status<=2'd0;
			No0_state<=3'd0;
		end
	end

endmodule
////////////////////
module No1_box(
	input clk,
	input clk_1Hz,
	input reset,
	input threesec,
	input mouse_bomb,
	input [3:0] which_box,
	input [4:0] keypadBuf,
	output reg [1:0] status,
	output reg [2:0] No1_state
);

	reg	which_box_changed;
	reg mouse_bomb_memory;
	reg button_clicked;
	reg [1:0] count;

	always@(posedge clk)
	begin
		if(!reset)
		begin
			which_box_changed<=1'b0;
			mouse_bomb_memory<=1'b0;
		end
		else if(threesec)
		begin
			if(which_box==4'h1)//here
			begin
				if(!which_box_changed)
				begin
					case(mouse_bomb)
					1'b0:mouse_bomb_memory<=1'b0;
					1'b1:mouse_bomb_memory<=1'b1;
					endcase
					which_box_changed<=1'b1;
				end
				else
				begin
					//do nothing
				end
			end
			else
			begin
				which_box_changed<=1'b0;
			end
		end
		else
		begin
			which_box_changed<=1'b0;
			mouse_bomb_memory<=1'b0;
		end
	end

	always@(posedge clk_1Hz)
	begin
		if(!reset)
		begin
			count<=2'd0;
		end
		else if(threesec)
		begin
			if(which_box_changed || count!=2'd0)
			begin
				if(count == 2'd3)
				begin
					count<= 2'd0;
				end
				else
				begin
					count<=count+2'd1;
				end
			end
			else
			begin
				count<=2'd0;
			end
		end
		else
		begin
			count<=2'd0;
		end
	end

	always@(posedge clk)
	begin
		if(!reset)
		begin
			button_clicked<=1'b0;
			status<=2'd0;
			No1_state<=3'd0;
		end
		else if(threesec)
		begin
			if(count!=2'd0)
			begin
				if(button_clicked)
				begin
					if(mouse_bomb_memory)//bomb 100
					begin
						No1_state<=3'd4; //hitted bomb
					end
					else//mouse 011
					begin
						No1_state<=3'd3; //hitted mouse
					end
				end
				else
				begin
					if(mouse_bomb_memory)//bomb 010
					begin
						No1_state<=3'd2; //usual bomb
					end
					else//mouse 001
					begin
						No1_state<=3'd1; //usual mouse
					end
				end
				if(count == 2'd3)
				begin
					if(mouse_bomb_memory)
					begin
						No1_state<= 3'd4; //if not be pressed -> bomb delete
					end
					else
					begin
						No1_state<= 3'd3; //if not be pressed -> mouse deleted
					end
				end
			end
			else
			begin
				No1_state<=3'd0;
			end

			if(count!=2'd0 && keypadBuf==5'b00001)//here
			begin
				if(mouse_bomb_memory)//bomb
				begin
					status<=2'b10;
					button_clicked<=1'b1;
				end
				else//mouse
				begin
					status<=2'b01;
					button_clicked<=1'b1;
				end
			end
			else
			begin
				status<=2'd0;
			end
		end
		else
		begin
			button_clicked<=1'b0;
			status<=2'd0;
			No1_state<=3'd0;
		end
	end

endmodule
////////////////////////

module No2_box(
	input clk,
	input clk_1Hz,
	input reset,
	input threesec,
	input mouse_bomb,
	input [3:0] which_box,
	input [4:0] keypadBuf,
	output reg [1:0] status,
	output reg [2:0] No2_state
);

	reg	which_box_changed;
	reg mouse_bomb_memory;
	reg button_clicked;
	reg [1:0] count;

	always@(posedge clk)
	begin
		if(!reset)
		begin
			which_box_changed<=1'b0;
			mouse_bomb_memory<=1'b0;
		end
		else if(threesec)
		begin
			if(which_box==4'd2)//here
			begin
				if(!which_box_changed)
				begin
					case(mouse_bomb)
					1'b0:mouse_bomb_memory<=1'b0;
					1'b1:mouse_bomb_memory<=1'b1;
					endcase
					which_box_changed<=1'b1;
				end
				else
				begin
					//do nothing
				end
			end
			else
			begin
				which_box_changed<=1'b0;
			end
		end
		else
		begin
			which_box_changed<=1'b0;
			mouse_bomb_memory<=1'b0;
		end
	end

	always@(posedge clk_1Hz)
	begin
		if(!reset)
		begin
			count<=2'd0;
		end
		else if(threesec)
		begin
			if(which_box_changed || count!=2'd0)
			begin
				if(count == 2'd3)
				begin
					count<= 2'd0;
				end
				else
				begin
					count<=count+2'd1;
				end
			end
			else
			begin
				count<=2'd0;
			end
		end
		else
		begin
			count<=2'd0;
		end
	end

	always@(posedge clk)
	begin
		if(!reset)
		begin
			button_clicked<=1'b0;
			status<=2'd0;
			No2_state<=3'd0;
		end
		else if(threesec)
		begin
			if(count!=2'd0)
			begin
				if(button_clicked)
				begin
					if(mouse_bomb_memory)//bomb 100
					begin
						No2_state<=3'd4; //hitted bomb
					end
					else//mouse 011
					begin
						No2_state<=3'd3; //hitted mouse
					end
				end
				else
				begin
					if(mouse_bomb_memory)//bomb 010
					begin
						No2_state<=3'd2; //usual bomb
					end
					else//mouse 001
					begin
						No2_state<=3'd1; //usual mouse
					end
				end
				if(count == 2'd3)
				begin
					if(mouse_bomb_memory)
					begin
						No2_state<= 3'd4; //if not be pressed -> bomb delete
					end
					else
					begin
						No2_state<= 3'd3; //if not be pressed -> mouse deleted
					end
				end
			end
			else
			begin
				No2_state<=3'd0;
			end

			if(count!=2'd0 && keypadBuf==5'b00010)//here
			begin
				if(mouse_bomb_memory)//bomb
				begin
					status<=2'b10;
					button_clicked<=1'b1;
				end
				else//mouse
				begin
					status<=2'b01;
					button_clicked<=1'b1;
				end
			end
			else
			begin
				status<=2'd0;
			end
		end
		else
		begin
			button_clicked<=1'b0;
			status<=2'd0;
			No2_state<=3'd0;
		end
	end

endmodule
/////////////////////////////////////////////////

module No3_box(
	input clk,
	input clk_1Hz,
	input reset,
	input threesec,
	input mouse_bomb,
	input [3:0] which_box,
	input [4:0] keypadBuf,
	output reg [1:0] status,
	output reg [2:0] No3_state
);

	reg	which_box_changed;
	reg mouse_bomb_memory;
	reg button_clicked;
	reg [1:0] count;

	always@(posedge clk)
	begin
		if(!reset)
		begin
			which_box_changed<=1'b0;
			mouse_bomb_memory<=1'b0;
		end
		else if(threesec)
		begin
			if(which_box==4'h3)//here
			begin
				if(!which_box_changed)
				begin
					case(mouse_bomb)
					1'b0:mouse_bomb_memory<=1'b0;
					1'b1:mouse_bomb_memory<=1'b1;
					endcase
					which_box_changed<=1'b1;
				end
				else
				begin
					//do nothing
				end
			end
			else
			begin
				which_box_changed<=1'b0;
			end
		end
		else
		begin
			which_box_changed<=1'b0;
			mouse_bomb_memory<=1'b0;
		end
	end

	always@(posedge clk_1Hz)
	begin
		if(!reset)
		begin
			count<=2'd0;
		end
		else if(threesec)
		begin
			if(which_box_changed || count!=2'd0)
			begin
				if(count == 2'd3)
				begin
					count<= 2'd0;
				end
				else
				begin
					count<=count+2'd1;
				end
			end
			else
			begin
				count<=2'd0;
			end
		end
		else
		begin
			count<=2'd0;
		end
	end

	always@(posedge clk)
	begin
		if(!reset)
		begin
			button_clicked<=1'b0;
			status<=2'd0;
			No3_state<=3'd0;
		end
		else if(threesec)
		begin
			if(count!=2'd0)
			begin
				if(button_clicked)
				begin
					if(mouse_bomb_memory)//bomb 100
					begin
						No3_state<=3'd4; //hitted bomb
					end
					else//mouse 011
					begin
						No3_state<=3'd3; //hitted mouse
					end
				end
				else
				begin
					if(mouse_bomb_memory)//bomb 010
					begin
						No3_state<=3'd2; //usual bomb
					end
					else//mouse 001
					begin
						No3_state<=3'd1; //usual mouse
					end
				end
				if(count == 2'd3)
				begin
					if(mouse_bomb_memory)
					begin
						No3_state<= 3'd4; //if not be pressed -> bomb delete
					end
					else
					begin
						No3_state<= 3'd3; //if not be pressed -> mouse deleted
					end
				end
			end
			else
			begin
				No3_state<=3'd0;
			end

			if(count!=2'd0 && keypadBuf==5'b00011)//here
			begin
				if(mouse_bomb_memory)//bomb
				begin
					status<=2'b10;
					button_clicked<=1'b1;
				end
				else//mouse
				begin
					status<=2'b01;
					button_clicked<=1'b1;
				end
			end
			else
			begin
				status<=2'd0;
			end
		end
		else
		begin
			button_clicked<=1'b0;
			status<=2'd0;
			No3_state<=3'd0;
		end
	end

endmodule
/////////////////////////////////////////////////

module No4_box(
	input clk,
	input clk_1Hz,
	input reset,
	input threesec,
	input mouse_bomb,
	input [3:0] which_box,
	input [4:0] keypadBuf,
	output reg [1:0] status,
	output reg [2:0] No4_state
);

	reg which_box_changed;
	reg mouse_bomb_memory;
	reg button_clicked;
	reg [1:0] count;

	always@(posedge clk)
	begin
		if(!reset)
		begin
			which_box_changed<=1'b0;
			mouse_bomb_memory<=1'b0;
		end
		else if(threesec)
		begin
			if(which_box==4'd4)//here
			begin
				if(!which_box_changed)
				begin
					case(mouse_bomb)
					1'b0:mouse_bomb_memory<=1'b0;
					1'b1:mouse_bomb_memory<=1'b1;
					endcase
					which_box_changed<=1'b1;
				end
				else
				begin
					//do nothing
				end
			end
			else
			begin
				which_box_changed<=1'b0;
			end
		end
		else
		begin
			which_box_changed<=1'b0;
			mouse_bomb_memory<=1'b0;
		end
	end

	always@(posedge clk_1Hz)
	begin
		if(!reset)
		begin
			count<=2'd0;
		end
		else if(threesec)
		begin
			if(which_box_changed || count!=2'd0)
			begin
				if(count == 2'd3)
				begin
					count<= 2'd0;
				end
				else
				begin
					count<=count+2'd1;
				end
			end
			else
			begin
				count<=2'd0;
			end
		end
		else
		begin
			count<=2'd0;
		end
	end

	always@(posedge clk)
	begin
		if(!reset)
		begin
			button_clicked<=1'b0;
			status<=2'd0;
			No4_state<=3'd0;
		end
		else if(threesec)
		begin
			if(count!=2'd0)
			begin
				if(button_clicked)
				begin
					if(mouse_bomb_memory)//bomb 100
					begin
						No4_state<=3'd4; //hitted bomb
					end
					else//mouse 011
					begin
						No4_state<=3'd3; //hitted mouse
					end
				end
				else
				begin
					if(mouse_bomb_memory)//bomb 010
					begin
						No4_state<=3'd2; //usual bomb
					end
					else//mouse 001
					begin
						No4_state<=3'd1; //usual mouse
					end
				end
				if(count == 2'd3)
				begin
					if(mouse_bomb_memory)
					begin
						No4_state<= 3'd4; //if not be pressed -> bomb delete
					end
					else
					begin
						No4_state<= 3'd3; //if not be pressed -> mouse deleted
					end
				end
			end
			else
			begin
				No4_state<=3'd0;
			end

			if(count!=2'd0 && keypadBuf==5'b00100)//here
			begin
				if(mouse_bomb_memory)//bomb
				begin
					status<=2'b10;
					button_clicked<=1'b1;
				end
				else//mouse
				begin
					status<=2'b01;
					button_clicked<=1'b1;
				end
			end
			else
			begin
				status<=2'd0;
			end
		end
		else
		begin
			button_clicked<=1'b0;
			status<=2'd0;
			No4_state<=3'd0;
		end
	end

endmodule
/////////////////////////////////////////////////

module No5_box(
	input clk,
	input clk_1Hz,
	input reset,
	input threesec,
	input mouse_bomb,
	input [3:0] which_box,
	input [4:0] keypadBuf,
	output reg [1:0] status,
	output reg [2:0] No5_state
);

	reg	which_box_changed;
	reg mouse_bomb_memory;
	reg button_clicked;
	reg [1:0] count;

	always@(posedge clk)
	begin
		if(!reset)
		begin
			which_box_changed<=1'b0;
			mouse_bomb_memory<=1'b0;
		end
		else if(threesec)
		begin
			if(which_box==4'h5)//here
			begin
				if(!which_box_changed)
				begin
					case(mouse_bomb)
					1'b0:mouse_bomb_memory<=1'b0;
					1'b1:mouse_bomb_memory<=1'b1;
					endcase
					which_box_changed<=1'b1;
				end
				else
				begin
					//do nothing
				end
			end
			else
			begin
				which_box_changed<=1'b0;
			end
		end
		else
		begin
			which_box_changed<=1'b0;
			mouse_bomb_memory<=1'b0;
		end
	end

	always@(posedge clk_1Hz)
	begin
		if(!reset)
		begin
			count<=2'd0;
		end
		else if(threesec)
		begin
			if(which_box_changed || count!=2'd0)
			begin
				if(count == 2'd3)
				begin
					count<= 2'd0;
				end
				else
				begin
					count<=count+2'd1;
				end
			end
			else
			begin
				count<=2'd0;
			end
		end
		else
		begin
			count<=2'd0;
		end
	end

	always@(posedge clk)
	begin
		if(!reset)
		begin
			button_clicked<=1'b0;
			status<=2'd0;
			No5_state<=3'd0;
		end
		else if(threesec)
		begin
			if(count!=2'd0)
			begin
				if(button_clicked)
				begin
					if(mouse_bomb_memory)//bomb 100
					begin
						No5_state<=3'd4; //hitted bomb
					end
					else//mouse 011
					begin
						No5_state<=3'd3; //hitted mouse
					end
				end
				else
				begin
					if(mouse_bomb_memory)//bomb 010
					begin
						No5_state<=3'd2; //usual bomb
					end
					else//mouse 001
					begin
						No5_state<=3'd1; //usual mouse
					end
				end
				if(count == 2'd3)
				begin
					if(mouse_bomb_memory)
					begin
						No5_state<= 3'd4; //if not be pressed -> bomb delete
					end
					else
					begin
						No5_state<= 3'd3; //if not be pressed -> mouse deleted
					end
				end
			end
			else
			begin
				No5_state<=3'd0;
			end

			if(count!=2'd0 && keypadBuf==5'b00101)//here
			begin
				if(mouse_bomb_memory)//bomb
				begin
					status<=2'b10;
					button_clicked<=1'b1;
				end
				else//mouse
				begin
					status<=2'b01;
					button_clicked<=1'b1;
				end
			end
			else
			begin
				status<=2'd0;
			end
		end
		else
		begin
			button_clicked<=1'b0;
			status<=2'd0;
			No5_state<=3'd0;
		end
	end

endmodule
//////////////////////////////////////////

module No6_box(
	input clk,
	input clk_1Hz,
	input reset,
	input threesec,
	input mouse_bomb,
	input [3:0] which_box,
	input [4:0] keypadBuf,
	output reg [1:0] status,
	output reg [2:0] No6_state
);

	reg	which_box_changed;
	reg mouse_bomb_memory;
	reg button_clicked;
	reg [1:0] count;

	always@(posedge clk)
	begin
		if(!reset)
		begin
			which_box_changed<=1'b0;
			mouse_bomb_memory<=1'b0;
		end
		else if(threesec)
		begin
			if(which_box==4'h6)//here
			begin
				if(!which_box_changed)
				begin
					case(mouse_bomb)
					1'b0:mouse_bomb_memory<=1'b0;
					1'b1:mouse_bomb_memory<=1'b1;
					endcase
					which_box_changed<=1'b1;
				end
				else
				begin
					//do nothing
				end
			end
			else
			begin
				which_box_changed<=1'b0;
			end
		end
		else
		begin
			which_box_changed<=1'b0;
			mouse_bomb_memory<=1'b0;
		end
	end

	always@(posedge clk_1Hz)
	begin
		if(!reset)
		begin
			count<=2'd0;
		end
		else if(threesec)
		begin
			if(which_box_changed || count!=2'd0)
			begin
				if(count == 2'd3)
				begin
					count<= 2'd0;
				end
				else
				begin
					count<=count+2'd1;
				end
			end
			else
			begin
				count<=2'd0;
			end
		end
		else
		begin
			count<=2'd0;
		end
	end

	always@(posedge clk)
	begin
		if(!reset)
		begin
			button_clicked<=1'b0;
			status<=2'd0;
			No6_state<=3'd0;
		end
		else if(threesec)
		begin
			if(count!=2'd0)
			begin
				if(button_clicked)
				begin
					if(mouse_bomb_memory)//bomb 100
					begin
						No6_state<=3'd4; //hitted bomb
					end
					else//mouse 011
					begin
						No6_state<=3'd3; //hitted mouse
					end
				end
				else
				begin
					if(mouse_bomb_memory)//bomb 010
					begin
						No6_state<=3'd2; //usual bomb
					end
					else//mouse 001
					begin
						No6_state<=3'd1; //usual mouse
					end
				end
				if(count == 2'd3)
				begin
					if(mouse_bomb_memory)
					begin
						No6_state<= 3'd4; //if not be pressed -> bomb delete
					end
					else
					begin
						No6_state<= 3'd3; //if not be pressed -> mouse deleted
					end
				end
			end
			else
			begin
				No6_state<=3'd0;
			end

			if(count!=2'd0 && keypadBuf==5'b00110)//here
			begin
				if(mouse_bomb_memory)//bomb
				begin
					status<=2'b10;
					button_clicked<=1'b1;
				end
				else//mouse
				begin
					status<=2'b01;
					button_clicked<=1'b1;
				end
			end
			else
			begin
				status<=2'd0;
			end
		end
		else
		begin
			button_clicked<=1'b0;
			status<=2'd0;
			No6_state<=3'd0;
		end
	end

endmodule
/////////////////////////////

module No7_box(
	input clk,
	input clk_1Hz,
	input reset,
	input threesec,
	input mouse_bomb,
	input [3:0] which_box,
	input [4:0] keypadBuf,
	output reg [1:0] status,
	output reg [2:0] No7_state
);

	reg	which_box_changed;
	reg mouse_bomb_memory;
	reg button_clicked;
	reg [1:0] count;

	always@(posedge clk)
	begin
		if(!reset)
		begin
			which_box_changed<=1'b0;
			mouse_bomb_memory<=1'b0;
		end
		else if(threesec)
		begin
			if(which_box==4'h7)//here
			begin
				if(!which_box_changed)
				begin
					case(mouse_bomb)
					1'b0:mouse_bomb_memory<=1'b0;
					1'b1:mouse_bomb_memory<=1'b1;
					endcase
					which_box_changed<=1'b1;
				end
				else
				begin
					//do nothing
				end
			end
			else
			begin
				which_box_changed<=1'b0;
			end
		end
		else
		begin
			which_box_changed<=1'b0;
			mouse_bomb_memory<=1'b0;
		end
	end

	always@(posedge clk_1Hz)
	begin
		if(!reset)
		begin
			count<=2'd0;
		end
		else if(threesec)
		begin
			if(which_box_changed || count!=2'd0)
			begin
				if(count == 2'd3)
				begin
					count<= 2'd0;
				end
				else
				begin
					count<=count+2'd1;
				end
			end
			else
			begin
				count<=2'd0;
			end
		end
		else
		begin
			count<=2'd0;
		end
	end

	always@(posedge clk)
	begin
		if(!reset)
		begin
			button_clicked<=1'b0;
			status<=2'd0;
			No7_state<=3'd0;
		end
		else if(threesec)
		begin
			if(count!=2'd0)
			begin
				if(button_clicked)
				begin
					if(mouse_bomb_memory)//bomb 100
					begin
						No7_state<=3'd4; //hitted bomb
					end
					else//mouse 011
					begin
						No7_state<=3'd3; //hitted mouse
					end
				end
				else
				begin
					if(mouse_bomb_memory)//bomb 010
					begin
						No7_state<=3'd2; //usual bomb
					end
					else//mouse 001
					begin
						No7_state<=3'd1; //usual mouse
					end
				end
				if(count == 2'd3)
				begin
					if(mouse_bomb_memory)
					begin
						No7_state<= 3'd4; //if not be pressed -> bomb delete
					end
					else
					begin
						No7_state<= 3'd3; //if not be pressed -> mouse deleted
					end
				end
			end
			else
			begin
				No7_state<=3'd0;
			end

			if(count!=2'd0 && keypadBuf==5'b00111)//here
			begin
				if(mouse_bomb_memory)//bomb
				begin
					status<=2'b10;
					button_clicked<=1'b1;
				end
				else//mouse
				begin
					status<=2'b01;
					button_clicked<=1'b1;
				end
			end
			else
			begin
				status<=2'd0;
			end
		end
		else
		begin
			button_clicked<=1'b0;
			status<=2'd0;
			No7_state<=3'd0;
		end
	end

endmodule
///////////////////////////////

module No8_box(
	input clk,
	input clk_1Hz,
	input reset,
	input threesec,
	input mouse_bomb,
	input [3:0] which_box,
	input [4:0] keypadBuf,
	output reg [1:0] status,
	output reg [2:0] No8_state
);

	reg	which_box_changed;
	reg mouse_bomb_memory;
	reg button_clicked;
	reg [1:0] count;

	always@(posedge clk)
	begin
		if(!reset)
		begin
			which_box_changed<=1'b0;
			mouse_bomb_memory<=1'b0;
		end
		else if(threesec)
		begin
			if(which_box==4'h8)//here
			begin
				if(!which_box_changed)
				begin
					case(mouse_bomb)
					1'b0:mouse_bomb_memory<=1'b0;
					1'b1:mouse_bomb_memory<=1'b1;
					endcase
					which_box_changed<=1'b1;
				end
				else
				begin
					//do nothing
				end
			end
			else
			begin
				which_box_changed<=1'b0;
			end
		end
		else
		begin
			which_box_changed<=1'b0;
			mouse_bomb_memory<=1'b0;
		end
	end

	always@(posedge clk_1Hz)
	begin
		if(!reset)
		begin
			count<=2'd0;
		end
		else if(threesec)
		begin
			if(which_box_changed || count!=2'd0)
			begin
				if(count == 2'd3)
				begin
					count<= 2'd0;
				end
				else
				begin
					count<=count+2'd1;
				end
			end
			else
			begin
				count<=2'd0;
			end
		end
		else
		begin
			count<=2'd0;
		end
	end

	always@(posedge clk)
	begin
		if(!reset)
		begin
			button_clicked<=1'b0;
			status<=2'd0;
			No8_state<=3'd0;
		end
		else if(threesec)
		begin
			if(count!=2'd0)
			begin
				if(button_clicked)
				begin
					if(mouse_bomb_memory)//bomb 100
					begin
						No8_state<=3'd4; //hitted bomb
					end
					else//mouse 011
					begin
						No8_state<=3'd3; //hitted mouse
					end
				end
				else
				begin
					if(mouse_bomb_memory)//bomb 010
					begin
						No8_state<=3'd2; //usual bomb
					end
					else//mouse 001
					begin
						No8_state<=3'd1; //usual mouse
					end
				end
				if(count == 2'd3)
				begin
					if(mouse_bomb_memory)
					begin
						No8_state<= 3'd4; //if not be pressed -> bomb delete
					end
					else
					begin
						No8_state<= 3'd3; //if not be pressed -> mouse deleted
					end
				end
			end
			else
			begin
				No8_state<=3'd0;
			end

			if(count!=2'd0 && keypadBuf==5'b01000)//here
			begin
				if(mouse_bomb_memory)//bomb
				begin
					status<=2'b10;
					button_clicked<=1'b1;
				end
				else//mouse
				begin
					status<=2'b01;
					button_clicked<=1'b1;
				end
			end
			else
			begin
				status<=2'd0;
			end
		end
		else
		begin
			button_clicked<=1'b0;
			status<=2'd0;
			No8_state<=3'd0;
		end
	end

endmodule
//////////////////////////////////

module No9_box(
	input clk,
	input clk_1Hz,
	input reset,
	input threesec,
	input mouse_bomb,
	input [3:0] which_box,
	input [4:0] keypadBuf,
	output reg [1:0] status,
	output reg [2:0] No9_state
);

	reg	which_box_changed;
	reg mouse_bomb_memory;
	reg button_clicked;
	reg [1:0] count;

	always@(posedge clk)
	begin
		if(!reset)
		begin
			which_box_changed<=1'b0;
			mouse_bomb_memory<=1'b0;
		end
		else if(threesec)
		begin
			if(which_box==4'h9)//here
			begin
				if(!which_box_changed)
				begin
					case(mouse_bomb)
					1'b0:mouse_bomb_memory<=1'b0;
					1'b1:mouse_bomb_memory<=1'b1;
					endcase
					which_box_changed<=1'b1;
				end
				else
				begin
					//do nothing
				end
			end
			else
			begin
				which_box_changed<=1'b0;
			end
		end
		else
		begin
			which_box_changed<=1'b0;
			mouse_bomb_memory<=1'b0;
		end
	end

	always@(posedge clk_1Hz)
	begin
		if(!reset)
		begin
			count<=2'd0;
		end
		else if(threesec)
		begin
			if(which_box_changed || count!=2'd0)
			begin
				if(count == 2'd3)
				begin
					count<= 2'd0;
				end
				else
				begin
					count<=count+2'd1;
				end
			end
			else
			begin
				count<=2'd0;
			end
		end
		else
		begin
			count<=2'd0;
		end
	end

	always@(posedge clk)
	begin
		if(!reset)
		begin
			button_clicked<=1'b0;
			status<=2'd0;
			No9_state<=3'd0;
		end
		else if(threesec)
		begin
			if(count!=2'd0)
			begin
				if(button_clicked)
				begin
					if(mouse_bomb_memory)//bomb 100
					begin
						No9_state<=3'd4; //hitted bomb
					end
					else//mouse 011
					begin
						No9_state<=3'd3; //hitted mouse
					end
				end
				else
				begin
					if(mouse_bomb_memory)//bomb 010
					begin
						No9_state<=3'd2; //usual bomb
					end
					else//mouse 001
					begin
						No9_state<=3'd1; //usual mouse
					end
				end
				if(count == 2'd3)
				begin
					if(mouse_bomb_memory)
					begin
						No9_state<= 3'd4; //if not be pressed -> bomb delete
					end
					else
					begin
						No9_state<= 3'd3; //if not be pressed -> mouse deleted
					end
				end
			end
			else
			begin
				No9_state<=3'd0;
			end

			if(count!=2'd0 && keypadBuf==5'b01001)//here
			begin
				if(mouse_bomb_memory)//bomb
				begin
					status<=2'b10;
					button_clicked<=1'b1;
				end
				else//mouse
				begin
					status<=2'b01;
					button_clicked<=1'b1;
				end
			end
			else
			begin
				status<=2'd0;
			end
		end
		else
		begin
			button_clicked<=1'b0;
			status<=2'd0;
			No9_state<=3'd0;
		end
	end

endmodule
///////////////////////////////////

module No10_box(
	input clk,
	input clk_1Hz,
	input reset,
	input threesec,
	input mouse_bomb,
	input [3:0] which_box,
	input [4:0] keypadBuf,
	output reg [1:0] status,
	output reg [2:0] No10_state
);

	reg	which_box_changed;
	reg mouse_bomb_memory;
	reg button_clicked;
	reg [1:0] count;

	always@(posedge clk)
	begin
		if(!reset)
		begin
			which_box_changed<=1'b0;
			mouse_bomb_memory<=1'b0;
		end
		else if(threesec)
		begin
			if(which_box==4'ha)//here
			begin
				if(!which_box_changed)
				begin
					case(mouse_bomb)
					1'b0:mouse_bomb_memory<=1'b0;
					1'b1:mouse_bomb_memory<=1'b1;
					endcase
					which_box_changed<=1'b1;
				end
				else
				begin
					//do nothing
				end
			end
			else
			begin
				which_box_changed<=1'b0;
			end
		end
		else
		begin
			which_box_changed<=1'b0;
			mouse_bomb_memory<=1'b0;
		end
	end

	always@(posedge clk_1Hz)
	begin
		if(!reset)
		begin
			count<=2'd0;
		end
		else if(threesec)
		begin
			if(which_box_changed || count!=2'd0)
			begin
				if(count == 2'd3)
				begin
					count<= 2'd0;
				end
				else
				begin
					count<=count+2'd1;
				end
			end
			else
			begin
				count<=2'd0;
			end
		end
		else
		begin
			count<=2'd0;
		end
	end

	always@(posedge clk)
	begin
		if(!reset)
		begin
			button_clicked<=1'b0;
			status<=2'd0;
			No10_state<=3'd0;
		end
		else if(threesec)
		begin
			if(count!=2'd0)
			begin
				if(button_clicked)
				begin
					if(mouse_bomb_memory)//bomb 100
					begin
						No10_state<=3'd4; //hitted bomb
					end
					else//mouse 011
					begin
						No10_state<=3'd3; //hitted mouse
					end
				end
				else
				begin
					if(mouse_bomb_memory)//bomb 010
					begin
						No10_state<=3'd2; //usual bomb
					end
					else//mouse 001
					begin
						No10_state<=3'd1; //usual mouse
					end
				end
				if(count == 2'd3)
				begin
					if(mouse_bomb_memory)
					begin
						No10_state<= 3'd4; //if not be pressed -> bomb delete
					end
					else
					begin
						No10_state<= 3'd3; //if not be pressed -> mouse deleted
					end
				end
			end
			else
			begin
				No10_state<=3'd0;
			end

			if(count!=2'd0 && keypadBuf==5'b01010)//here
			begin
				if(mouse_bomb_memory)//bomb
				begin
					status<=2'b10;
					button_clicked<=1'b1;
				end
				else//mouse
				begin
					status<=2'b01;
					button_clicked<=1'b1;
				end
			end
			else
			begin
				status<=2'd0;
			end
		end
		else
		begin
			button_clicked<=1'b0;
			status<=2'd0;
			No10_state<=3'd0;
		end
	end

endmodule
//////////////////////

module No11_box(
	input clk,
	input clk_1Hz,
	input reset,
	input threesec,
	input mouse_bomb,
	input [3:0] which_box,
	input [4:0] keypadBuf,
	output reg [1:0] status,
	output reg [2:0] No11_state
);

	reg	which_box_changed;
	reg mouse_bomb_memory;
	reg button_clicked;
	reg [1:0] count;

	always@(posedge clk)
	begin
		if(!reset)
		begin
			which_box_changed<=1'b0;
			mouse_bomb_memory<=1'b0;
		end
		else if(threesec)
		begin
			if(which_box==4'hb)//here
			begin
				if(!which_box_changed)
				begin
					case(mouse_bomb)
					1'b0:mouse_bomb_memory<=1'b0;
					1'b1:mouse_bomb_memory<=1'b1;
					endcase
					which_box_changed<=1'b1;
				end
				else
				begin
					//do nothing
				end
			end
			else
			begin
				which_box_changed<=1'b0;
			end
		end
		else
		begin
			which_box_changed<=1'b0;
			mouse_bomb_memory<=1'b0;
		end
	end

	always@(posedge clk_1Hz)
	begin
		if(!reset)
		begin
			count<=2'd0;
		end
		else if(threesec)
		begin
			if(which_box_changed || count!=2'd0)
			begin
				if(count == 2'd3)
				begin
					count<= 2'd0;
				end
				else
				begin
					count<=count+2'd1;
				end
			end
			else
			begin
				count<=2'd0;
			end
		end
		else
		begin
			count<=2'd0;
		end
	end

	always@(posedge clk)
	begin
		if(!reset)
		begin
			button_clicked<=1'b0;
			status<=2'd0;
			No11_state<=3'd0;
		end
		else if(threesec)
		begin
			if(count!=2'd0)
			begin
				if(button_clicked)
				begin
					if(mouse_bomb_memory)//bomb 100
					begin
						No11_state<=3'd4; //hitted bomb
					end
					else//mouse 011
					begin
						No11_state<=3'd3; //hitted mouse
					end
				end
				else
				begin
					if(mouse_bomb_memory)//bomb 010
					begin
						No11_state<=3'd2; //usual bomb
					end
					else//mouse 001
					begin
						No11_state<=3'd1; //usual mouse
					end
				end
				if(count == 2'd3)
				begin
					if(mouse_bomb_memory)
					begin
						No11_state<= 3'd4; //if not be pressed -> bomb delete
					end
					else
					begin
						No11_state<= 3'd3; //if not be pressed -> mouse deleted
					end
				end
			end
			else
			begin
				No11_state<=3'd0;
			end

			if(count!=2'd0 && keypadBuf==5'b01011)//here
			begin
				if(mouse_bomb_memory)//bomb
				begin
					status<=2'b10;
					button_clicked<=1'b1;
				end
				else//mouse
				begin
					status<=2'b01;
					button_clicked<=1'b1;
				end
			end
			else
			begin
				status<=2'd0;
			end
		end
		else
		begin
			button_clicked<=1'b0;
			status<=2'd0;
			No11_state<=3'd0;
		end
	end

endmodule
//////////////////////

module No12_box(
	input clk,
	input clk_1Hz,
	input reset,
	input threesec,
	input mouse_bomb,
	input [3:0] which_box,
	input [4:0] keypadBuf,
	output reg [1:0] status,
	output reg [2:0] No12_state
);

	reg	which_box_changed;
	reg mouse_bomb_memory;
	reg button_clicked;
	reg [1:0] count;

	always@(posedge clk)
	begin
		if(!reset)
		begin
			which_box_changed<=1'b0;
			mouse_bomb_memory<=1'b0;
		end
		else if(threesec)
		begin
			if(which_box==4'hc)//here
			begin
				if(!which_box_changed)
				begin
					case(mouse_bomb)
					1'b0:mouse_bomb_memory<=1'b0;
					1'b1:mouse_bomb_memory<=1'b1;
					endcase
					which_box_changed<=1'b1;
				end
				else
				begin
					//do nothing
				end
			end
			else
			begin
				which_box_changed<=1'b0;
			end
		end
		else
		begin
			which_box_changed<=1'b0;
			mouse_bomb_memory<=1'b0;
		end
	end

	always@(posedge clk_1Hz)
	begin
		if(!reset)
		begin
			count<=2'd0;
		end
		else if(threesec)
		begin
			if(which_box_changed || count!=2'd0)
			begin
				if(count == 2'd3)
				begin
					count<= 2'd0;
				end
				else
				begin
					count<=count+2'd1;
				end
			end
			else
			begin
				count<=2'd0;
			end
		end
		else
		begin
			count<=2'd0;
		end
	end

	always@(posedge clk)
	begin
		if(!reset)
		begin
			button_clicked<=1'b0;
			status<=2'd0;
			No12_state<=3'd0;
		end
		else if(threesec)
		begin
			if(count!=2'd0)
			begin
				if(button_clicked)
				begin
					if(mouse_bomb_memory)//bomb 100
					begin
						No12_state<=3'd4; //hitted bomb
					end
					else//mouse 011
					begin
						No12_state<=3'd3; //hitted mouse
					end
				end
				else
				begin
					if(mouse_bomb_memory)//bomb 010
					begin
						No12_state<=3'd2; //usual bomb
					end
					else//mouse 001
					begin
						No12_state<=3'd1; //usual mouse
					end
				end
				if(count == 2'd3)
				begin
					if(mouse_bomb_memory)
					begin
						No12_state<= 3'd4; //if not be pressed -> bomb delete
					end
					else
					begin
						No12_state<= 3'd3; //if not be pressed -> mouse deleted
					end
				end
			end
			else
			begin
				No12_state<=3'd0;
			end

			if(count!=2'd0 && keypadBuf==5'b01100)//here
			begin
				if(mouse_bomb_memory)//bomb
				begin
					status<=2'b10;
					button_clicked<=1'b1;
				end
				else//mouse
				begin
					status<=2'b01;
					button_clicked<=1'b1;
				end
			end
			else
			begin
				status<=2'd0;
			end
		end
		else
		begin
			button_clicked<=1'b0;
			status<=2'd0;
			No12_state<=3'd0;
		end
	end

endmodule
//////////////////////

module No13_box(
	input clk,
	input clk_1Hz,
	input reset,
	input threesec,
	input mouse_bomb,
	input [3:0] which_box,
	input [4:0] keypadBuf,
	output reg [1:0] status,
	output reg [2:0] No13_state
);

	reg	which_box_changed;
	reg mouse_bomb_memory;
	reg button_clicked;
	reg [1:0] count;

	always@(posedge clk)
	begin
		if(!reset)
		begin
			which_box_changed<=1'b0;
			mouse_bomb_memory<=1'b0;
		end
		else if(threesec)
		begin
			if(which_box==4'hd)//here
			begin
				if(!which_box_changed)
				begin
					case(mouse_bomb)
					1'b0:mouse_bomb_memory<=1'b0;
					1'b1:mouse_bomb_memory<=1'b1;
					endcase
					which_box_changed<=1'b1;
				end
				else
				begin
					//do nothing
				end
			end
			else
			begin
				which_box_changed<=1'b0;
			end
		end
		else
		begin
			which_box_changed<=1'b0;
			mouse_bomb_memory<=1'b0;
		end
	end

	always@(posedge clk_1Hz)
	begin
		if(!reset)
		begin
			count<=2'd0;
		end
		else if(threesec)
		begin
			if(which_box_changed || count!=2'd0)
			begin
				if(count == 2'd3)
				begin
					count<= 2'd0;
				end
				else
				begin
					count<=count+2'd1;
				end
			end
			else
			begin
				count<=2'd0;
			end
		end
		else
		begin
			count<=2'd0;
		end
	end

	always@(posedge clk)
	begin
		if(!reset)
		begin
			button_clicked<=1'b0;
			status<=2'd0;
			No13_state<=3'd0;
		end
		else if(threesec)
		begin
			if(count!=2'd0)
			begin
				if(button_clicked)
				begin
					if(mouse_bomb_memory)//bomb 100
					begin
						No13_state<=3'd4; //hitted bomb
					end
					else//mouse 011
					begin
						No13_state<=3'd3; //hitted mouse
					end
				end
				else
				begin
					if(mouse_bomb_memory)//bomb 010
					begin
						No13_state<=3'd2; //usual bomb
					end
					else//mouse 001
					begin
						No13_state<=3'd1; //usual mouse
					end
				end
				if(count == 2'd3)
				begin
					if(mouse_bomb_memory)
					begin
						No13_state<= 3'd4; //if not be pressed -> bomb delete
					end
					else
					begin
						No13_state<= 3'd3; //if not be pressed -> mouse deleted
					end
				end
			end
			else
			begin
				No13_state<=3'd0;
			end

			if(count!=2'd0 && keypadBuf==5'b01101)//here
			begin
				if(mouse_bomb_memory)//bomb
				begin
					status<=2'b10;
					button_clicked<=1'b1;
				end
				else//mouse
				begin
					status<=2'b01;
					button_clicked<=1'b1;
				end
			end
			else
			begin
				status<=2'd0;
			end
		end
		else
		begin
			button_clicked<=1'b0;
			status<=2'd0;
			No13_state<=3'd0;
		end
	end

endmodule
//////////////////////
module No14_box(
	input clk,
	input clk_1Hz,
	input reset,
	input threesec,
	input mouse_bomb,
	input [3:0] which_box,
	input [4:0] keypadBuf,
	output reg [1:0] status,
	output reg [2:0] No14_state
);

	reg	which_box_changed;
	reg mouse_bomb_memory;
	reg button_clicked;
	reg [1:0] count;

	always@(posedge clk)
	begin
		if(!reset)
		begin
			which_box_changed<=1'b0;
			mouse_bomb_memory<=1'b0;
		end
		else if(threesec)
		begin
			if(which_box==4'he)//here
			begin
				if(!which_box_changed)
				begin
					case(mouse_bomb)
					1'b0:mouse_bomb_memory<=1'b0;
					1'b1:mouse_bomb_memory<=1'b1;
					endcase
					which_box_changed<=1'b1;
				end
				else
				begin
					//do nothing
				end
			end
			else
			begin
				which_box_changed<=1'b0;
			end
		end
		else
		begin
			which_box_changed<=1'b0;
			mouse_bomb_memory<=1'b0;
		end
	end

	always@(posedge clk_1Hz)
	begin
		if(!reset)
		begin
			count<=2'd0;
		end
		else if(threesec)
		begin
			if(which_box_changed || count!=2'd0)
			begin
				if(count == 2'd3)
				begin
					count<= 2'd0;
				end
				else
				begin
					count<=count+2'd1;
				end
			end
			else
			begin
				count<=2'd0;
			end
		end
		else
		begin
			count<=2'd0;
		end
	end

	always@(posedge clk)
	begin
		if(!reset)
		begin
			button_clicked<=1'b0;
			status<=2'd0;
			No14_state<=3'd0;
		end
		else if(threesec)
		begin
			if(count!=2'd0)
			begin
				if(button_clicked)
				begin
					if(mouse_bomb_memory)//bomb 100
					begin
						No14_state<=3'd4; //hitted bomb
					end
					else//mouse 011
					begin
						No14_state<=3'd3; //hitted mouse
					end
				end
				else
				begin
					if(mouse_bomb_memory)//bomb 010
					begin
						No14_state<=3'd2; //usual bomb
					end
					else//mouse 001
					begin
						No14_state<=3'd1; //usual mouse
					end
				end
				if(count == 2'd3)
				begin
					if(mouse_bomb_memory)
					begin
						No14_state<= 3'd4; //if not be pressed -> bomb delete
					end
					else
					begin
						No14_state<= 3'd3; //if not be pressed -> mouse deleted
					end
				end
			end
			else
			begin
				No14_state<=3'd0;
			end

			if(count!=2'd0 && keypadBuf==5'b01110)//here
			begin
				if(mouse_bomb_memory)//bomb
				begin
					status<=2'b10;
					button_clicked<=1'b1;
				end
				else//mouse
				begin
					status<=2'b01;
					button_clicked<=1'b1;
				end
			end
			else
			begin
				status<=2'd0;
			end
		end
		else
		begin
			button_clicked<=1'b0;
			status<=2'd0;
			No14_state<=3'd0;
		end
	end

endmodule
//////////////////////
module No15_box(
	input clk,
	input clk_1Hz,
	input reset,
	input threesec,
	input mouse_bomb,
	input [3:0] which_box,
	input [4:0] keypadBuf,
	output reg [1:0] status,
	output reg [2:0] No15_state
);

	reg	which_box_changed;
	reg mouse_bomb_memory;
	reg button_clicked;
	reg [1:0] count;

	always@(posedge clk)
	begin
		if(!reset)
		begin
			which_box_changed<=1'b0;
			mouse_bomb_memory<=1'b0;
		end
		else if(threesec)
		begin
			if(which_box==4'hf)//here
			begin
				if(!which_box_changed)
				begin
					case(mouse_bomb)
					1'b0:mouse_bomb_memory<=1'b0;
					1'b1:mouse_bomb_memory<=1'b1;
					endcase
					which_box_changed<=1'b1;
				end
				else
				begin
					//do nothing
				end
			end
			else
			begin
				which_box_changed<=1'b0;
			end
		end
		else
		begin
			which_box_changed<=1'b0;
			mouse_bomb_memory<=1'b0;
		end
	end

	always@(posedge clk_1Hz)
	begin
		if(!reset)
		begin
			count<=2'd0;
		end
		else if(threesec)
		begin
			if(which_box_changed || count!=2'd0)
			begin
				if(count == 2'd3)
				begin
					count<= 2'd0;
				end
				else
				begin
					count<=count+2'd1;
				end
			end
			else
			begin
				count<=2'd0;
			end
		end
		else
		begin
			count<=2'd0;
		end
	end

	always@(posedge clk)
	begin
		if(!reset)
		begin
			button_clicked<=1'b0;
			status<=2'd0;
			No15_state<=3'd0;
		end
		else if(threesec)
		begin
			if(count!=2'd0)
			begin
				if(button_clicked)
				begin
					if(mouse_bomb_memory)//bomb 100
					begin
						No15_state<=3'd4; //hitted bomb
					end
					else//mouse 011
					begin
						No15_state<=3'd3; //hitted mouse
					end
				end
				else
				begin
					if(mouse_bomb_memory)//bomb 010
					begin
						No15_state<=3'd2; //usual bomb
					end
					else//mouse 001
					begin
						No15_state<=3'd1; //usual mouse
					end
				end
				if(count == 2'd3)
				begin
					if(mouse_bomb_memory)
					begin
						No15_state<= 3'd4; //if not be pressed -> bomb delete
					end
					else
					begin
						No15_state<= 3'd3; //if not be pressed -> mouse deleted
					end
				end
			end
			else
			begin
				No15_state<=3'd0;
			end

			if(count!=2'd0 && keypadBuf==5'b01111)//here
			begin
				if(mouse_bomb_memory)//bomb
				begin
					status<=2'b10;
					button_clicked<=1'b1;
				end
				else//mouse
				begin
					status<=2'b01;
					button_clicked<=1'b1;
				end
			end
			else
			begin
				status<=2'd0;
			end
		end
		else
		begin
			button_clicked<=1'b0;
			status<=2'd0;
			No15_state<=3'd0;
		end
	end

endmodule
//////////////////////

module Matrix_Display(
	input clk_10000Hz,
	input clk_div,
	input threesec,
	input reset,
	input [2:0] No0_state,
   input [2:0] No1_state,
   input [2:0] No2_state,
   input [2:0] No3_state,
   input [2:0] No4_state,
   input [2:0] No5_state,
   input [2:0] No6_state,
	input [2:0] No7_state,
   input [2:0] No8_state,
   input [2:0] No9_state,
   input [2:0] No10_state,
   input [2:0] No11_state,
   input [2:0] No12_state,
   input [2:0] No13_state,
   input [2:0] No14_state,
   input [2:0] No15_state,
	output reg [7:0] dot_row,
	output reg [7:0] dot_column
);

	reg changed_0;
	reg changed_1;
	reg changed_2;
	reg changed_3;
	reg changed_4;
	reg changed_5;
	reg changed_6;
	reg changed_7;
	reg changed_8;
	reg changed_9;
	reg changed_10;
	reg changed_11;
	reg changed_12;
	reg changed_13;
	reg changed_14;
	reg changed_15;
	reg [2:0] No0_state_memo;
   reg [2:0] No1_state_memo;
   reg [2:0] No2_state_memo;
   reg [2:0] No3_state_memo;
   reg [2:0] No4_state_memo;
   reg [2:0] No5_state_memo;
   reg [2:0] No6_state_memo;
   reg [2:0] No7_state_memo;
   reg [2:0] No8_state_memo;
   reg [2:0] No9_state_memo;
   reg [2:0] No10_state_memo;
   reg [2:0] No11_state_memo;
   reg [2:0] No12_state_memo;
   reg [2:0] No13_state_memo;
   reg [2:0] No14_state_memo;
   reg [2:0] No15_state_memo;
	reg [2:0] count;
	reg [1:0] countdown; //me
	reg [7:0] dot_column_0memo;
	reg [7:0] dot_column_1memo;
	reg [7:0] dot_column_2memo;
	reg [7:0] dot_column_3memo;
	reg [7:0] dot_column_4memo;
	reg [7:0] dot_column_5memo;
	reg [7:0] dot_column_6memo;
	reg [7:0] dot_column_7memo;
	
    //count down 3 seconds controller
	always@(posedge clk_div or negedge reset)
	begin
		//count down 3 seconds
		if(!reset) 
		begin
			countdown <= 2'b11;
		end
		else if(count > 0) 
		begin
			countdown <= countdown - 1;
		end
	end
	
	always @(posedge clk_10000Hz or negedge reset)
	begin
		if(!reset)
		begin
			changed_0<=1'b0;
			changed_1<=1'b0;
			changed_2<=1'b0;
			changed_3<=1'b0;
			changed_4<=1'b0;
			changed_5<=1'b0;
			changed_6<=1'b0;
			changed_7<=1'b0;
			changed_8<=1'b0;
			changed_9<=1'b0;
			changed_10<=1'b0;
			changed_11<=1'b0;
			changed_12<=1'b0;
			changed_13<=1'b0;
			changed_14<=1'b0;
			changed_15<=1'b0;

			No0_state_memo <= 3'd0;
			dot_column_0memo<=8'b00000000;
			dot_column_1memo<=8'b00000000;
			dot_column_2memo<=8'b00000000;
			dot_column_3memo<=8'b00000000;
			dot_column_4memo<=8'b00000000;
			dot_column_5memo<=8'b00000000;
			dot_column_6memo<=8'b00000000;
			dot_column_7memo<=8'b00000000;

			case(count)
				3'd0:dot_row<=8'b01111111;
				3'd1:dot_row<=8'b10111111;
				3'd2:dot_row<=8'b11011111;
				3'd3:dot_row<=8'b11101111;
				3'd4:dot_row<=8'b11110111;
				3'd5:dot_row<=8'b11111011;
				3'd6:dot_row<=8'b11111101;
				3'd7:dot_row<=8'b11111110;
			endcase
			case(count)
				3'd0:dot_column<=8'b00000000;
				3'd1:dot_column<=8'b00000000;
				3'd2:dot_column<=8'b00000000;
				3'd3:dot_column<=8'b00000000;
				3'd4:dot_column<=8'b00000000;
				3'd5:dot_column<=8'b00000000;
				3'd6:dot_column<=8'b00000000;
				3'd7:dot_column<=8'b00000000;
			endcase
			count<=count+3'b001;
		end
		else
		begin
			case(count)
				3'd0:dot_row<=8'b01111111;
				3'd1:dot_row<=8'b10111111;
				3'd2:dot_row<=8'b11011111;
				3'd3:dot_row<=8'b11101111;
				3'd4:dot_row<=8'b11110111;
				3'd5:dot_row<=8'b11111011;
				3'd6:dot_row<=8'b11111101;
				3'd7:dot_row<=8'b11111110;
			endcase
			case(count)
				3'd0:dot_column<=dot_column_0memo;
				3'd1:dot_column<=dot_column_1memo;
				3'd2:dot_column<=dot_column_2memo;
				3'd3:dot_column<=dot_column_3memo;
				3'd4:dot_column<=dot_column_4memo;
				3'd5:dot_column<=dot_column_5memo;
				3'd6:dot_column<=dot_column_6memo;
				3'd7:dot_column<=dot_column_7memo;
			endcase

			if(threesec)//here
			begin
				if(No0_state!=3'd0)
				begin
					if(!changed_0)
					begin
						if(No0_state==3'd1)
						begin
							dot_column_6memo = dot_column_6memo + 8'b11000000;
							dot_column_7memo = dot_column_7memo + 8'b11000000;
							No0_state_memo <= No0_state;
							changed_0<=1'b1;
						end
						else if(No0_state==3'd2)
						begin
							dot_column_6memo = dot_column_6memo + 8'b10000000;
							dot_column_7memo = dot_column_7memo + 8'b01000000;
							No0_state_memo <= No0_state;
							changed_0<=1'b1;
						end
						else if(No0_state==3'd3)
						begin
							if(dot_column_6memo[7:6] == 2'b11)
							begin
								dot_column_6memo = dot_column_6memo + 8'b01000000;
								dot_column_7memo = dot_column_7memo + 8'b01000000;
							end
							No0_state_memo <= No0_state;
							changed_0<=1'b1;
						end
						else if(No0_state==3'd4)
						begin
							if(dot_column_6memo[7:6] == 2'b10)
							begin
								dot_column_6memo = dot_column_6memo + 8'b10000000;
								dot_column_7memo = dot_column_7memo + 8'b11000000;
							end
							No0_state_memo <= No0_state;
							changed_0<=1'b1;
						end
					end
					else
					begin
						if(No0_state != No0_state_memo) changed_0<= 1'b0;
					end
				end
            
				if(No1_state!=3'd0)
				begin
					if(!changed_1)
					begin
						if(No1_state==3'd1)
						begin
							dot_column_6memo = dot_column_6memo + 8'b00110000;
							dot_column_7memo = dot_column_7memo + 8'b00110000;
							No1_state_memo <= No1_state;
							changed_1<=1'b1;
						end
						else if(No1_state==3'd2)
						begin
							dot_column_6memo = dot_column_6memo + 8'b00100000;
							dot_column_7memo = dot_column_7memo + 8'b00010000;
							No1_state_memo <= No1_state;
							changed_1<=1'b1;
						end
						else if(No1_state==3'd3)
						begin
							if(dot_column_6memo[5:4] == 2'b11)
							begin
								dot_column_6memo = dot_column_6memo + 8'b11010000;
								dot_column_7memo = dot_column_7memo + 8'b11010000;
							end
							No1_state_memo <= No1_state;
							changed_1<=1'b1;
						end
						else if(No1_state==3'd4)
						begin
							if(dot_column_6memo[5:4] == 2'b10)
							begin
								dot_column_6memo = dot_column_6memo + 8'b11100000;
								dot_column_7memo = dot_column_7memo + 8'b11110000;
							end
							No1_state_memo <= No1_state;
							changed_1<=1'b1;
						end
					end
					else
					begin
						if(No1_state != No1_state_memo) changed_1<= 1'b0;
					end
				end
            
				if(No2_state!=3'd0)
				begin
					if(!changed_2)
					begin
						if(No2_state==3'd1)
						begin
							dot_column_4memo = dot_column_4memo + 8'b00110000;
							dot_column_5memo = dot_column_5memo + 8'b00110000;
							No2_state_memo <= No2_state;
							changed_2<=1'b1;
						end
						else if(No2_state==3'd2)
						begin
							dot_column_4memo = dot_column_4memo + 8'b00100000;
							dot_column_5memo = dot_column_5memo + 8'b00010000;
							No2_state_memo <= No2_state;
							changed_2<=1'b1;
						end
						else if(No2_state==3'd3)
						begin
							if(dot_column_4memo[5:4] == 2'b11)
							begin
								dot_column_4memo = dot_column_4memo + 8'b11010000;
								dot_column_5memo = dot_column_5memo + 8'b11010000;
							end
							No2_state_memo <= No2_state;
							changed_2<=1'b1;
						end
						else if(No2_state==3'd4)
						begin
							if(dot_column_4memo[5:4] == 2'b10)
							begin
								dot_column_4memo = dot_column_4memo + 8'b11100000;
								dot_column_5memo = dot_column_5memo + 8'b11110000;
							end
							No2_state_memo <= No2_state;
							changed_2<=1'b1;
						end
					end
					else
					begin
						if(No2_state != No2_state_memo) changed_2<= 1'b0;
					end
				end
				
				if(No3_state!=3'd0)
				begin
					if(!changed_3)
					begin
						if(No3_state==3'd1)
						begin
							dot_column_2memo = dot_column_2memo + 8'b00110000;
							dot_column_3memo = dot_column_3memo + 8'b00110000;
							No3_state_memo <= No3_state;
							changed_3<=1'b1;
						end
						else if(No3_state==3'd2)
						begin
							dot_column_2memo = dot_column_2memo + 8'b00100000;
							dot_column_3memo = dot_column_3memo + 8'b00010000;
							No3_state_memo <= No3_state;
							changed_3<=1'b1;
						end
						else if(No3_state==3'd3)
						begin
							if(dot_column_2memo[5:4] == 2'b11)
							begin
								dot_column_2memo = dot_column_2memo + 8'b11010000;
								dot_column_3memo = dot_column_3memo + 8'b11010000;
							end
							No3_state_memo <= No3_state;
							changed_3<=1'b1;
						end
						else if(No3_state==3'd4)
						begin
							if(dot_column_2memo[5:4] == 2'b10)
							begin
								dot_column_2memo = dot_column_2memo + 8'b11100000;
								dot_column_3memo = dot_column_3memo + 8'b11110000;
							end
							No3_state_memo <= No3_state;
							changed_3<=1'b1;
						end
					end
					else
					begin
						if(No3_state != No3_state_memo) changed_3<= 1'b0;
					end
				end
				
				if(No4_state!=3'd0)
				begin
					if(!changed_4)
					begin
						if(No4_state==3'd1)
						begin
							dot_column_6memo = dot_column_6memo + 8'b00001100;
							dot_column_7memo = dot_column_7memo + 8'b00001100;
							No4_state_memo <= No4_state;
							changed_4<=1'b1;
						end
						else if(No4_state==3'd2)
						begin
							dot_column_6memo = dot_column_6memo + 8'b00001000;
							dot_column_7memo = dot_column_7memo + 8'b00000100;
							No4_state_memo <= No4_state;
							changed_4<=1'b1;
						end
						else if(No4_state==3'd3)
						begin
							if(dot_column_6memo[3:2] == 2'b11)
							begin
								dot_column_6memo = dot_column_6memo + 8'b11110100;
								dot_column_7memo = dot_column_7memo + 8'b11110100;
							end
							No4_state_memo <= No4_state;
							changed_4<=1'b1;
						end
						else if(No4_state==3'd4)
						begin
							if(dot_column_6memo[3:2] == 2'b10)
							begin
								dot_column_6memo = dot_column_6memo + 8'b11111000;
								dot_column_7memo = dot_column_7memo + 8'b11111100;
							end
							No4_state_memo <= No4_state;
							changed_4<=1'b1;
						end
					end
					else
					begin
						if(No4_state != No4_state_memo) changed_4<= 1'b0;
					end
				end
				
				if(No5_state!=3'd0)
				begin
					if(!changed_5)
					begin
						if(No5_state==3'd1)
						begin
							dot_column_4memo = dot_column_4memo + 8'b00001100;
							dot_column_5memo = dot_column_5memo + 8'b00001100;
							No5_state_memo <= No5_state;
							changed_5<=1'b1;
						end
						else if(No5_state==3'd2)
						begin
							dot_column_4memo = dot_column_4memo + 8'b00001000;
							dot_column_5memo = dot_column_5memo + 8'b00000100;
							No5_state_memo <= No5_state;
							changed_5<=1'b1;
						end
						else if(No5_state==3'd3)
						begin
							if(dot_column_4memo[3:2] == 2'b11)
							begin
								dot_column_4memo = dot_column_4memo + 8'b11110100;
								dot_column_5memo = dot_column_5memo + 8'b11110100;
							end
							No5_state_memo <= No5_state;
							changed_5<=1'b1;
						end
						else if(No5_state==3'd4)
						begin
							if(dot_column_4memo[3:2] == 2'b10)
							begin
								dot_column_4memo = dot_column_4memo + 8'b11111000;
								dot_column_5memo = dot_column_5memo + 8'b11111100;
							end
							No5_state_memo <= No5_state;
							changed_5<=1'b1;
						end
					end
					else
					begin
						if(No5_state != No5_state_memo) changed_5<= 1'b0;
					end
				end
				//No.6
				if(No6_state!=3'd0)
				begin
					if(!changed_6)
					begin
						if(No6_state==3'd1)
						begin
							dot_column_2memo = dot_column_2memo + 8'b00001100;
							dot_column_3memo = dot_column_3memo + 8'b00001100;
							No6_state_memo <= No6_state;
							changed_6<=1'b1;
						end
						else if(No6_state==3'd2)
						begin
							dot_column_2memo = dot_column_2memo + 8'b00001000;
							dot_column_3memo = dot_column_3memo + 8'b00000100;
							No6_state_memo <= No6_state;
							changed_6<=1'b1;
						end
						else if(No6_state==3'd3)
						begin
							if(dot_column_2memo[3:2] == 2'b11)
							begin
								dot_column_2memo = dot_column_2memo + 8'b11110100;
								dot_column_3memo = dot_column_3memo + 8'b11110100;
							end
							No6_state_memo <= No6_state;
							changed_6=1'b1;
						end
						else if(No6_state==3'd4)
						begin
							if(dot_column_2memo[3:2] == 2'b10)
							begin
								dot_column_2memo = dot_column_2memo + 8'b11111000;
								dot_column_3memo = dot_column_3memo + 8'b11111100;
							end
							No6_state_memo <= No6_state;
							changed_6<=1'b1;
						end
					end
					else
					begin
						if(No6_state != No6_state_memo) changed_6<= 1'b0;
					end
				end
				//no.7
				if(No7_state!=3'd0)
				begin
					if(!changed_7)
					begin
						if(No7_state==3'd1)
						begin
							dot_column_6memo = dot_column_6memo + 8'b00000011;
							dot_column_7memo = dot_column_7memo + 8'b00000011;
							No7_state_memo <= No7_state;
							changed_7<=1'b1;
						end
						else if(No7_state==3'd2)
						begin
							dot_column_6memo = dot_column_6memo + 8'b00000010;
							dot_column_7memo = dot_column_7memo + 8'b00000001;
							No7_state_memo <= No7_state;
							changed_7<=1'b1;
						end
						else if(No7_state==3'd3)
						begin
							if(dot_column_6memo[1:0] == 2'b11)
							begin
								dot_column_6memo = dot_column_6memo + 8'b11111101;
								dot_column_7memo = dot_column_7memo + 8'b11111101;
							end
							No7_state_memo <= No7_state;
							changed_7=1'b1;
						end
						else if(No7_state==3'd4)
						begin
							if(dot_column_6memo[1:0] == 2'b10)
							begin
								dot_column_6memo = dot_column_6memo + 8'b11111110;
								dot_column_7memo = dot_column_7memo + 8'b11111111;
							end
							No7_state_memo <= No7_state;
							changed_7<=1'b1;
						end
					end
					else
					begin
						if(No7_state != No7_state_memo) changed_7<= 1'b0;
					end
				end
				//No.8
				if(No8_state!=3'd0)
				begin
					if(!changed_8)
					begin
						if(No8_state==3'd1)
						begin
							dot_column_4memo = dot_column_4memo + 8'b00000011;
							dot_column_5memo = dot_column_5memo + 8'b00000011;
							No8_state_memo <= No8_state;
							changed_8<=1'b1;
						end
						else if(No8_state==3'd2)
						begin
							dot_column_4memo = dot_column_4memo + 8'b00000010;
							dot_column_5memo = dot_column_5memo + 8'b00000001;
							No8_state_memo <= No8_state;
							changed_8<=1'b1;
						end
						else if(No8_state==3'd3)
						begin
							if(dot_column_4memo[1:0] == 2'b11)
							begin
								dot_column_4memo = dot_column_4memo + 8'b11111101;
								dot_column_5memo = dot_column_5memo + 8'b11111101;
							end
							No8_state_memo <= No8_state;
							changed_8<=1'b1;
						end
						else if(No8_state==3'd4)
						begin
							if(dot_column_4memo[1:0] == 2'b10)
							begin
								dot_column_4memo = dot_column_4memo + 8'b11111110;
								dot_column_5memo = dot_column_5memo + 8'b11111111;
							end
							No8_state_memo <= No8_state;
							changed_8<=1'b1;
						end
					end
					else
					begin
						if(No8_state != No8_state_memo) changed_8<= 1'b0;
					end
				end
				//No.9
				if(No9_state!=3'd0)
				begin
					if(!changed_9)
					begin
						if(No9_state==3'd1)
						begin
							dot_column_2memo = dot_column_2memo + 8'b00000011;
							dot_column_3memo = dot_column_3memo + 8'b00000011;
							No9_state_memo <= No9_state;
							changed_9<=1'b1;
						end
						else if(No9_state==3'd2)
						begin
							dot_column_2memo = dot_column_2memo + 8'b00000010;
							dot_column_3memo = dot_column_3memo + 8'b00000001;
							No9_state_memo <= No9_state;
							changed_9<=1'b1;
						end
						else if(No9_state==3'd3)
						begin
							if(dot_column_2memo[1:0] == 2'b11)
							begin
								dot_column_2memo = dot_column_2memo + 8'b11111101;
								dot_column_3memo = dot_column_3memo + 8'b11111101;
							end
							No9_state_memo <= No9_state;
							changed_9=1'b1;
						end
						else if(No9_state==3'd4)
						begin
							if(dot_column_2memo[1:0] == 2'b10)
							begin
								dot_column_2memo = dot_column_2memo + 8'b11111110;
								dot_column_3memo = dot_column_3memo + 8'b11111111;
							end
							No9_state_memo <= No9_state;
							changed_9<=1'b1;
						end
					end
					else
					begin
						if(No9_state != No9_state_memo) changed_9<= 1'b0;
					end
				end
				//No.10
				if(No10_state!=3'd0)
				begin
					if(!changed_10)
					begin
						if(No10_state==3'd1)
						begin
							dot_column_4memo = dot_column_4memo + 8'b11000000;
							dot_column_5memo = dot_column_5memo + 8'b11000000;
							No10_state_memo <= No10_state;
							changed_10<=1'b1;
						end
						else if(No10_state==3'd2)
						begin
							dot_column_4memo = dot_column_4memo + 8'b10000000;
							dot_column_5memo = dot_column_5memo + 8'b01000000;
							No10_state_memo <= No10_state;
							changed_10<=1'b1;
						end
						else if(No10_state==3'd3)
						begin
							if(dot_column_4memo[7:6] == 2'b11)
							begin
								dot_column_4memo = dot_column_4memo + 8'b01000000;
								dot_column_5memo = dot_column_5memo + 8'b01000000;
							end
							No10_state_memo <= No10_state;
							changed_10<=1'b1;
						end
						else if(No10_state==3'd4)
						begin
							if(dot_column_4memo[7:6] == 2'b10)
							begin
								dot_column_4memo = dot_column_4memo + 8'b10000000;
								dot_column_5memo = dot_column_5memo + 8'b11000000;
							end
							No10_state_memo <= No10_state;
							changed_10<=1'b1;
						end
					end
					else
					begin
						if(No10_state != No10_state_memo) changed_10<= 1'b0;
					end
				end
				//No.11
				if(No11_state!=3'd0)
				begin
					if(!changed_11)
					begin
						if(No11_state==3'd1)
						begin
							dot_column_2memo = dot_column_2memo + 8'b11000000;
							dot_column_3memo = dot_column_3memo + 8'b11000000;
							No11_state_memo <= No11_state;
							changed_11<=1'b1;
						end
						else if(No11_state==3'd2)
						begin
							dot_column_2memo = dot_column_2memo + 8'b10000000;
							dot_column_3memo = dot_column_3memo + 8'b01000000;
							No11_state_memo <= No11_state;
							changed_11<=1'b1;
						end
						else if(No11_state==3'd3)
						begin
							if(dot_column_2memo[7:6] == 2'b11)
							begin
								dot_column_2memo = dot_column_2memo + 8'b01000000;
								dot_column_3memo = dot_column_3memo + 8'b01000000;
							end
							No11_state_memo <= No11_state;
							changed_11<=1'b1;
						end
						else if(No11_state==3'd4)
						begin
							if(dot_column_2memo[7:6] == 2'b10)
							begin
								dot_column_2memo = dot_column_2memo + 8'b10000000;
								dot_column_3memo = dot_column_3memo + 8'b11000000;
							end
							No11_state_memo <= No11_state;
							changed_11<=1'b1;
						end
					end
					else
					begin
						if(No11_state != No11_state_memo) changed_11<= 1'b0;
					end
				end
				
				//No.12
				if(No12_state!=3'd0)
				begin
					if(!changed_12)
					begin
						if(No12_state==3'd1)
						begin
							dot_column_0memo = dot_column_0memo + 8'b00000011;
							dot_column_1memo = dot_column_1memo + 8'b00000011;
							No12_state_memo <= No12_state;
							changed_12<=1'b1;
						end
						else if(No12_state==3'd2)
						begin
							dot_column_0memo = dot_column_0memo + 8'b00000010;
							dot_column_1memo = dot_column_1memo + 8'b00000001;
							No12_state_memo <= No12_state;
							changed_12<=1'b1;
						end
						else if(No12_state==3'd3)
						begin
							if(dot_column_0memo[1:0] == 2'b11)
							begin
								dot_column_0memo = dot_column_0memo + 8'b11111101;
								dot_column_1memo = dot_column_1memo + 8'b11111101;
							end
							No12_state_memo <= No12_state;
							changed_12=1'b1;
						end
						else if(No12_state==3'd4)
						begin
							if(dot_column_0memo[1:0] == 2'b10)
							begin
								dot_column_0memo = dot_column_0memo + 8'b11111110;
								dot_column_1memo = dot_column_1memo + 8'b11111111;
							end
							No12_state_memo <= No12_state;
							changed_12<=1'b1;
						end
					end
					else
					begin
						if(No12_state != No12_state_memo) changed_12<= 1'b0;
					end
				end
				
				//No.13
				if(No13_state!=3'd0)
				begin
					if(!changed_13)
					begin
						if(No13_state==3'd1)
						begin
							dot_column_0memo = dot_column_0memo + 8'b00001100;
							dot_column_1memo = dot_column_1memo + 8'b00001100;
							No13_state_memo <= No13_state;
							changed_13<=1'b1;
						end
						else if(No13_state==3'd2)
						begin
							dot_column_0memo = dot_column_0memo + 8'b00001000;
							dot_column_1memo = dot_column_1memo + 8'b00000100;
							No13_state_memo <= No13_state;
							changed_13<=1'b1;
						end
						else if(No13_state==3'd3)
						begin
							if(dot_column_0memo[3:2] == 2'b11)
							begin
								dot_column_0memo = dot_column_0memo + 8'b11110100;
								dot_column_1memo = dot_column_1memo + 8'b11110100;
							end
							No13_state_memo <= No13_state;
							changed_13=1'b1;
						end
						else if(No13_state==3'd4)
						begin
							if(dot_column_0memo[3:2] == 2'b10)
							begin
								dot_column_0memo = dot_column_0memo + 8'b11111000;
								dot_column_1memo = dot_column_1memo + 8'b11111100;
							end
							No13_state_memo <= No13_state;
							changed_13<=1'b1;
						end
					end
					else
					begin
						if(No13_state != No13_state_memo) changed_13<= 1'b0;
					end
				end
				
				//No.14
				if(No14_state!=3'd0)
				begin
					if(!changed_14)
					begin
						if(No14_state==3'd1)
						begin
							dot_column_0memo = dot_column_0memo + 8'b00110000;
							dot_column_1memo = dot_column_1memo + 8'b00110000;
							No14_state_memo <= No14_state;
							changed_14<=1'b1;
						end
						else if(No14_state==3'd2)
						begin
							dot_column_0memo = dot_column_0memo + 8'b00100000;
							dot_column_1memo = dot_column_1memo + 8'b00010000;
							No14_state_memo <= No14_state;
							changed_14<=1'b1;
						end
						else if(No14_state==3'd3)
						begin
							if(dot_column_0memo[5:4] == 2'b11)
							begin
								dot_column_0memo = dot_column_0memo + 8'b11010000;
								dot_column_1memo = dot_column_1memo + 8'b11010000;
							end
							No14_state_memo <= No14_state;
							changed_14<=1'b1;
						end
						else if(No14_state==3'd4)
						begin
							if(dot_column_0memo[5:4] == 2'b10)
							begin
								dot_column_0memo = dot_column_0memo + 8'b11100000;
								dot_column_1memo = dot_column_1memo + 8'b11110000;
							end
							No14_state_memo <= No14_state;
							changed_14<=1'b1;
						end
					end
					else
					begin
						if(No14_state != No14_state_memo) changed_14<= 1'b0;
					end
				end
				
				//No.15
				if(No15_state!=3'd0)
				begin
					if(!changed_15)
					begin
						if(No15_state==3'd1)
						begin
							dot_column_0memo = dot_column_0memo + 8'b11000000;
							dot_column_1memo = dot_column_1memo + 8'b11000000;
							No15_state_memo <= No15_state;
							changed_15<=1'b1;
						end
						else if(No15_state==3'd2)
						begin
							dot_column_0memo = dot_column_0memo + 8'b10000000;
							dot_column_1memo = dot_column_1memo + 8'b01000000;
							No15_state_memo <= No15_state;
							changed_15<=1'b1;
						end
						else if(No15_state==3'd3)
						begin
							if(dot_column_0memo[7:6] == 2'b11)
							begin
								dot_column_0memo = dot_column_0memo + 8'b01000000;
								dot_column_1memo = dot_column_1memo + 8'b01000000;
							end
							No15_state_memo <= No15_state;
							changed_15<=1'b1;
						end
						else if(No15_state==3'd4)
						begin
							if(dot_column_0memo[7:6] == 2'b10)
							begin
								dot_column_0memo = dot_column_0memo + 8'b10000000;
								dot_column_1memo = dot_column_1memo + 8'b11000000;
							end
							No15_state_memo <= No15_state;
							changed_15<=1'b1;
						end
					end
					else
					begin
						if(No15_state != No15_state_memo) changed_15<= 1'b0;
					end
				end
				else begin end
			end
			else
			begin //prepare state
				case(countdown)
					2'b10: 
					begin
						case(count)
							3'd0: dot_column <= 8'b 00000000;
							3'd1: dot_column <= 8'b 00111100;
							3'd2: dot_column <= 8'b 00000100;
							3'd3: dot_column <= 8'b 00000100;
							3'd4: dot_column <= 8'b 00111100;
							3'd5: dot_column <= 8'b 00000100;
							3'd6: dot_column <= 8'b 00000100;
							3'd7: dot_column <= 8'b 00111100;
						endcase
					end
					2'b01: 
					begin
						case(count)
							3'd0: dot_column <= 8'b 00000000;
							3'd1: dot_column <= 8'b 00111100;
							3'd2: dot_column <= 8'b 00000100;
							3'd3: dot_column <= 8'b 00000100;
							3'd4: dot_column <= 8'b 00111100;
							3'd5: dot_column <= 8'b 00100000;
							3'd6: dot_column <= 8'b 00100000;
							3'd7: dot_column <= 8'b 00111100;
						endcase
					end
					2'b00: 
					begin
						case(count)
							3'd0: dot_column <= 8'b 00000000;
							3'd1: dot_column <= 8'b 00011000;
							3'd2: dot_column <= 8'b 00001000;
							3'd3: dot_column <= 8'b 00001000;
							3'd4: dot_column <= 8'b 00001000;
							3'd5: dot_column <= 8'b 00001000;
							3'd6: dot_column <= 8'b 00001000;
							3'd7: dot_column <= 8'b 00011100;
						endcase
					end
				endcase
				
				case(count)
					3'd0: dot_row <= 8'b 01111111;
					3'd1: dot_row <= 8'b 10111111;
					3'd2: dot_row <= 8'b 11011111;
					3'd3: dot_row <= 8'b 11101111;
					3'd4: dot_row <= 8'b 11110111;
					3'd5: dot_row <= 8'b 11111011;
					3'd6: dot_row <= 8'b 11111101;
					3'd7: dot_row <= 8'b 11111110;
				endcase
			end
			count<=count+3'b001;
		end
	end
endmodule





//ClockDiviser Chunk

module clock_divider(clk, rst, clk_div);

input clk, rst;
output reg clk_div;

reg [31:0]cnt;

always@(posedge clk or negedge rst) begin
	if(!rst) begin
		cnt <= 32'd0;
		clk_div <= 1'b0;
	end
	else begin
		if(cnt == 32'd25000000) begin
			cnt <= 32'd0;
			clk_div <= ~clk_div;
		end
		else begin
			cnt <= cnt + 32'd1;
		end
	end
end

endmodule

module clock_light_divider(clk, rst, clk_light_div);

input clk, rst;
output reg clk_light_div;

reg [31:0]cnt;

always@(posedge clk or negedge rst) begin
	if(!rst) begin
		cnt <= 32'd0;
		clk_light_div <= 1'b0;
	end
	else begin
		if(cnt == 32'd2500) begin
			cnt <= 32'd0;
			clk_light_div <= ~clk_light_div;
		end
		else begin
			cnt <= cnt + 32'd1;
		end
	end
end

endmodule

module Random_Box(
	input clk, 
	input clk_1Hz,
	input reset,
	output reg mouse_bomb,
	output reg [3:0] which_box
);

	//mouse_bomb o for mouse 1 for bomb
	reg [1:0] mouse_bomb_index;

	always@(posedge clk_1Hz)
	begin
		if(!reset)
		begin
			mouse_bomb<=1'b0;
			mouse_bomb_index<=2'd0;
			which_box<=4'd0;
		end
		else
		begin
			//random 0~3
			mouse_bomb_index<= clk % 4;
			if(mouse_bomb_index==2'd3)
			begin
				mouse_bomb<=1'b1;
			end
			else
			begin
				mouse_bomb<=1'b0;
			end

			//random 0~15
			which_box<= clk % 2;
		end
	end

endmodule
