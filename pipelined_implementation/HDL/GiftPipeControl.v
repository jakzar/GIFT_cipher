//******************************************
// Author: Jakub Zaroda
// Email: jakub.zaroda@outlook.com
//******************************************

module GiftPipeControl(
    input wire inClk,
    input wire inExtKeyWr,
    input wire inExtDataWr,
    output wire outIntKeyschRegExtWr,
    output wire outIntRoundRegExtWr,
    output wire outIntDataOutRegWr,
    output wire outValidData    
);

reg [7:0] regCounter = 8'b0;

reg [41:0] regShift = 42'b0;

always @ (posedge(inClk))
begin
    regShift <= {regShift[40:0], inExtKeyWr};
end

assign outIntKeyschRegExtWr = inExtKeyWr; 
assign outIntRoundRegExtWr = inExtDataWr;
assign outIntDataOutRegWr = (regShift[40] == 1'b1) ? 1'b1 : 1'b0;


assign outValidData = (regShift[41] == 1'b1) ? 1'b1 : 1'b0;

endmodule