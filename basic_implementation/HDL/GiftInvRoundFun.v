//******************************************
// Author: Jakub Zaroda
// Email: jakub.zaroda@outlook.com
//******************************************

module GiftInvRoundFun(
    input wire [127:0] inData,
    input wire [135:0] inKey,
    output wire [127:0] outData
);

wire [127:0] wireOutKeyXor;
wire [127:0] wireOutPermutation;

GiftAddRounkKeyFun instGiftAddRounkKeyFun (.inData(inData), .inKey(inKey[135:8]), .inConstant(inKey[5:0]), .outData(wireOutKeyXor));
GiftInvPermutationFun instGiftInvPermutationFun (.inData(wireOutKeyXor), .outData(wireOutPermutation));
GiftInvSubBytesFun instGiftInvSubBytesFun (.inData(wireOutPermutation), .outData(outData));

endmodule