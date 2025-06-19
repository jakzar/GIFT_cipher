//******************************************
// Author: Jakub Zaroda
// Email: jakub.zaroda@outlook.com
//******************************************

module GiftFullInvRoundFun(
    input wire [127:0] inData,
    input wire [127:0] inKey,
    input wire [5:0] inConstant,
    output wire [127:0] outData
);

wire [127:0] wireOutKeyXor;
wire [127:0] wireOutPermutation;

GiftAddRounkKeyFun instGiftAddRounkKeyFun (.inData(inData), .inKey(inKey), .inConstant(inConstant), .outData(wireOutKeyXor));
GiftInvPermutationFun instGiftInvPermutationFun (.inData(wireOutKeyXor), .outData(wireOutPermutation));
GiftInvSubBytesFun instGiftInvSubBytesFun (.inData(wireOutPermutation), .outData(outData));

endmodule