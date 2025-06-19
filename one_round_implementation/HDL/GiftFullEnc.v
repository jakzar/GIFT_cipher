//******************************************
// Author: Jakub Zaroda
// Email: jakub.zaroda@outlook.com
//******************************************

module GiftFullEnc(
    input wire inClk,
    input wire inKeyWr,
    input wire [127:0] inKeyData,
    input wire inDataWr,
    input wire [127:0] inDataData,
    output wire [127:0] outData,
    output wire outBusy
);



wire 			wireGiftControloutIntKeyschRegExtWr;
wire 			wireGiftControloutIntRoundRegExtWr;
wire 			wireGiftControloutIntDataOutRegWr;

wire [127:0]    wireGiftRoundFunoutData;
wire [127:0]    wireGiftRoundRegoutData;
wire [127:0]    wireGiftKeyschRegoutExtData;
wire [5:0]      wireGiftKeyschRegoutExtRoundConst;

GiftFullControl instGiftFullControl(
                .inClk(inClk),
                .inExtKeyWr(inKeyWr),
                .inExtDataWr(inDataWr),
                .outIntKeyschRegExtWr(wireGiftControloutIntKeyschRegExtWr),
				.outIntRoundRegExtWr(wireGiftControloutIntRoundRegExtWr),
                .outIntDataOutRegWr(wireGiftControloutIntDataOutRegWr),
                .outBusy(outBusy));


GiftFullKeyschReg instGiftFullKeyschReg(
                .inClk(inClk),
                .inExtWr(wireGiftControloutIntKeyschRegExtWr),
                .inExtData(inKeyData),
                .outExtRoundConst(wireGiftKeyschRegoutExtRoundConst),
				.outExtData(wireGiftKeyschRegoutExtData));

GiftFullRoundFun instGiftFullRoundFun(
                .inData(wireGiftRoundRegoutData),
                .inKey(wireGiftKeyschRegoutExtData),
                .inConstant(wireGiftKeyschRegoutExtRoundConst),
                .outData(wireGiftRoundFunoutData));

GiftFullRoundReg instGiftFullRoundReg(
                .inClk(inClk),
                .inExtWr(wireGiftControloutIntRoundRegExtWr),
                .inExtData(inDataData),
                .outData(wireGiftRoundRegoutData));


GiftDataOutReg instGiftDataOutReg (
                .inClk(inClk),
                .inWr(wireGiftControloutIntDataOutRegWr),
                .inData(wireGiftRoundFunoutData),
                .outData(outData));


endmodule