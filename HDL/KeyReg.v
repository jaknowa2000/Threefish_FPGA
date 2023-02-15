
module KeyReg (
	input wire		 	  	inClk,
	input wire	[511:0]  inSubKey,
	output wire [511:0]  outSubKey);

reg  [511:0] regSubKey;
	
always @ (posedge(inClk))
begin
	regSubKey <= inSubKey;
end

assign outSubKey = regSubKey;
									
endmodule

