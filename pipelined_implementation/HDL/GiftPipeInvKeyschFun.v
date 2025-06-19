//******************************************
// Author: Jakub Zaroda
// Email: jakub.zaroda@outlook.com
//******************************************

module GiftPipeInvKeyschFun (
    input wire [127:0] inData,
    output wire [127:0] outData
);

assign outData [15:0] = {inData[99:96], inData[111:100]};
assign outData [31:16] = {inData[125:112], inData[127:126]};
assign outData [127:32] = inData[95:0];

endmodule