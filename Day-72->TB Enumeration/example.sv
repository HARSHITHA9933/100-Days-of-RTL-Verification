/*create enum for traffic light for green, yellow, red colour,
assign color name to variable one by one and print its index number with name.*/
module example;
typedef enum bit [1:0] {green, yellow, red}color;
color color_e;
initial begin
	$display("CE=traffic light index number %od and name=%0s",color_e,color_e.name());
	color_e=yellow;
	$display("CE=traffic light index number %od and name=%0s",color_e,color_e.name());
	color_e=red;
	$display("CE=traffic light index number %od and name=%0s",color_e,color_e.name());
end
endmodule
