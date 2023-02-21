// It is implementation of Pi function in threefish.

module PiFunc (
	input wire	[511:0] inData,
	output wire [511:0] outData);
	

	
assign outData[511:448] = inData[383:320];
assign outData[447:384] = inData[447:384];
assign outData[383:320] = inData[255:192];
assign outData[319:256] = inData[63:0];
assign outData[255:192] = inData[127:64];
assign outData[191:128] = inData[191:128];
assign outData[127:64]  = inData[511:448];
assign outData[63:0]    = inData[319:256];

endmodule
