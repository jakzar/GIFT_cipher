//******************************************
// Author: Jakub Zaroda
// Email: jakub.zaroda@outlook.com
//******************************************

module GiftInvSubBytesFun(
    input wire [127:0] inData,
    output wire [127:0] outData
);

GiftInvSboxFun instGiftInvSboxFun0  (.inData(inData[127:124]), .outData(outData[127:124]));
GiftInvSboxFun instGiftInvSboxFun1  (.inData(inData[123:120]), .outData(outData[123:120]));
GiftInvSboxFun instGiftInvSboxFun2  (.inData(inData[119:116]), .outData(outData[119:116]));
GiftInvSboxFun instGiftInvSboxFun3  (.inData(inData[115:112]), .outData(outData[115:112]));
GiftInvSboxFun instGiftInvSboxFun4  (.inData(inData[111:108]), .outData(outData[111:108]));
GiftInvSboxFun instGiftInvSboxFun5  (.inData(inData[107:104]), .outData(outData[107:104]));
GiftInvSboxFun instGiftInvSboxFun6  (.inData(inData[103:100]), .outData(outData[103:100]));
GiftInvSboxFun instGiftInvSboxFun7  (.inData(inData[ 99: 96]), .outData(outData[ 99: 96]));
GiftInvSboxFun instGiftInvSboxFun8  (.inData(inData[ 95: 92]), .outData(outData[ 95: 92]));
GiftInvSboxFun instGiftInvSboxFun9  (.inData(inData[ 91: 88]), .outData(outData[ 91: 88]));
GiftInvSboxFun instGiftInvSboxFun10 (.inData(inData[ 87: 84]), .outData(outData[ 87: 84]));
GiftInvSboxFun instGiftInvSboxFun11 (.inData(inData[ 83: 80]), .outData(outData[ 83: 80]));
GiftInvSboxFun instGiftInvSboxFun12 (.inData(inData[ 79: 76]), .outData(outData[ 79: 76]));
GiftInvSboxFun instGiftInvSboxFun13 (.inData(inData[ 75: 72]), .outData(outData[ 75: 72]));
GiftInvSboxFun instGiftInvSboxFun14 (.inData(inData[ 71: 68]), .outData(outData[ 71: 68]));
GiftInvSboxFun instGiftInvSboxFun15 (.inData(inData[ 67: 64]), .outData(outData[ 67: 64]));
GiftInvSboxFun instGiftInvSboxFun16 (.inData(inData[ 63: 60]), .outData(outData[ 63: 60]));
GiftInvSboxFun instGiftInvSboxFun17 (.inData(inData[ 59: 56]), .outData(outData[ 59: 56]));
GiftInvSboxFun instGiftInvSboxFun18 (.inData(inData[ 55: 52]), .outData(outData[ 55: 52]));
GiftInvSboxFun instGiftInvSboxFun19 (.inData(inData[ 51: 48]), .outData(outData[ 51: 48]));
GiftInvSboxFun instGiftInvSboxFun20 (.inData(inData[ 47: 44]), .outData(outData[ 47: 44]));
GiftInvSboxFun instGiftInvSboxFun21 (.inData(inData[ 43: 40]), .outData(outData[ 43: 40]));
GiftInvSboxFun instGiftInvSboxFun22 (.inData(inData[ 39: 36]), .outData(outData[ 39: 36]));
GiftInvSboxFun instGiftInvSboxFun23 (.inData(inData[ 35: 32]), .outData(outData[ 35: 32]));
GiftInvSboxFun instGiftInvSboxFun24 (.inData(inData[ 31: 28]), .outData(outData[ 31: 28]));
GiftInvSboxFun instGiftInvSboxFun25 (.inData(inData[ 27: 24]), .outData(outData[ 27: 24]));
GiftInvSboxFun instGiftInvSboxFun26 (.inData(inData[ 23: 20]), .outData(outData[ 23: 20]));
GiftInvSboxFun instGiftInvSboxFun27 (.inData(inData[ 19: 16]), .outData(outData[ 19: 16]));
GiftInvSboxFun instGiftInvSboxFun28 (.inData(inData[ 15: 12]), .outData(outData[ 15: 12]));
GiftInvSboxFun instGiftInvSboxFun29 (.inData(inData[ 11:  8]), .outData(outData[ 11:  8]));
GiftInvSboxFun instGiftInvSboxFun30 (.inData(inData[  7:  4]), .outData(outData[  7:  4]));
GiftInvSboxFun instGiftInvSboxFun31 (.inData(inData[  3:  0]), .outData(outData[  3:  0]));

endmodule