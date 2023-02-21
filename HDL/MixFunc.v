// It is implementation of Mix function in threefish.

module MixFunc (
	input wire	[7:0]	  inRound,
	input wire	[511:0] inData,
	output wire [511:0] outData);
	

	
assign outData[511:448] = inData[511:448] + inData[447:384];
assign outData[383:320] = inData[383:320] + inData[319:256];
assign outData[255:192] = inData[255:192] + inData[191:128];
assign outData[127:64]  = inData[127:64] + inData[63:0];


assign outData[447:384] = 	(inRound % 8 == 8'h00) ? ((inData[447:384] << 46) | (inData[447:384] >> (64 - 46))) & 64'hFFFFFFFFFFFFFFFF ^ (inData[511:448] + inData[447:384]) :
									(inRound % 8 == 8'h01) ? ((inData[447:384] << 33) | (inData[447:384] >> (64 - 33))) & 64'hFFFFFFFFFFFFFFFF ^ (inData[511:448] + inData[447:384]) :
									(inRound % 8 == 8'h02) ? ((inData[447:384] << 17) | (inData[447:384] >> (64 - 17))) & 64'hFFFFFFFFFFFFFFFF ^ (inData[511:448] + inData[447:384]) :
									(inRound % 8 == 8'h03) ? ((inData[447:384] << 44) | (inData[447:384] >> (64 - 44))) & 64'hFFFFFFFFFFFFFFFF ^ (inData[511:448] + inData[447:384]) :
									(inRound % 8 == 8'h04) ? ((inData[447:384] << 39) | (inData[447:384] >> (64 - 39))) & 64'hFFFFFFFFFFFFFFFF ^ (inData[511:448] + inData[447:384]) :
									(inRound % 8 == 8'h05) ? ((inData[447:384] << 13) | (inData[447:384] >> (64 - 13))) & 64'hFFFFFFFFFFFFFFFF ^ (inData[511:448] + inData[447:384]) :
									(inRound % 8 == 8'h06) ? ((inData[447:384] << 25) | (inData[447:384] >> (64 - 25))) & 64'hFFFFFFFFFFFFFFFF ^ (inData[511:448] + inData[447:384]) : ((inData[447:384] << 8) | (inData[447:384] >> (64 - 8))) & 64'hFFFFFFFFFFFFFFFF ^ (inData[511:448] + inData[447:384]);
									
assign outData[319:256] = 	(inRound % 8 == 8'h00) ? ((inData[319:256] << 36) | (inData[319:256] >> (64 - 36))) & 64'hFFFFFFFFFFFFFFFF ^ (inData[383:320] + inData[319:256]) :
									(inRound % 8 == 8'h01) ? ((inData[319:256] << 27) | (inData[319:256] >> (64 - 27))) & 64'hFFFFFFFFFFFFFFFF ^ (inData[383:320] + inData[319:256]) :
									(inRound % 8 == 8'h02) ? ((inData[319:256] << 49) | (inData[319:256] >> (64 - 49))) & 64'hFFFFFFFFFFFFFFFF ^ (inData[383:320] + inData[319:256]) :
									(inRound % 8 == 8'h03) ? ((inData[319:256] << 9) | (inData[319:256] >> (64 - 9))) & 64'hFFFFFFFFFFFFFFFF ^ (inData[383:320] + inData[319:256]) :
									(inRound % 8 == 8'h04) ? ((inData[319:256] << 30) | (inData[319:256] >> (64 - 30))) & 64'hFFFFFFFFFFFFFFFF ^ (inData[383:320] + inData[319:256]) :
									(inRound % 8 == 8'h05) ? ((inData[319:256] << 50) | (inData[319:256] >> (64 - 50))) & 64'hFFFFFFFFFFFFFFFF ^ (inData[383:320] + inData[319:256]) :
									(inRound % 8 == 8'h06) ? ((inData[319:256] << 29) | (inData[319:256] >> (64 - 29))) & 64'hFFFFFFFFFFFFFFFF ^ (inData[383:320] + inData[319:256]) : ((inData[319:256] << 35) | (inData[319:256] >> (64 - 35))) & 64'hFFFFFFFFFFFFFFFF ^ (inData[383:320] + inData[319:256]);
									
assign outData[191:128] = 	(inRound % 8 == 8'h00) ? ((inData[191:128] << 19) | (inData[191:128] >> (64 - 19))) & 64'hFFFFFFFFFFFFFFFF ^ (inData[255:192] + inData[191:128]) :
									(inRound % 8 == 8'h01) ? ((inData[191:128] << 14) | (inData[191:128] >> (64 - 14))) & 64'hFFFFFFFFFFFFFFFF ^ (inData[255:192] + inData[191:128]) :
									(inRound % 8 == 8'h02) ? ((inData[191:128] << 36) | (inData[191:128] >> (64 - 36))) & 64'hFFFFFFFFFFFFFFFF ^ (inData[255:192] + inData[191:128]) :
									(inRound % 8 == 8'h03) ? ((inData[191:128] << 54) | (inData[191:128] >> (64 - 54))) & 64'hFFFFFFFFFFFFFFFF ^ (inData[255:192] + inData[191:128]) :
									(inRound % 8 == 8'h04) ? ((inData[191:128] << 34) | (inData[191:128] >> (64 - 34))) & 64'hFFFFFFFFFFFFFFFF ^ (inData[255:192] + inData[191:128]) :
									(inRound % 8 == 8'h05) ? ((inData[191:128] << 10) | (inData[191:128] >> (64 - 10))) & 64'hFFFFFFFFFFFFFFFF ^ (inData[255:192] + inData[191:128]) :
									(inRound % 8 == 8'h06) ? ((inData[191:128] << 39) | (inData[191:128] >> (64 - 39))) & 64'hFFFFFFFFFFFFFFFF ^ (inData[255:192] + inData[191:128]) : ((inData[191:128] << 56) | (inData[191:128] >> (64 - 56))) & 64'hFFFFFFFFFFFFFFFF ^ (inData[255:192] + inData[191:128]);
									
assign outData[63:0] = 		(inRound % 8 == 8'h00) ? ((inData[63:0] << 37) | (inData[63:0] >> (64 - 37))) & 64'hFFFFFFFFFFFFFFFF ^ (inData[127:64] + inData[63:0]) :
									(inRound % 8 == 8'h01) ? ((inData[63:0] << 42) | (inData[63:0] >> (64 - 42))) & 64'hFFFFFFFFFFFFFFFF ^ (inData[127:64] + inData[63:0]) :
									(inRound % 8 == 8'h02) ? ((inData[63:0] << 39) | (inData[63:0] >> (64 - 39))) & 64'hFFFFFFFFFFFFFFFF ^ (inData[127:64] + inData[63:0]) :
									(inRound % 8 == 8'h03) ? ((inData[63:0] << 56) | (inData[63:0] >> (64 - 56))) & 64'hFFFFFFFFFFFFFFFF ^ (inData[127:64] + inData[63:0]) :
									(inRound % 8 == 8'h04) ? ((inData[63:0] << 24) | (inData[63:0] >> (64 - 24))) & 64'hFFFFFFFFFFFFFFFF ^ (inData[127:64] + inData[63:0]) :
									(inRound % 8 == 8'h05) ? ((inData[63:0] << 17) | (inData[63:0] >> (64 - 17))) & 64'hFFFFFFFFFFFFFFFF ^ (inData[127:64] + inData[63:0]) :
									(inRound % 8 == 8'h06) ? ((inData[63:0] << 43) | (inData[63:0] >> (64 - 43))) & 64'hFFFFFFFFFFFFFFFF ^ (inData[127:64] + inData[63:0]) : ((inData[63:0] << 22) | (inData[63:0] >> (64 - 22))) & 64'hFFFFFFFFFFFFFFFF ^ (inData[127:64] + inData[63:0]);

endmodule
