//******************************************
// Author: Jakub Zaroda
// Email: jakub.zaroda@outlook.com
//******************************************

module GiftDecControl(
    input wire inClk,
    input wire inExtKeyWr,
    input wire inExtDataWr,
    output wire outIntKeyschRegExtWr,
    output wire outIntKeyschRegIntWr,
    output wire outIntRoundRegExtWr,
    output wire outIntRoundRegIntWr,
    output wire outIntDataOutRegWr,
    output wire outIntMemWr,
    output wire [7:0] outIntMemAddr,
    output wire outIntMemRd,
    output wire outBusy    
);


reg regKeyschRegExtWr = 1'b0;
reg regRoundRegExtWr = 1'b0;

reg regKeyschRegIntWr = 1'b0;
reg regIntMemWr = 1'b0;
reg regIntMemRd = 1'b0;

reg regRoundRegIntWr = 1'b0;

reg [7:0] regIntMemAddr = 8'b0;

reg [7:0] regCounter = 8'b0;
reg [7:0] regCounterRounds = 8'b0;
reg [7:0]   regMainFsm = 8'd0;

reg regBusy = 1'b0;

always @ (posedge(inClk))
begin
    case(regMainFsm)
        8'd0:   begin
                    if(inExtDataWr == 1'b1) begin
                        regMainFsm <= regMainFsm + 8'd1;
                        regCounter <= 8'b0;
                        regBusy <= 1'b1;
                    end
                end

        8'd1:   begin
                    regKeyschRegIntWr <= 1'b1;
                    regIntMemWr <= 1'b1;
                    regMainFsm <= regMainFsm + 8'd1;
                    regCounter <= 8'b1;
                    regIntMemAddr <= 8'd0;
                end

        8'd2:   begin
                    if(regCounter != 8'd40) begin
                        regKeyschRegIntWr <= 1'b1;  
                        regIntMemWr <= 1'b1;
                        regIntMemAddr <= regCounter;
                        regCounter <= regCounter + 8'd1;
                    end else begin
                        regKeyschRegIntWr <= 1'b0;  
                        regIntMemWr <= 1'b0;
                        regIntMemAddr <= 8'b0;
                        regCounter <= 8'b0;
                        regMainFsm <= 8'd3;
                    end
                end

        8'd3:   begin
                    regCounterRounds <= 8'd39;
                    regIntMemRd <= 1'b1;
                    regIntMemAddr <= 8'd39;
                    regMainFsm <= 8'd4;
                end


        8'd4:   begin
                    if(regCounterRounds != 8'd0) begin
                        regRoundRegIntWr <= 1'b1;  
                        regIntMemRd <= 1'b1;
                        regIntMemAddr <= (regCounterRounds-1'd1);
                        regCounterRounds <= regCounterRounds - 8'd1;
                    end else begin
                        regRoundRegIntWr <= 1'b0;  
                        regIntMemRd <= 1'b0;
                        regIntMemAddr <= 8'b0;
                        regCounterRounds <= 8'b0;
                        regMainFsm <= 8'd5;
                    end
                end

        8'd5:   begin
                    regMainFsm <= 8'd0;
                    regBusy <= 1'b0;
                end


    endcase
end
assign outIntKeyschRegExtWr = (regMainFsm==8'd0) ? inExtKeyWr : 1'b0; 
assign outIntRoundRegExtWr = (regMainFsm==8'd0) ? inExtDataWr : 1'b0; 

assign outIntKeyschRegIntWr = regKeyschRegIntWr;
assign outIntMemWr = regIntMemWr;
assign outIntMemRd = regIntMemRd;
assign outIntMemAddr = regIntMemAddr;
assign outIntRoundRegIntWr = regRoundRegIntWr;

assign outIntDataOutRegWr = (regMainFsm == 8'd5) ? 1'b1 : 1'b0;

assign outBusy = regBusy;

endmodule