// Connetcion of all modules.

	 
module ThreeFishBlock(
	input wire			  inClk,
	input wire  		  inKeyWr,
	input wire  [511:0] inKey,
	input wire  		  inTweakWr,
	input wire  [127:0] inTweak,
	input wire  		  inBlockWr,
	input wire  [511:0] inBlock,
	output wire [511:0] outBlock,
	output wire 		  outBusy);

	
wire	wireRoundReginoutWr;
wire	wireRoundRegininWr;
wire  wireBlockOutRegWr;

wire [511:0]  wireFourRoundBlock1;
wire [511:0]  wireFourRoundBlock2;
wire [7:0]    wireRound;
wire [7:0]    wireRound1;
wire [511:0]  wireSubKey;
wire [511:0]  wireSubKey1;

assign wireRound1 = wireRound + 8'd1;

ThreeFishBlockControl instThreeFishBlockControl(
				.inClk(inClk),
				.inKeyWr(inKeyWr),
				.inTweakWr(inTweakWr),
				.inBlockWr(inBlockWr),
				.outRoundReginoutWr(wireRoundReginoutWr),
				.outRoundRegininWr(wireRoundRegininWr),
				.outBlockOutRegWr(wireBlockOutRegWr),
				.outBusy(outBusy),
				.outRound(wireRound));		
				
	
KeyFunc  instKeyFunc  (.inKey(inKey), .inTweak(inTweak), .inSubKeyId4(wireRound1), .outSubKey(wireSubKey));

KeyReg instKeyReg(
				.inClk(inClk),
				.inSubKey(wireSubKey),
				.outSubKey(wireSubKey1));

													
RoundFunc instRoundFunc(
				.inKey(wireSubKey1),
				.inBlock(wireFourRoundBlock2),
				.inTweak(inTweak),
				.inRound(wireRound),
				.outBlock(wireFourRoundBlock1));	

				
RoundReg instRoundReg(
				.inClk(inClk),
				.inoutWr(wireRoundReginoutWr),
				.inoutBlock(inBlock),
				.ininWr(wireRoundRegininWr),
				.ininBlock(wireFourRoundBlock1),
				.outBlock(wireFourRoundBlock2));			

				
ThreeFishBlockOutReg instThreeFishBlockOutReg(
				.inClk(inClk),
				.inWr(wireBlockOutRegWr),
				.inBlock(wireFourRoundBlock2),
				.inKey(inKey),
				.inTweak(inTweak),
				.inRound4(wireRound),
				.outBlock(outBlock));
								

endmodule
