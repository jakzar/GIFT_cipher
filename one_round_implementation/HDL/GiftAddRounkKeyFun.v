//******************************************
// Author: Jakub Zaroda
// Email: jakub.zaroda@outlook.com
//******************************************

module GiftAddRounkKeyFun(
    input wire [127:0] inData,
    input wire [127:0] inKey,
    input wire [5:0] inConstant,
    output wire [127:0] outData
);

wire [31:0] wireU;
wire [31:0] wireV;

wire [127:0] wireTempState;

assign wireU = inKey[95:64];
assign wireV = inKey[31:0];


assign wireTempState[0] = 	inData[0];
assign wireTempState[1] = 	inData[1] ^ wireV[0];
assign wireTempState[2] = 	inData[2] ^ wireU[0];
assign wireTempState[3] = 	inData[3];
assign wireTempState[4] = 	inData[4];
assign wireTempState[5] = 	inData[5] ^ wireV[1];
assign wireTempState[6] = 	inData[6] ^ wireU[1];
assign wireTempState[7] = 	inData[7];
assign wireTempState[8] = 	inData[8];
assign wireTempState[9] = 	inData[9] ^ wireV[2];
assign wireTempState[10] = 	inData[10] ^ wireU[2];
assign wireTempState[11] = 	inData[11];
assign wireTempState[12] = 	inData[12];
assign wireTempState[13] = 	inData[13] ^ wireV[3];
assign wireTempState[14] = 	inData[14] ^ wireU[3];
assign wireTempState[15] = 	inData[15];
assign wireTempState[16] = 	inData[16];
assign wireTempState[17] = 	inData[17] ^ wireV[4];
assign wireTempState[18] = 	inData[18] ^ wireU[4];
assign wireTempState[19] = 	inData[19];
assign wireTempState[20] = 	inData[20];
assign wireTempState[21] = 	inData[21] ^ wireV[5];
assign wireTempState[22] = 	inData[22] ^ wireU[5];
assign wireTempState[23] = 	inData[23];
assign wireTempState[24] = 	inData[24];
assign wireTempState[25] = 	inData[25] ^ wireV[6];
assign wireTempState[26] = 	inData[26] ^ wireU[6];
assign wireTempState[27] = 	inData[27];
assign wireTempState[28] = 	inData[28];
assign wireTempState[29] = 	inData[29] ^ wireV[7];
assign wireTempState[30] = 	inData[30] ^ wireU[7];
assign wireTempState[31] = 	inData[31];
assign wireTempState[32] = 	inData[32];
assign wireTempState[33] = 	inData[33] ^ wireV[8];
assign wireTempState[34] = 	inData[34] ^ wireU[8];
assign wireTempState[35] = 	inData[35];
assign wireTempState[36] = 	inData[36];
assign wireTempState[37] = 	inData[37] ^ wireV[9];
assign wireTempState[38] = 	inData[38] ^ wireU[9];
assign wireTempState[39] = 	inData[39];
assign wireTempState[40] = 	inData[40];
assign wireTempState[41] = 	inData[41] ^ wireV[10];
assign wireTempState[42] = 	inData[42] ^ wireU[10];
assign wireTempState[43] = 	inData[43];
assign wireTempState[44] = 	inData[44];
assign wireTempState[45] = 	inData[45] ^ wireV[11];
assign wireTempState[46] = 	inData[46] ^ wireU[11];
assign wireTempState[47] = 	inData[47];
assign wireTempState[48] = 	inData[48];
assign wireTempState[49] = 	inData[49] ^ wireV[12];
assign wireTempState[50] = 	inData[50] ^ wireU[12];
assign wireTempState[51] = 	inData[51];
assign wireTempState[52] = 	inData[52];
assign wireTempState[53] = 	inData[53] ^ wireV[13];
assign wireTempState[54] = 	inData[54] ^ wireU[13];
assign wireTempState[55] = 	inData[55];
assign wireTempState[56] = 	inData[56];
assign wireTempState[57] = 	inData[57] ^ wireV[14];
assign wireTempState[58] = 	inData[58] ^ wireU[14];
assign wireTempState[59] = 	inData[59];
assign wireTempState[60] = 	inData[60];
assign wireTempState[61] = 	inData[61] ^ wireV[15];
assign wireTempState[62] = 	inData[62] ^ wireU[15];
assign wireTempState[63] = 	inData[63];
assign wireTempState[64] = 	inData[64];
assign wireTempState[65] = 	inData[65] ^ wireV[16];
assign wireTempState[66] = 	inData[66] ^ wireU[16];
assign wireTempState[67] = 	inData[67];
assign wireTempState[68] = 	inData[68];
assign wireTempState[69] = 	inData[69] ^ wireV[17];
assign wireTempState[70] = 	inData[70] ^ wireU[17];
assign wireTempState[71] = 	inData[71];
assign wireTempState[72] = 	inData[72];
assign wireTempState[73] = 	inData[73] ^ wireV[18];
assign wireTempState[74] = 	inData[74] ^ wireU[18];
assign wireTempState[75] = 	inData[75];
assign wireTempState[76] = 	inData[76];
assign wireTempState[77] = 	inData[77] ^ wireV[19];
assign wireTempState[78] = 	inData[78] ^ wireU[19];
assign wireTempState[79] = 	inData[79];
assign wireTempState[80] = 	inData[80];
assign wireTempState[81] = 	inData[81] ^ wireV[20];
assign wireTempState[82] = 	inData[82] ^ wireU[20];
assign wireTempState[83] = 	inData[83];
assign wireTempState[84] = 	inData[84];
assign wireTempState[85] = 	inData[85] ^ wireV[21];
assign wireTempState[86] = 	inData[86] ^ wireU[21];
assign wireTempState[87] = 	inData[87];
assign wireTempState[88] = 	inData[88];
assign wireTempState[89] = 	inData[89] ^ wireV[22];
assign wireTempState[90] = 	inData[90] ^ wireU[22];
assign wireTempState[91] = 	inData[91];
assign wireTempState[92] = 	inData[92];
assign wireTempState[93] = 	inData[93] ^ wireV[23];
assign wireTempState[94] = 	inData[94] ^ wireU[23];
assign wireTempState[95] = 	inData[95];
assign wireTempState[96] = 	inData[96];
assign wireTempState[97] = 	inData[97] ^ wireV[24];
assign wireTempState[98] = 	inData[98] ^ wireU[24];
assign wireTempState[99] = 	inData[99];
assign wireTempState[100] = 	inData[100];
assign wireTempState[101] = 	inData[101] ^ wireV[25];
assign wireTempState[102] = 	inData[102] ^ wireU[25];
assign wireTempState[103] = 	inData[103];
assign wireTempState[104] = 	inData[104];
assign wireTempState[105] = 	inData[105] ^ wireV[26];
assign wireTempState[106] = 	inData[106] ^ wireU[26];
assign wireTempState[107] = 	inData[107];
assign wireTempState[108] = 	inData[108];
assign wireTempState[109] = 	inData[109] ^ wireV[27];
assign wireTempState[110] = 	inData[110] ^ wireU[27];
assign wireTempState[111] = 	inData[111];
assign wireTempState[112] = 	inData[112];
assign wireTempState[113] = 	inData[113] ^ wireV[28];
assign wireTempState[114] = 	inData[114] ^ wireU[28];
assign wireTempState[115] = 	inData[115];
assign wireTempState[116] = 	inData[116];
assign wireTempState[117] = 	inData[117] ^ wireV[29];
assign wireTempState[118] = 	inData[118] ^ wireU[29];
assign wireTempState[119] = 	inData[119];
assign wireTempState[120] = 	inData[120];
assign wireTempState[121] = 	inData[121] ^ wireV[30];
assign wireTempState[122] = 	inData[122] ^ wireU[30];
assign wireTempState[123] = 	inData[123];
assign wireTempState[124] = 	inData[124];
assign wireTempState[125] = 	inData[125] ^ wireV[31];
assign wireTempState[126] = 	inData[126] ^ wireU[31];
assign wireTempState[127] = 	inData[127];

assign outData[127] = wireTempState[127] ^ 1'b1;
assign outData[23] = wireTempState[23] ^ inConstant[5];
assign outData[19] = wireTempState[19] ^ inConstant[4];
assign outData[15] = wireTempState[15] ^ inConstant[3];
assign outData[11] = wireTempState[11] ^ inConstant[2];
assign outData[7] = wireTempState[7] ^ inConstant[1];
assign outData[3] = wireTempState[3] ^ inConstant[0];

assign outData[2:0] = wireTempState[2:0];
assign outData[6:4] = wireTempState[6:4];
assign outData[10:8] = wireTempState[10:8];
assign outData[14:12] = wireTempState[14:12];
assign outData[18:16] = wireTempState[18:16];
assign outData[22:20] = wireTempState[22:20];
assign outData[126:24] = wireTempState[126:24];

endmodule