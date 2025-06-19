//******************************************
// Author: Jakub Zaroda
// Email: jakub.zaroda@outlook.com
//******************************************

module GiftRoundReg(
    input wire inClk,
    input wire inExtWr,
    input wire [127:0] inExtData,
    input wire inIntWr,
    input wire [127:0] inIntData,
    output wire [127:0] outData
);

reg [127:0] regData = 128'b0;

always @ (posedge(inClk))
begin
    if(inExtWr == 1'b1) begin
        regData <= inExtData;
    end

    if(inIntWr == 1'b1) begin
        regData <= inIntData;
    end
end

assign outData = regData;


endmodule