module HVAC(	
	input clk,
	input rst,
	input [7:0] temp,
	input [7:0] setpoint,
	input [7:0] hysteresis,
	output reg heater,
	output reg cooler,
	output reg fan
	);
	parameter IDLE =2'b00;
	parameter HEATING =2'b01;
	parameter COOLING =2'b10;
	reg [1:0] state, next_state;
	always @ (posedge clk or posedge rst) begin
	if (rst)
		state <=IDLE;
	else
		state <=next_state;
	end
	always @(*) begin
	case (state)
	IDLE: begin
		if (temp < (setpoint- hysteresis))
		next_state= HEATING;
		else if (temp > (setpoint+ hysteresis))
		next_state=COOLING;
		else
		next_state=HEATING;
		end
	HEATING: begin
	if (temp>= setpoint)
		next_state=IDLE;
	else 
		next_state=HEATING;
		end
COOLING: begin
	if (temp<= setpoint)
		next_state=IDLE;
	else 
		next_state=COOLING;
		end
	default : next_state=IDLE;
	endcase
	end
	always@(*) begin
	heater=0;
	cooler=0;
	fan=1;
	case(state)
		IDLE: begin
		heater=0;
		cooler=0;
		end
		HEATING: begin
		heater=1;
		cooler=0;
end
		COOLING: begin
		heater =0;
		cooler=1;
	end
endcase
	end
	endmodule