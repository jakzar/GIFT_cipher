//******************************************
// Author: Jakub Zaroda
// Email: jakub.zaroda@outlook.com
//******************************************

module GiftKeyschFun (
    input wire [127:0] inData,
    output wire [127:0] outData
);

assign outData [127:112] = {inData[17:16], inData[31:18]};
assign outData [111:96] = {inData[11:0], inData[15:12]};
assign outData [95:0] = inData[127:32];
 

endmodule