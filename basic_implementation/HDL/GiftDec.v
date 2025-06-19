//******************************************
// Author: Jakub Zaroda
// Email: jakub.zaroda@outlook.com
//******************************************

module GiftDec(
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

wire [135:0]    wireGiftMemIntData;
wire [135:0]    wireGiftMemExtData;
wire            wireGiftControloutIntMemWr;
wire            wireGiftControloutIntMemRd;
wire [7:0]      wireGiftControloutIntMemAddr;

GiftDecControl instGiftDecControl(
                .inClk(inClk),
                .inExtKeyWr(inKeyWr),
                .inExtDataWr(inDataWr),
                .outIntKeyschRegExtWr(wireGiftControloutIntKeyschRegExtWr),
                .outIntKeyschRegIntWr(wireGiftControloutIntKeyschRegIntWr),
				.outIntRoundRegExtWr(wireGiftControloutIntRoundRegExtWr),
                .outIntRoundRegIntWr(wireGiftControloutIntRoundRegIntWr),
                .outIntDataOutRegWr(wireGiftControloutIntDataOutRegWr),
                .outIntMemWr(wireGiftControloutIntMemWr),
                .outIntMemAddr(wireGiftControloutIntMemAddr),
                .outIntMemRd(wireGiftControloutIntMemRd),
                .outBusy(outBusy));

GiftSinglePortMem instGiftSinglePortMem(
                .inClk(inClk),
                .inAWr(wireGiftControloutIntMemWr),
                .inARd(wireGiftControloutIntMemRd),
                .inAAddr(wireGiftControloutIntMemAddr),
                .inAData(wireGiftMemIntData),
                .outAData(wireGiftMemExtData));


GiftKeyschFun instGiftKeyschFun(
				.inData(wireGiftKeyschRegoutIntData),
				.outData(wireGiftKeyschFunoutData));

GiftConstFun instGiftConstFun(
                .inData(wireGiftKeyschRegoutIntRoundConst),
				.outData(wireGiftKeyschFunoutRoundConst));


GiftDecKeyschReg instGiftDecKeyschReg(
                .inClk(inClk),
                .inExtWr(wireGiftControloutIntKeyschRegExtWr),
                .inExtData(inKeyData),
                .inIntWr(wireGiftControloutIntKeyschRegIntWr),
                .inIntData(wireGiftKeyschFunoutData),
                .inIntRoundConst(wireGiftKeyschFunoutRoundConst),
                .outIntData(wireGiftKeyschRegoutIntData),
                .outIntRoundConst(wireGiftKeyschRegoutIntRoundConst),
				.outExtDataToMem(wireGiftMemIntData));

GiftInvRoundFun instGiftInvRoundFun(
                .inData(wireGiftRoundRegoutData),
                .inKey(wireGiftMemExtData),
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