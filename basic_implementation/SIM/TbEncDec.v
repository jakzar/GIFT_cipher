//******************************************
// Author: Jakub Zaroda
// Email: jakub.zaroda@outlook.com
//******************************************

module TbEncDec;

parameter inClkp = 10;
reg inClk = 1'b0;

always
begin
    #(inClkp/2) inClk = !inClk;
end

reg					inKeyWr		= 1'b0;
reg		[127:0]		inKeyData	= 128'b0;
reg					inDataWr	= 1'b0;
reg		[127:0]		inDataData  = 128'b0;
wire 	[127:0]		outData;
wire				outBusy;

reg					inKeyWr2		= 1'b0;
reg					inDataWr2	= 1'b0;
reg		[127:0]		inDataData2  = 128'b0;
wire 	[127:0]		outData2;
wire				outBusy2;


GiftEnc instGiftEnc(
    .inClk(inClk),
    .inKeyWr(inKeyWr),
    .inKeyData(inKeyData),
    .inDataWr(inDataWr),
    .inDataData(inDataData),
    .outData(outData),
    .outBusy(outBusy));

GiftDec instGiftDec(
    .inClk(inClk),
    .inKeyWr(inKeyWr2),
    .inKeyData(inKeyData),
    .inDataWr(inDataWr2),
    .inDataData(inDataData2),
    .outData(outData2),
    .outBusy(outBusy2));



always
begin
    #(inClkp);
    inKeyWr 	<= 1'b1;
    inDataWr 	<= 1'b1;
    inDataData  <= 128'h0;
    inKeyData   <= 128'h0;
    #(inClkp);
    $display("Test nr 1");
    $display("Klucz glowny = %h", inKeyData);
    $display("Tekst jawny = %h", inDataData);
    inKeyWr 	<= 1'b0;
    inDataWr 	<= 1'b0;
    inDataData  <= 128'b0;
    inKeyData   <= 128'b0;
	wait(outBusy == 1'b0 && inClk == 1'b0);
    $display("Otrzymany szyfrogram = %h", outData);
    #(inClkp);
    inKeyWr2 	<= 1'b1;
    inDataWr2 	<= 1'b1;
    inDataData2  <= outData;
    inKeyData   <= 128'h0;
    #(inClkp);
    inKeyWr2 	<= 1'b0;
    inDataWr2 	<= 1'b0;
    inDataData2  <= 128'b0;
    inKeyData   <= 128'b0;
	wait(outBusy2 == 1'b0 && inClk == 1'b0);
    $display("Odtworzony tekst jawny = %h", outData2);
    #(inClkp);


    #(inClkp);
    inKeyWr 	<= 1'b1;
    inDataWr 	<= 1'b1;
    inDataData  <= 128'hfedcba9876543210fedcba9876543210;
    inKeyData   <= 128'hfedcba9876543210fedcba9876543210;
    #(inClkp);
    $display("Test nr 2");
    $display("Klucz glowny = %h", inKeyData);
    $display("Tekst jawny = %h", inDataData);
    inKeyWr 	<= 1'b0;
    inDataWr 	<= 1'b0;
    inDataData  <= 128'b0;
    inKeyData   <= 128'b0;
	wait(outBusy == 1'b0 && inClk == 1'b0);
    $display("Otrzymany szyfrogram = %h", outData);
    #(inClkp);
    inKeyWr2 	<= 1'b1;
    inDataWr2 	<= 1'b1;
    inDataData2  <= outData;
    inKeyData   <= 128'hfedcba9876543210fedcba9876543210;
    #(inClkp);
    inKeyWr2 	<= 1'b0;
    inDataWr2 	<= 1'b0;
    inDataData2  <= 128'b0;
    inKeyData   <= 128'b0;
	wait(outBusy2 == 1'b0 && inClk == 1'b0);
    $display("Odtworzony tekst jawny = %h", outData2);
    #(inClkp);
    #(inClkp);
    $stop;
end
endmodule