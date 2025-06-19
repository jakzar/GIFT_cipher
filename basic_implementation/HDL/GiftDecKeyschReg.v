//******************************************
// Author: Jakub Zaroda
// Email: jakub.zaroda@outlook.com
//******************************************

module GiftDecKeyschReg (
    input wire inClk,
    input wire inExtWr,
    input wire [127:0] inExtData,
    input wire inIntWr,
    input wire [127:0] inIntData,
    input wire [5:0] inIntRoundConst,
    output wire [127:0] outIntData,
    output wire [5:0] outIntRoundConst,
    output wire [135:0] outExtDataToMem
);

reg [127:0] regData = 128'b0;
reg [5:0] regRoundConst = 6'b0;

always @(posedge(inClk)) begin
    if(inExtWr ==1'b1) begin
        regData <= inExtData;
		regRoundConst <= 6'd1; 
    end

    if (inIntWr == 1'b1) begin
        regData <= inIntData;
		regRoundConst <= inIntRoundConst;
    end
end

assign outIntData = regData;
assign outIntRoundConst = regRoundConst;
assign outExtDataToMem = {regData, 2'b0,regRoundConst};


endmodule