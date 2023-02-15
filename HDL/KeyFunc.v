
module KeyFunc (
	input wire	[511:0] inKey,
	input wire	[127:0] inTweak,
	input wire  [7:0]   inSubKeyId4,
	output wire [511:0] outSubKey);
	
wire [7:0] inSubKeyId;
	
assign inSubKeyId = inSubKeyId4 / 4;
	

assign outSubKey[511:448] = 	(inSubKeyId % 9 == 8'd0) ? 	inKey[511:448] :
										(inSubKeyId % 9 == 8'd1) ? 	inKey[447:384] :
										(inSubKeyId % 9 == 8'd2) ? 	inKey[383:320] :
										(inSubKeyId % 9 == 8'd3) ? 	inKey[319:256] :
										(inSubKeyId % 9 == 8'd4) ? 	inKey[255:192] :
										(inSubKeyId % 9 == 8'd5) ? 	inKey[191:128] :
										(inSubKeyId % 9 == 8'd6) ? 	inKey[127:64] :
										(inSubKeyId % 9 == 8'd7) ? 	inKey[63:0] : inKey[511:448] ^ inKey[447:384] ^ inKey[383:320] ^ inKey[319:256] ^ inKey[255:192] ^ inKey[191:128] ^ inKey[127:64] ^ inKey[63:0] ^ 64'h1BD11BDAA9FC1A22;

assign outSubKey[447:384] = 	(inSubKeyId % 9 == 8'd0) ? 	inKey[447:384] :
										(inSubKeyId % 9 == 8'd1) ? 	inKey[383:320] :
										(inSubKeyId % 9 == 8'd2) ? 	inKey[319:256] :
										(inSubKeyId % 9 == 8'd3) ? 	inKey[255:192] :
										(inSubKeyId % 9 == 8'd4) ? 	inKey[191:128] :
										(inSubKeyId % 9 == 8'd5) ? 	inKey[127:64]  :
										(inSubKeyId % 9 == 8'd6) ? 	inKey[63:0]   :
										(inSubKeyId % 9 == 8'd7) ? 	inKey[511:448] ^ inKey[447:384] ^ inKey[383:320] ^ inKey[319:256] ^ inKey[255:192] ^ inKey[191:128] ^ inKey[127:64] ^ inKey[63:0] ^ 64'h1BD11BDAA9FC1A22 : inKey[511:448];

assign outSubKey[383:320] = 	(inSubKeyId % 9 == 8'd0) ? 	inKey[383:320] :
										(inSubKeyId % 9 == 8'd1) ? 	inKey[319:256] :
										(inSubKeyId % 9 == 8'd2) ? 	inKey[255:192] :
										(inSubKeyId % 9 == 8'd3) ? 	inKey[191:128] :
										(inSubKeyId % 9 == 8'd4) ? 	inKey[127:64]  :
										(inSubKeyId % 9 == 8'd5) ? 	inKey[63:0]    :
										(inSubKeyId % 9 == 8'd6) ? 	inKey[511:448] ^ inKey[447:384] ^ inKey[383:320] ^ inKey[319:256] ^ inKey[255:192] ^ inKey[191:128] ^ inKey[127:64] ^ inKey[63:0] ^ 64'h1BD11BDAA9FC1A22   :
										(inSubKeyId % 9 == 8'd7) ? 	inKey[511:448] : inKey[447:384];

assign outSubKey[319:256] = 	(inSubKeyId % 9 == 8'd0) ? 	inKey[319:256] :
										(inSubKeyId % 9 == 8'd1) ? 	inKey[255:192] :
										(inSubKeyId % 9 == 8'd2) ? 	inKey[191:128] :
										(inSubKeyId % 9 == 8'd3) ? 	inKey[127:64]  :
										(inSubKeyId % 9 == 8'd4) ? 	inKey[63:0]    :
										(inSubKeyId % 9 == 8'd5) ? 	inKey[511:448] ^ inKey[447:384] ^ inKey[383:320] ^ inKey[319:256] ^ inKey[255:192] ^ inKey[191:128] ^ inKey[127:64] ^ inKey[63:0] ^ 64'h1BD11BDAA9FC1A22   :
										(inSubKeyId % 9 == 8'd6) ? 	inKey[511:448] :
										(inSubKeyId % 9 == 8'd7) ? 	inKey[447:384] : inKey[383:320];

assign outSubKey[255:192] = 	(inSubKeyId % 9 == 8'd0) ? 	inKey[255:192] :
										(inSubKeyId % 9 == 8'd1) ? 	inKey[191:128] :
										(inSubKeyId % 9 == 8'd2) ? 	inKey[127:64]  :
										(inSubKeyId % 9 == 8'd3) ? 	inKey[63:0]    :
										(inSubKeyId % 9 == 8'd4) ? 	inKey[511:448] ^ inKey[447:384] ^ inKey[383:320] ^ inKey[319:256] ^ inKey[255:192] ^ inKey[191:128] ^ inKey[127:64] ^ inKey[63:0] ^ 64'h1BD11BDAA9FC1A22   :
										(inSubKeyId % 9 == 8'd5) ? 	inKey[511:448] :
										(inSubKeyId % 9 == 8'd6) ? 	inKey[447:384] :
										(inSubKeyId % 9 == 8'd7) ? 	inKey[383:320] : inKey[319:256];

assign outSubKey[191:128] = 	(inSubKeyId % 9 == 8'd0) ? 	inKey[191:128] + inTweak[127:64] :
										(inSubKeyId % 9 == 8'd1) ? 	inKey[127:64]  + inTweak[63:0] :
										(inSubKeyId % 9 == 8'd2) ? 	inKey[63:0]    + (inTweak[127:64] ^ inTweak[63:0]) :
										(inSubKeyId % 9 == 8'd3) ? 	(inKey[511:448] ^ inKey[447:384] ^ inKey[383:320] ^ inKey[319:256] ^ inKey[255:192] ^ inKey[191:128] ^ inKey[127:64] ^ inKey[63:0] ^ 64'h1BD11BDAA9FC1A22) + inTweak[127:64]  :
										(inSubKeyId % 9 == 8'd4) ? 	inKey[511:448] + inTweak[63:0] :
										(inSubKeyId % 9 == 8'd5) ? 	inKey[447:384] + (inTweak[127:64] ^ inTweak[63:0]) :
										(inSubKeyId % 9 == 8'd6) ? 	inKey[383:320] + inTweak[127:64] :
										(inSubKeyId % 9 == 8'd7) ? 	inKey[319:256] + inTweak[63:0] : inKey[255:192] + (inTweak[127:64] ^ inTweak[63:0]);

assign outSubKey[127:64] = 	(inSubKeyId % 9 == 8'd0) ? 	inKey[127:64]  + inTweak[63:0] :
										(inSubKeyId % 9 == 8'd1) ? 	inKey[63:0]    + (inTweak[127:64] ^ inTweak[63:0]) :
										(inSubKeyId % 9 == 8'd2) ? 	(inKey[511:448] ^ inKey[447:384] ^ inKey[383:320] ^ inKey[319:256] ^ inKey[255:192] ^ inKey[191:128] ^ inKey[127:64] ^ inKey[63:0] ^ 64'h1BD11BDAA9FC1A22) + inTweak[127:64]  :
										(inSubKeyId % 9 == 8'd3) ? 	inKey[511:448] + inTweak[63:0] :
										(inSubKeyId % 9 == 8'd4) ? 	inKey[447:384] + (inTweak[127:64] ^ inTweak[63:0]) :
										(inSubKeyId % 9 == 8'd5) ? 	inKey[383:320] + inTweak[127:64] :
										(inSubKeyId % 9 == 8'd6) ? 	inKey[319:256] + inTweak[63:0] :
										(inSubKeyId % 9 == 8'd7) ? 	inKey[255:192] + (inTweak[127:64] ^ inTweak[63:0]) : inKey[191:128] + inTweak[127:64];										
										
assign outSubKey[63:0] = 		(inSubKeyId % 9 == 8'd0) ? 	inKey[63:0]    + inSubKeyId[7:0] :
										(inSubKeyId % 9 == 8'd1) ? 	(inKey[511:448] ^ inKey[447:384] ^ inKey[383:320] ^ inKey[319:256] ^ inKey[255:192] ^ inKey[191:128] ^ inKey[127:64] ^ inKey[63:0] ^ 64'h1BD11BDAA9FC1A22) + inSubKeyId  :
										(inSubKeyId % 9 == 8'd2) ? 	inKey[511:448] + inSubKeyId[7:0] :
										(inSubKeyId % 9 == 8'd3) ? 	inKey[447:384] + inSubKeyId[7:0] :
										(inSubKeyId % 9 == 8'd4) ? 	inKey[383:320] + inSubKeyId[7:0] :
										(inSubKeyId % 9 == 8'd5) ? 	inKey[319:256] + inSubKeyId[7:0] :
										(inSubKeyId % 9 == 8'd6) ? 	inKey[255:192] + inSubKeyId[7:0] :
										(inSubKeyId % 9 == 8'd7) ? 	inKey[191:128] + inSubKeyId[7:0] : inKey[127:64] + inSubKeyId[7:0];											
										
endmodule
