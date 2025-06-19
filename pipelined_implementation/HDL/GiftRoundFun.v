//******************************************
// Author: Jakub Zaroda
// Email: jakub.zaroda@outlook.com
//******************************************

module GiftRoundFun(
    input wire [127:0] inData,
    input wire [127:0] inKey,
    input wire [5:0]   inConstant,
    output wire [127:0] outData
);

wire [127:0] wireOutSubBytes;
wire [127:0] wireOutPemutation;

GiftSubBytesFun instGiftSubBytesFun (.inData(inData), .outData(wireOutSubBytes));
GiftPermutationFun instGiftPermutationFun (.inData(wireOutSubBytes), .outData(wireOutPemutation));
GiftAddRounkKeyFun instGiftAddRounkKeyFun (.inData(wireOutPemutation), .inKey(inKey), .inConstant(inConstant), .outData(outData));

endmodule