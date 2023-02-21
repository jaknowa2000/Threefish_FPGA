/* There is performed last subkey adding (after 72 rounds of cipher).
Output of this module will be ciphertext.
Signal inWr is increasing after 72 rounds only for one clock cicle.
*/ 

module ThreeFishBlockOutReg(
	input wire				inClk,
	input wire  			inWr,
	input wire  [511:0]  inBlock,
	input wire  [511:0]  inKey,
	input wire  [127:0]  inTweak,
	input wire  [7:0]    inRound4,
	output wire [511:0]  outBlock);
	

reg [511:0]  regBlockOut = 512'b0;
wire [511:0] wireBlockTemp;
wire [511:0] wireSubKey;

KeyFunc     instKeyFunc       (.inKey(inKey), .inTweak(inTweak), .inSubKeyId4(inRound4), .outSubKey(wireSubKey));
AddKeyFunc  instAddKeyFunc    (.inBlock(inBlock), .inSubKey(wireSubKey), .outBlock(wireBlockTemp));

always @ (posedge(inClk))
begin 
	if (inWr == 1'b1) begin
		 regBlockOut <= wireBlockTemp;
	end
end

assign outBlock = regBlockOut;
	 
endmodule
