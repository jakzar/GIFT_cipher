//******************************************
// Author: Jakub Zaroda
// Email: jakub.zaroda@outlook.com
//******************************************

module GiftDataOutReg(
    input wire inClk,
    input wire inWr,
    input wire [127:0] inData,
    output wire [127:0] outData
);

reg [127:0] regData = 128'b0;

always @(posedge(inClk)) begin
    if(inWr==1'b1) begin
        regData <= inData;
    end
end

assign outData = regData;


endmodule