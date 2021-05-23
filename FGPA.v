// Code your design here
module logic_tile(out, clock, in1, in2, in3, in4, in5);
    input clock,in1,in2,in3,in4,in5;
    output out;
    reg [32:0]mem;
    wire [4:0]sample={in5,in4,in3,in2,in1};
    integer index;
    always@(sample)
        index=sample;
    wire d=mem[index];
    reg flip_output;

    initial flip_output=0;
    always@(posedge clock)
    begin
        assign flip_output=d;
    end
    assign out=flip_output&mem[32] | d&!mem[32];

endmodule


module switch_box_4x4(out, in);
    input [3:0]in;
    output [3:0]out;
    reg [15:0]configure;
    assign out[0] =  (configure[0]&in[0])|(configure[1]&in[1])|(configure[2]&in[2])|(configure[3]&in[3]);
    assign out[1] =  (configure[4]&in[0])|(configure[5]&in[1])|(configure[6]&in[2])|(configure[7]&in[3]);
    assign out[2] =  (configure[8]&in[0])|(configure[9]&in[1])|(configure[10]&in[2])|(configure[11]&in[3]);
    assign out[3] =  (configure[12]&in[0])|(configure[13]&in[1])|(configure[14]&in[2])|(configure[15]&in[3]);
endmodule

module FGPA(in1,in2,in3,in4,in5,in6,in7,in8,clock,ctr1,ctr2,ctr3,out,out_carry,sum_out,q,prev,si,out_mux);
        input in1,in3,in2,in4,in5,in6,in7,in8,clock,ctr1,ctr2,ctr3,si;
        output out_mux,out_carry;
  output [3:0]sum_out;
  output[3:0]out;
  input [7:0]prev;
  output [7:0]q;
  wire [23:0]outa;
  wire [23:0]sw;
  wire out1,out2,out3,out4,out5,out6;
  wire my_car;
    wire a,b,c,d,e;
    wire [3:0]outs;
    wire cout,cout1;
  logic_tile l1(outs[0],clock,in4,in8,ctr1,1'b0,1'b0);
  logic_tile l2(my_car,clock,in4,in8,ctr1,1'b1,1'b0);
  logic_tile l3(outs[1],clock,in3,in7,my_car,1'b0,1'b0);
  logic_tile l4(a,clock,in3,in7,my_car,1'b1,1'b0);
  logic_tile l5(outs[2],clock,in2,in6,a,1'b0,1'b0);
  logic_tile l6(b,clock,in2,in6,a,1'b1,1'b0);
  logic_tile l7(outs[3],clock,in1,in5,b,1'b0,1'b0);
  logic_tile l8(cout ,clock,in1,in5,b,1'b1,1'b0);
    logic_tile l9(cout1,clock,outs[1],outs[3],outs[2],outs[3],cout);
    logic_tile l10(out[0],clock,outs[0],1'b0,1'b0,1'b0,1'b0);
    logic_tile l11(c,clock,outs[0],1'b0,1'b0,1'b1,1'b0);
    logic_tile l12(out[1],clock,outs[1],cout1,c,1'b0,1'b0);
    logic_tile l13(d,clock,outs[1],cout1,c,1'b1,1'b0);
    logic_tile l14(out[2],clock,outs[2],cout1,d,1'b0,1'b0);
    logic_tile l15(e,clock,outs[2],cout1,d,1'b1,1'b0);
    logic_tile l16(out[3],clock,outs[3],1'b0,e,1'b0,1'b0);
  logic_tile l17(out_carry ,clock,cout1,1'b0,1'b0,1'b0,1'b0);
        logic_tile l18(out1,clock,ctr3,ctr2,ctr1,in2,in1);
    logic_tile l19(out2,clock,ctr3,ctr2,ctr1,in4,in3);
    logic_tile l20(out3,clock,ctr3,ctr2,ctr1,in6,in5);
    logic_tile l21(out4,clock,ctr3,ctr2,ctr1,in8,in7);
    logic_tile l22(out5,clock,ctr2,ctr1,ctr3,out2,out1);
    logic_tile l23(out6,clock,ctr2,ctr1,ctr3,out4,out3);
  logic_tile l24(out_mux,clock,ctr1,ctr2,ctr3,out6,out5);
  logic_tile l25(outa[0],clock,ctr3,ctr2,ctr1,prev[6],si);
  logic_tile l26(outa[1],clock,ctr3,ctr2,ctr1,in1,prev[7]);
    logic_tile l27(q[7],clock,ctr2,ctr3,ctr1,outa[0],outa[1]);
    logic_tile l28(outa[2],clock,ctr3,ctr2,ctr1,prev[5],prev[7]);
  logic_tile l29(outa[3],clock,ctr3,ctr2,ctr1,in2,prev[6]);
    logic_tile l30(q[6],clock,ctr2,ctr3,ctr1,outa[2],outa[3]);
    logic_tile l31(outa[4],clock,ctr3,ctr2,ctr1,prev[4],prev[6]);
  logic_tile l32(outa[5],clock,ctr3,ctr2,ctr1,in3,prev[5]);
    logic_tile l33(q[5],clock,ctr2,ctr3,ctr1,outa[4],outa[5]);
    logic_tile l34(outa[6],clock,ctr3,ctr2,ctr1,prev[3],prev[5]);
  logic_tile l35(outa[7],clock,ctr3,ctr2,ctr1,in4,prev[4]);
    logic_tile l36(q[4],clock,ctr2,ctr3,ctr1,outa[6],outa[7]);
    logic_tile l37(outa[8],clock,ctr3,ctr2,ctr1,prev[2],prev[4]);
  logic_tile l38(outa[9],clock,ctr3,ctr2,ctr1,in5,prev[3]);
    logic_tile l39(q[3],clock,ctr2,ctr3,ctr1,outa[8],outa[9]);
    logic_tile l40(outa[10],clock,ctr3,ctr2,ctr1,prev[1],prev[3]);
  logic_tile l41(outa[11],clock,ctr3,ctr2,ctr1,in6,prev[2]);
    logic_tile l42(q[2],clock,ctr2,ctr3,ctr1,outa[10],outa[11]);
    logic_tile l43(outa[12],clock,ctr3,ctr2,ctr1,prev[0],prev[2]);
  logic_tile l44(outa[13],clock,ctr3,ctr2,ctr1,in7,prev[1]);
    logic_tile l45(q[1],clock,ctr2,ctr3,ctr1,outa[12],outa[13]);
    logic_tile l46(outa[14],clock,ctr3,ctr2,ctr1,1'b0,prev[1]);
  logic_tile l47(outa[15],clock,ctr3,ctr2,ctr1,in8,prev[0]);
  logic_tile l48(q[0],clock,ctr2,ctr3,ctr1,outa[14],outa[15]);
endmodule
