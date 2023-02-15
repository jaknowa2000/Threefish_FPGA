
module RoundReg (
	input wire		 	  	inClk,
	input wire	         inoutWr,
	input wire  [511:0]  inoutBlock,
	input wire	         ininWr,
	input wire  [511:0]  ininBlock,
	output wire [511:0]  outBlock);
	

reg [511:0] regBlock = 512'b0;

always @ (posedge(inClk))
begin
	if (inoutWr == 1'b1) begin
		regBlock <= inoutBlock;
	end
	if (ininWr == 1'b1) begin
		regBlock <= ininBlock;
	end
end

assign outBlock = regBlock;
									
endmodule
