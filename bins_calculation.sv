//eg.1
bit[2:0]sig;

covergroup cg;
  coverpoints sig{
    bins a1={[3:5]};
    ignore_bins b1{[5,6]};}\
endgroup
/*
answer: since it is 3 bit signal so total no of bins for 3bit signal will be 2^3=8 bins but 6 and 5 are ignore bins hence 
  total number of bins will be 6bins +1 ignore_bins (not used for coverage calculation)*/
//eg.2
bit[2:0]sig;
covergroup cg;
  coverpoint signal{
    bins a1={[3:5]};
    ignore_bins b1={[5,6]};}
  }
endgroup
/*
    bit [2:0] sig;
    This means sig can take values from 0 to 7 (3-bit wide).
    The range [3:5] includes:3,4,5 So, bins a1 = {[3:5]}; covers these 3 values.

    Ignore bins:
    ignore_bins b1 = {[5,6]};
    This tells the tool to ignore values 5 and 6 during coverage collection.

    Effective bins:Although a1 initially defines 3 bins (3, 4, 5),But since 5 is ignored (along with 6),Only 3 and 4 will be active in a1.
     Total number of bins = 2
*/

//eg.3
bit[2:0]sig;
covergroup cg;
  coverpoint signal{bins a1[]={[3:5]};
                    ignore_bins b1 ={[5,6]};}
endgroup

/*
2 bins+1 ignore_bins (Not to be used for coverage calculation)
though a1 is a vector bin a1[5] cannot be created because the value is included in ignore bins*/
*/

//eg.4
/*
class example;
  int clk;
  logic[7:0]address;
  logic[2:0]opcode;
  logic valid;

  covergroup cg_group;
    option.per_instance=1;
    c1:coverpoint clk{bins a[]={[0:21]};} //22 bins
    c2:coverpoint opcode;// 8 bins
    val: coverpoint address;// 256
    c1 x val:cross clk,valid;// 22 x 2=44
    c1xvalxv:cross c1,valid,opcode;//22 x 2 x8=352
  endgroup
  */
  //total number of bins = 22+8+256+44+352=682
