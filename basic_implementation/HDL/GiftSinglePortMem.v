//******************************************
// Author: Jakub Zaroda
// Email: jakub.zaroda@outlook.com
//******************************************

module GiftSinglePortMem(
    input	wire			inClk,
	input	wire			inAWr,
	input	wire			inARd,
    input	wire	[7:0]	inAAddr,
	input	wire	[135:0]	inAData,
    output	wire	[135:0]	outAData
);


reg	[135:0]	memMemory	[0:39];

reg [135:0]  regOutAData = 136'b0;

always @ (posedge(inClk))
begin
    if (inAWr == 1'b1) begin
        memMemory[inAAddr] <= inAData;
    end
end

always @ (posedge(inClk))
begin
    if (inARd == 1'b1) begin
        regOutAData <= memMemory[inAAddr];
    end else begin
        regOutAData <= 136'bz;
    end
end

assign outAData = regOutAData;

endmodule