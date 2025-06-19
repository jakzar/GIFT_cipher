//******************************************
// Author: Jakub Zaroda
// Email: jakub.zaroda@outlook.com
//******************************************

module TbGiftPipeEnc;

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
wire				outValidData;


GiftPipeEnc instGiftEnc(
    .inClk(inClk),
    .inKeyWr(inKeyWr),
    .inKeyData(inKeyData),
    .inDataWr(inDataWr),
    .inDataData(inDataData),
    .outData(outData),
    .outValidData(outValidData));



always
begin
    #(inClkp);
    inKeyWr 	<= 1'b1;
    inDataWr 	<= 1'b1;
    inDataData  <= 128'h0;
    inKeyData   <= 128'h0;
    #(inClkp);
    $display("Dane podane w takce nr 1");
    $display("Klucz glowny = %h", inKeyData);
    $display("Tekst jawny = %h", inDataData);
    inKeyWr 	<= 1'b0;
    inDataWr 	<= 1'b0;
    inDataData  <= 128'b0;
    inKeyData   <= 128'b0;
    #(inClkp);
    $display("Dane podane w takce nr 2");
    $display("BRAK WPROWADZANYCH DANCYH inKeyWr = 0");
    $display("BRAK WPROWADZANYCH DANCYH inDataWr = 0");
    inKeyWr 	<= 1'b1;
    inDataWr 	<= 1'b1;
    inDataData  <= 128'hfedcba9876543210fedcba9876543210;
    inKeyData   <= 128'hfedcba9876543210fedcba9876543210;
    #(inClkp);
    $display("Dane podane w takce nr 3");
    $display("Klucz glowny = %h", inKeyData);
    $display("Tekst jawny = %h", inDataData);
    inKeyWr 	<= 1'b0;
    inDataWr 	<= 1'b0;
    inDataData  <= 128'b0;
    inKeyData   <= 128'b0;
    #(inClkp);
	wait(outValidData == 1'b1 && inClk == 1'b0);
    $display("Otrzymany szyfrogram  w takcie 40+1= %h", outData);
    $display("Sygnal istotnosci danych w takcie 40+1= %h", outValidData);
    #(inClkp);
    $display("Otrzymany szyfrogram  w takcie 40+2= %h", outData);
    $display("Sygnal istotnosci danych w takcie 40+2= %h", outValidData);
    #(inClkp);
    $display("Otrzymany szyfrogram  w takcie 40+3= %h", outData);
    $display("Sygnal istotnosci danych w takcie 40+3= %h", outValidData);
    #(inClkp);
    #(inClkp);
    #(inClkp);
    #(inClkp);
    #(inClkp);
    #(inClkp);
    #(inClkp);
    #(inClkp);
    #(inClkp);
    #(inClkp);
    #(inClkp);
    #(inClkp);
    #(inClkp);

    $stop;
end
endmodule