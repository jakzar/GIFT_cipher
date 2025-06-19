//******************************************
// Author: Jakub Zaroda
// Email: jakub.zaroda@outlook.com
//******************************************

module GiftEnc(
    input wire inClk,
    input wire inKeyWr,
    input wire [127:0] inKeyData,
    input wire inDataWr,
    input wire [127:0] inDataData,
    output wire [127:0] outData,
    output wire outBusy
);



wire 			wireGiftControloutIntKeyschRegExtWr;
wire 			wireGiftControloutIntKeyschRegIntWr;
wire 			wireGiftControloutIntRoundRegExtWr;
wire 			wireGiftControloutIntRoundRegIntWr;
wire 			wireGiftControloutIntDataOutRegWr;

wire [127:0]    wireGiftRoundFunoutData;
wire [127:0]    wireGiftRoundRegoutData;
wire [127:0]    wireGiftKeyschRegoutExtData;
wire [127:0]    wireGiftKeyschFunoutData;
wire [5:0]    	wireGiftKeyschFunoutRoundConst;
wire [127:0]    wireGiftKeyschRegoutIntData;
wire [5:0]    	wireGiftKeyschRegoutIntRoundConst;
wire [5:0]      wireGiftKeyschRegoutExtRoundConst;

GiftControl instGiftControl(
                .inClk(inClk),
                .inExtKeyWr(inKeyWr),
                .inExtDataWr(inDataWr),
                .outIntKeyschRegExtWr(wireGiftControloutIntKeyschRegExtWr),
                .outIntKeyschRegIntWr(wireGiftControloutIntKeyschRegIntWr),
				.outIntRoundRegExtWr(wireGiftControloutIntRoundRegExtWr),
                .outIntRoundRegIntWr(wireGiftControloutIntRoundRegIntWr),
                .outIntDataOutRegWr(wireGiftControloutIntDataOutRegWr),
                .outBusy(outBusy));

GiftKeyschFun instGiftKeyschFun(
				.inData(wireGiftKeyschRegoutIntData),
				.outData(wireGiftKeyschFunoutData));

GiftConstFun instGiftConstFun(
                .inData(wireGiftKeyschRegoutIntRoundConst),
				.outData(wireGiftKeyschFunoutRoundConst));


GiftKeyschReg instGiftKeyschReg(
                .inClk(inClk),
                .inExtWr(wireGiftControloutIntKeyschRegExtWr),
                .inExtData(inKeyData),
                .inIntWr(wireGiftControloutIntKeyschRegIntWr),
                .inIntData(wireGiftKeyschFunoutData),
                .inIntRoundConst(wireGiftKeyschFunoutRoundConst),
                .outIntData(wireGiftKeyschRegoutIntData),
                .outIntRoundConst(wireGiftKeyschRegoutIntRoundConst),
                .outExtRoundConst(wireGiftKeyschRegoutExtRoundConst),
				.outExtData(wireGiftKeyschRegoutExtData));

GiftRoundFun instGiftRoundFun(
                .inData(wireGiftRoundRegoutData),
                .inKey(wireGiftKeyschRegoutExtData),
                .inConstant(wireGiftKeyschRegoutExtRoundConst),
                .outData(wireGiftRoundFunoutData));

GiftRoundReg instGiftRoundReg(
                .inClk(inClk),
                .inExtWr(wireGiftControloutIntRoundRegExtWr),
                .inExtData(inDataData),
                .inIntWr(wireGiftControloutIntRoundRegIntWr),
                .inIntData(wireGiftRoundFunoutData),
                .outData(wireGiftRoundRegoutData));


GiftDataOutReg instGiftDataOutReg (
                .inClk(inClk),
                .inWr(wireGiftControloutIntDataOutRegWr),
                .inData(wireGiftRoundFunoutData),
                .outData(outData));


endmodule