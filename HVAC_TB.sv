module HVAC_TB;
	reg clk;
	reg rst;
	reg [7:0] temp;
	reg [7:0] setpoint;
	reg [7:0] hysteresis;
	wire heater;
	wire cooler;
	wire fan;
	HVAC dut(
	.clk(clk),
	.rst(rst),
	.setpoint(setpoint),
	.hysteresis(hysteresis),
	.heater(heater),
	.cooler(cooler),
	.fan(fan));
	always #5 clk=~clk;

	initial begin
	clk =0;
	rst=1;
	#10;
	rst=0;
	temp=20;
	#20;
	temp=25;
	#20;
	temp=30;
	#20;
	temp=26;
	#20
	temp=23;
	#20
	temp=22;
	#20;
	$finish;
	end
	endmodule
	
