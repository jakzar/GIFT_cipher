//******************************************
// Author: Jakub Zaroda
// Email: jakub.zaroda@outlook.com
//******************************************

module GiftConstFun (
    input wire [5:0] inData,
    output wire [5:0] outData
);

assign outData = {inData[4:0], inData[5]^inData[4] ^ 1'b1};
 
endmodule