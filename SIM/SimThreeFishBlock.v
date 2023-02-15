
module SimThreeFishBlock;


reg [63:0] TEST = 0;
integer i = 0;


parameter   inClkp = 10;
reg         inClk  = 1'b0;

always
begin
    #(inClkp/2) inClk = !inClk;
end


wire wireBusy;
			
reg		[511:0] regKey = 512'h17161514131211101f1e1d1c1b1a191827262524232221202f2e2d2c2b2a292837363534333231303f3e3d3c3b3a393847464544434241404f4e4d4c4b4a4948;
reg		[511:0] regData = 512'hf8f9fafbfcfdfefff0f1f2f3f4f5f6f7e8e9eaebecedeeefe0e1e2e3e4e5e6e7d8d9dadbdcdddedfd0d1d2d3d4d5d6d7c8c9cacbcccdcecfc0c1c2c3c4c5c6c7;
reg		[127:0] regTweak = 128'h07060504030201000f0e0d0c0b0a0908;
//reg		[511:0] regKey = 512'd0;
//reg		[511:0] regData = 512'hBC2560EFC6BBA2B1E3361F162238EB40FB8631EE0ABBD1757B9479D4C5479ED1CFF0356E58F8C27BB1B7B08430F0E7F7E9A380A56139ABF1BE7B6D4AA11EB47E;
//reg		[127:0] regTweak = 128'd0;

reg    [511:0] regTestResult = 512'h2c5ad426964304e39a2436d6d8ca01b4dd456db00e333863794725970eb9368b043546998d0a2a2725a7c918ea204478346201a1fedf11af3daf1c5c3d672789;
//reg    [511:0] regTestResult = 512'hBC2560EFC6BBA2B1E3361F162238EB40FB8631EE0ABBD1757B9479D4C5479ED1CFF0356E58F8C27BB1B7B08430F0E7F7E9A380A56139ABF1BE7B6D4AA11EB47E;
//reg    [511:0] regTestResult1 = 512'he2cb9189db91a0323716454fc47baf12e5d15127d655a45f2848924212c6eda9e7827de8d9a81b8a5e8a3c80e275aaec8167504797b9c27079acf1ad8c64fb34;
reg    [511:0] regTestResult1 = 512'hfd4f3279f9d47dcdf80080bbc39cb21ed49f9f6a30637bd6607352cdf96ba7b662d57bfd75cd1712c330cac98f619fdd35a3bae661c8287f738cc00f598d714f;

wire	[511:0]	outData;


reg reginKeyWr = 1'b0;
reg reginTweakWr = 1'b0;
reg reginBlockWr = 1'b0;

ThreeFishBlock  instThreeFishBlock (
						.inClk(inClk),
						.inKeyWr(reginKeyWr),
						.inKey(regKey),
						.inTweakWr(reginTweakWr),
						.inTweak(regTweak),
						.inBlockWr(reginBlockWr),
						.inBlock(regData),
						.outBlock(outData),
						.outBusy(wireBusy));

 
always
	begin
		
	 TEST = TEST + 1;
	 #(inClkp);
	 
		reginKeyWr <= 1'b1; reginTweakWr <= 1'b1; reginBlockWr <= 1'b1;
		#(inClkp);
		reginKeyWr <= 1'b0; reginTweakWr <= 1'b0; reginBlockWr <= 1'b0;
		wait(wireBusy == 1'b1 && inClk == 1'b0);
		wait(wireBusy == 1'b0 && inClk == 1'b0);
		regData <= outData;
      if (outData != regTestResult) $display("TEST: %3d FAILED VALUE: %64x", TEST, outData);
      else $display("TEST: %3d OK VALUE: %64x", TEST, outData);
		TEST = TEST + 1;
		for (i = 0; i < 10; i = i + 1)
		begin
				reginKeyWr <= 1'b1; reginTweakWr <= 1'b1; reginBlockWr <= 1'b1;
				#(inClkp);
				reginKeyWr <= 1'b0; reginTweakWr <= 1'b0; reginBlockWr <= 1'b0;
				wait(wireBusy == 1'b1 && inClk == 1'b0);
				wait(wireBusy == 1'b0 && inClk == 1'b0);
				regData <= outData;
		end
		if (outData != regTestResult1) $display("TEST: %3d FAILED VALUE: %64x", TEST, outData);
      else $display("TEST: %3d OK VALUE: %64x", TEST, outData);
	 
	 #(inClkp);

		$stop;
   end
////////////////////////////
endmodule
