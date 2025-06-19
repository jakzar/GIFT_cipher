//******************************************
// Author: Jakub Zaroda
// Email: jakub.zaroda@outlook.com
//******************************************

module GiftSubBytesFun (
    input wire [127:0] inData,
    output wire [127:0] outData
);

GiftSboxFun instGiftSboxFun0  (.inData(inData[127:124]), .outData(outData[127:124]));
GiftSboxFun instGiftSboxFun1  (.inData(inData[123:120]), .outData(outData[123:120]));
GiftSboxFun instGiftSboxFun2  (.inData(inData[119:116]), .outData(outData[119:116]));
GiftSboxFun instGiftSboxFun3  (.inData(inData[115:112]), .outData(outData[115:112]));
GiftSboxFun instGiftSboxFun4  (.inData(inData[111:108]), .outData(outData[111:108]));
GiftSboxFun instGiftSboxFun5  (.inData(inData[107:104]), .outData(outData[107:104]));
GiftSboxFun instGiftSboxFun6  (.inData(inData[103:100]), .outData(outData[103:100]));
GiftSboxFun instGiftSboxFun7  (.inData(inData[ 99: 96]), .outData(outData[ 99: 96]));
GiftSboxFun instGiftSboxFun8  (.inData(inData[ 95: 92]), .outData(outData[ 95: 92]));
GiftSboxFun instGiftSboxFun9  (.inData(inData[ 91: 88]), .outData(outData[ 91: 88]));
GiftSboxFun instGiftSboxFun10 (.inData(inData[ 87: 84]), .outData(outData[ 87: 84]));
GiftSboxFun instGiftSboxFun11 (.inData(inData[ 83: 80]), .outData(outData[ 83: 80]));
GiftSboxFun instGiftSboxFun12 (.inData(inData[ 79: 76]), .outData(outData[ 79: 76]));
GiftSboxFun instGiftSboxFun13 (.inData(inData[ 75: 72]), .outData(outData[ 75: 72]));
GiftSboxFun instGiftSboxFun14 (.inData(inData[ 71: 68]), .outData(outData[ 71: 68]));
GiftSboxFun instGiftSboxFun15 (.inData(inData[ 67: 64]), .outData(outData[ 67: 64]));
GiftSboxFun instGiftSboxFun16 (.inData(inData[ 63: 60]), .outData(outData[ 63: 60]));
GiftSboxFun instGiftSboxFun17 (.inData(inData[ 59: 56]), .outData(outData[ 59: 56]));
GiftSboxFun instGiftSboxFun18 (.inData(inData[ 55: 52]), .outData(outData[ 55: 52]));
GiftSboxFun instGiftSboxFun19 (.inData(inData[ 51: 48]), .outData(outData[ 51: 48]));
GiftSboxFun instGiftSboxFun20 (.inData(inData[ 47: 44]), .outData(outData[ 47: 44]));
GiftSboxFun instGiftSboxFun21 (.inData(inData[ 43: 40]), .outData(outData[ 43: 40]));
GiftSboxFun instGiftSboxFun22 (.inData(inData[ 39: 36]), .outData(outData[ 39: 36]));
GiftSboxFun instGiftSboxFun23 (.inData(inData[ 35: 32]), .outData(outData[ 35: 32]));
GiftSboxFun instGiftSboxFun24 (.inData(inData[ 31: 28]), .outData(outData[ 31: 28]));
GiftSboxFun instGiftSboxFun25 (.inData(inData[ 27: 24]), .outData(outData[ 27: 24]));
GiftSboxFun instGiftSboxFun26 (.inData(inData[ 23: 20]), .outData(outData[ 23: 20]));
GiftSboxFun instGiftSboxFun27 (.inData(inData[ 19: 16]), .outData(outData[ 19: 16]));
GiftSboxFun instGiftSboxFun28 (.inData(inData[ 15: 12]), .outData(outData[ 15: 12]));
GiftSboxFun instGiftSboxFun29 (.inData(inData[ 11:  8]), .outData(outData[ 11:  8]));
GiftSboxFun instGiftSboxFun30 (.inData(inData[  7:  4]), .outData(outData[  7:  4]));
GiftSboxFun instGiftSboxFun31 (.inData(inData[  3:  0]), .outData(outData[  3:  0]));


endmodule