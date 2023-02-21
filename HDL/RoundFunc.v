// There is calculating one round of cipher.


module RoundFunc (
	input wire	[511:0] inKey,
	input wire	[511:0] inBlock,
	input wire	[127:0] inTweak,
	input wire	[7:0]   inRound,
	output wire [511:0] outBlock);
	

wire [511:0] wireAfterMix;
wire [511:0] wireBlock;
wire [511:0] wireAfterSubKey;


AddKeyFunc  instAddKeyFunc    (.inBlock(inBlock), .inSubKey(inKey), .outBlock(wireAfterSubKey));


assign  wireBlock = (inRound % 4 == 0) ? wireAfterSubKey : inBlock;


MixFunc	instMixFunc		(.inRound(inRound), .inData(wireBlock), .outData(wireAfterMix));
PiFunc	instPiFunc		(.inData(wireAfterMix), .outData(outBlock));

	
endmodule
