
module AddKeyFunc (
	input wire	[511:0] inBlock,
	input wire	[511:0] inSubKey,
	output wire [511:0] outBlock);


assign outBlock[511:448] = inBlock[511:448] + inSubKey[511:448];
assign outBlock[447:384] = inBlock[447:384] + inSubKey[447:384];
assign outBlock[383:320] = inBlock[383:320] + inSubKey[383:320];
assign outBlock[319:256] = inBlock[319:256] + inSubKey[319:256];
assign outBlock[255:192] = inBlock[255:192] + inSubKey[255:192];
assign outBlock[191:128] = inBlock[191:128] + inSubKey[191:128];
assign outBlock[127:64]  = inBlock[127:64]  + inSubKey[127:64] ;
assign outBlock[63:0]    = inBlock[63:0]    + inSubKey[63:0]   ;

endmodule
