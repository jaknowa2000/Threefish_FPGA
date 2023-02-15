
module ThreeFishBlockControl(
	input wire		inClk,
	input wire  	inKeyWr,
	input wire  	inTweakWr,
	input wire  	inBlockWr,
	output wire  		 outRoundReginoutWr,
	output wire  		 outRoundRegininWr,
	output wire  		 outBlockOutRegWr,
	output wire  		 outBusy,
	output wire  [7:0] outRound);


reg [7:0] regRound = 8'd0;
reg       regBlockWr = 1'd0;
reg       regKeyWr = 1'd0;
reg       regTweakWr = 1'd0;


always @ (posedge(inClk))
begin
	if (inBlockWr == 1'd1) begin
		 regBlockWr <= 1'd1;
	end
	if (inTweakWr == 1'd1) begin
		 regTweakWr <= 1'd1;
	end
	if (inKeyWr == 1'd1) begin
		 regKeyWr <= 1'd1;
	end	
	if ((regBlockWr == 1'd1 && regTweakWr == 1'd1 && regKeyWr == 1'd1) || (regRound != 8'd0)) begin
		if (regRound == 8'd73) begin
			 regRound <= 8'd0;
			 regBlockWr <= 1'd0;
			 regTweakWr <= 1'd0;
			 regKeyWr <= 1'd0;
		end else begin
			 regRound <= regRound + 8'd1;
		end
	end
	
end

assign outRoundReginoutWr = (regRound == 8'b0) ? inBlockWr && inTweakWr && inKeyWr : 1'b0;

assign outRoundRegininWr  = (regRound == 8'b0) ? 1'b0 : 1'b1;

assign outBlockOutRegWr   = (regRound == 8'd73) ? 1'b1 : 1'b0;

assign outBusy				  = (regRound == 8'b0) ? 1'b0 : 1'b1;

assign outRound			  = regRound - 8'd1;
 
endmodule
