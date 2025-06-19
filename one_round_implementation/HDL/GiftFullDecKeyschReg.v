//******************************************
// Author: Jakub Zaroda
// Email: jakub.zaroda@outlook.com
//******************************************

module GiftFullDecKeyschReg (
    input wire inClk,
    input wire inExtWr,
    input wire [127:0] inExtData,
    output wire [5:0] outExtRoundConst,
    output wire [127:0] outExtData
);

reg [127:0] regData = 128'b0;
reg [5:0] regRoundConst = 6'b0;

always @(posedge(inClk)) begin
    if(inExtWr ==1'b1) begin
        regData <= inExtData;
		regRoundConst <= 6'd1; 
    end
end

assign outExtData = regData;
assign outExtRoundConst = regRoundConst;


endmodule