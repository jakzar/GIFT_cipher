//******************************************
// Author: Jakub Zaroda
// Email: jakub.zaroda@outlook.com
//******************************************

module GiftSboxFun(
    input wire [3:0] inData,
    output wire [3:0] outData
);

assign outData = (inData == 4'h0) ? 4'h1 :
                 (inData == 4'h1) ? 4'hA :
                 (inData == 4'h2) ? 4'h4 :
                 (inData == 4'h3) ? 4'hC :
                 (inData == 4'h4) ? 4'h6 :
                 (inData == 4'h5) ? 4'hF :
                 (inData == 4'h6) ? 4'h3 :
                 (inData == 4'h7) ? 4'h9 :
                 (inData == 4'h8) ? 4'h2 :
                 (inData == 4'h9) ? 4'hD :
                 (inData == 4'hA) ? 4'hB :
                 (inData == 4'hB) ? 4'h7 :
                 (inData == 4'hC) ? 4'h5 :
                 (inData == 4'hD) ? 4'h0 :
                 (inData == 4'hE) ? 4'h8 : 4'hE;

endmodule