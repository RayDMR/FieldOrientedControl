-- -------------------------------------------------------------
-- 
-- File Name: hdlsrc\untitled\nfp_mul_single.vhd
-- Created: 2020-07-03 00:04:52
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: nfp_mul_single
-- Source Path: untitled/CurrentController/IqController/nfp_mul_single
-- Hierarchy Level: 4
-- 
-- {Latency Strategy = "Zero", Denormal Handling = "off"}
-- {Mantissa Multiply Strategy = "FullMultiplier"}
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY nfp_mul_single IS
  PORT( nfp_in1                           :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        nfp_in2                           :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        nfp_out                           :   OUT   std_logic_vector(31 DOWNTO 0)  -- ufix32
        );
END nfp_mul_single;


ARCHITECTURE rtl OF nfp_mul_single IS

  -- Signals
  SIGNAL nfp_in2_unsigned                 : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL BS                               : std_logic;  -- ufix1
  SIGNAL BE                               : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL BM                               : unsigned(22 DOWNTO 0);  -- ufix23
  SIGNAL Compare_To_Constant1_out1        : std_logic;
  SIGNAL Compare_To_Zero3_out1            : std_logic;
  SIGNAL Logical_Operator1_out1           : std_logic;
  SIGNAL nfp_in1_unsigned                 : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL AS                               : std_logic;  -- ufix1
  SIGNAL AE                               : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL AM                               : unsigned(22 DOWNTO 0);  -- ufix23
  SIGNAL Compare_To_Constant_out1         : std_logic;
  SIGNAL Compare_To_Zero2_out1            : std_logic;
  SIGNAL Logical_Operator_out1            : std_logic;
  SIGNAL Logical_Operator_out1_1          : std_logic;
  SIGNAL Switch_out1                      : std_logic;
  SIGNAL Constant8_out1                   : std_logic;  -- ufix1
  SIGNAL Constant6_out1                   : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Compare_To_Zero_out1             : std_logic;
  SIGNAL Constant1_out1                   : std_logic;  -- ufix1
  SIGNAL Constant_out1                    : std_logic;  -- ufix1
  SIGNAL Switch1_out1                     : std_logic;  -- ufix1
  SIGNAL Bit_Concat_out1                  : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL Constant5_out1                   : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL Logical_Operator3_out1           : std_logic;
  SIGNAL Logical_Operator_out1_2          : std_logic;
  SIGNAL Compare_To_Zero1_out1            : std_logic;
  SIGNAL Constant3_out1                   : std_logic;  -- ufix1
  SIGNAL Constant2_out1                   : std_logic;  -- ufix1
  SIGNAL Switch2_out1                     : std_logic;  -- ufix1
  SIGNAL Bit_Concat1_out1                 : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL Switch_out1_1                    : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL Constant4_out1                   : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL Switch3_out1                     : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL Product_out1                     : unsigned(47 DOWNTO 0);  -- ufix48
  SIGNAL Constant1_out1_1                 : std_logic;
  SIGNAL Bit_Concat_out1_1                : unsigned(48 DOWNTO 0);  -- ufix49
  SIGNAL Bit_Slice1_out1                  : std_logic;  -- ufix1
  SIGNAL Logical_Operator1_out1_1         : std_logic;
  SIGNAL Logical_Operator3_out1_1         : std_logic;
  SIGNAL Logical_Operator_out1_3          : std_logic;
  SIGNAL Logical_Operator2_out1           : std_logic;
  SIGNAL Constant2_out1_1                 : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL Constant1_out1_2                 : std_logic;
  SIGNAL Constant3_out1_1                 : std_logic;
  SIGNAL Switch_out1_2                    : std_logic;
  SIGNAL Bit_Concat1_out1_1               : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Switch1_out1_1                   : std_logic;
  SIGNAL Subtract_out1                    : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL Bit_Concat_out1_2                : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Add1_out1                        : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL Subtract2_sub_cast               : signed(31 DOWNTO 0);  -- sfix32
  SIGNAL Subtract2_sub_cast_1             : signed(31 DOWNTO 0);  -- sfix32
  SIGNAL Subtract2_sub_temp               : signed(31 DOWNTO 0);  -- sfix32
  SIGNAL Subtract2_out1                   : signed(9 DOWNTO 0);  -- sfix10
  SIGNAL Constant4_out1_1                 : signed(9 DOWNTO 0);  -- sfix10
  SIGNAL Switch2_out1_1                   : signed(9 DOWNTO 0);  -- sfix10
  SIGNAL Constant_out1_1                  : signed(9 DOWNTO 0);  -- sfix10
  SIGNAL Switch1_out1_2                   : signed(9 DOWNTO 0);  -- sfix10
  SIGNAL Add_add_cast                     : signed(31 DOWNTO 0);  -- sfix32
  SIGNAL Add_add_temp                     : signed(31 DOWNTO 0);  -- sfix32
  SIGNAL Add_out1                         : signed(9 DOWNTO 0);  -- sfix10
  SIGNAL Compare_To_Constant_out1_1       : std_logic;
  SIGNAL Constant1_out1_3                 : signed(9 DOWNTO 0);  -- sfix10
  SIGNAL Switch2_out1_2                   : signed(9 DOWNTO 0);  -- sfix10
  SIGNAL Compare_To_Constant1_out1_1      : std_logic;
  SIGNAL Logical_Operator1_out1_2         : std_logic;
  SIGNAL Logical_Operator4_out1           : std_logic;
  SIGNAL Logical_Operator7_out1           : std_logic;
  SIGNAL Logical_Operator5_out1           : std_logic;
  SIGNAL Logical_Operator6_out1           : std_logic;
  SIGNAL Logical_Operator8_out1           : std_logic;
  SIGNAL Inf_Zero_out1                    : std_logic;
  SIGNAL Logical_Operator2_out1_1         : std_logic;
  SIGNAL Logical_Operator10_out1          : std_logic;
  SIGNAL Logical_Operator_out1_4          : std_logic;
  SIGNAL Compare_To_Constant_out1_2       : std_logic;
  SIGNAL Constant1_out1_4                 : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Bit_Shift_out1                   : unsigned(48 DOWNTO 0);  -- ufix49
  SIGNAL Switch_out1_3                    : unsigned(48 DOWNTO 0);  -- ufix49
  SIGNAL Bit_Slice_out1                   : unsigned(47 DOWNTO 0);  -- ufix48
  SIGNAL Bit_Slice2_out1                  : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL Bit_Slice4_out1                  : std_logic;  -- ufix1
  SIGNAL Bit_Slice1_out1_1                : unsigned(21 DOWNTO 0);  -- ufix22
  SIGNAL Bit_Reduce_out1                  : std_logic;  -- ufix1
  SIGNAL Bit_Slice5_out1                  : std_logic;  -- ufix1
  SIGNAL Bit_Slice3_out1                  : std_logic;  -- ufix1
  SIGNAL Logical_Operator1_out1_3         : std_logic;
  SIGNAL Logical_Operator_out1_5          : std_logic;
  SIGNAL Bit_Slice1_out1_2                : unsigned(22 DOWNTO 0);  -- ufix23
  SIGNAL Delay2_out1_dtc                  : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL Constant_out1_2                  : std_logic;
  SIGNAL Add_add_cast_1                   : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL Add_out1_1                       : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL Switch_out1_4                    : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL Bit_Slice2_out1_1                : std_logic;  -- ufix1
  SIGNAL Add1_add_cast                    : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL Add1_out1_1                      : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Add_add_cast_2                   : signed(31 DOWNTO 0);  -- sfix32
  SIGNAL Add_add_temp_1                   : signed(31 DOWNTO 0);  -- sfix32
  SIGNAL Add_out1_2                       : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Constant1_out1_5                 : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Switch1_out1_3                   : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Constant4_out1_2                 : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Switch1_out1_4                   : std_logic;
  SIGNAL Switch4_out1                     : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Switch6_out1                     : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Bit_Slice4_out1_1                : unsigned(22 DOWNTO 0);  -- ufix23
  SIGNAL Bit_Shift_out1_1                 : unsigned(22 DOWNTO 0);  -- ufix23
  SIGNAL Switch1_out1_5                   : unsigned(22 DOWNTO 0);  -- ufix23
  SIGNAL Constant2_out1_2                 : unsigned(22 DOWNTO 0);  -- ufix23
  SIGNAL Switch2_out1_3                   : unsigned(22 DOWNTO 0);  -- ufix23
  SIGNAL Constant5_out1_1                 : unsigned(22 DOWNTO 0);  -- ufix23
  SIGNAL Bit_Set_out1                     : unsigned(22 DOWNTO 0);  -- ufix23
  SIGNAL Switch7_out1                     : unsigned(22 DOWNTO 0);  -- ufix23
  SIGNAL Switch5_out1                     : unsigned(22 DOWNTO 0);  -- ufix23
  SIGNAL nfp_out_pack                     : unsigned(31 DOWNTO 0);  -- ufix32

BEGIN
  nfp_in2_unsigned <= unsigned(nfp_in2);

  -- Split 32 bit word into FP sign, exponent, mantissa
  BS <= nfp_in2_unsigned(31);
  BE <= nfp_in2_unsigned(30 DOWNTO 23);
  BM <= nfp_in2_unsigned(22 DOWNTO 0);

  
  Compare_To_Constant1_out1 <= '1' WHEN BE = to_unsigned(16#FF#, 8) ELSE
      '0';

  
  Compare_To_Zero3_out1 <= '1' WHEN BM /= to_unsigned(16#000000#, 23) ELSE
      '0';

  Logical_Operator1_out1 <= Compare_To_Constant1_out1 AND Compare_To_Zero3_out1;

  nfp_in1_unsigned <= unsigned(nfp_in1);

  -- Split 32 bit word into FP sign, exponent, mantissa
  AS <= nfp_in1_unsigned(31);
  AE <= nfp_in1_unsigned(30 DOWNTO 23);
  AM <= nfp_in1_unsigned(22 DOWNTO 0);

  
  Compare_To_Constant_out1 <= '1' WHEN AE = to_unsigned(16#FF#, 8) ELSE
      '0';

  
  Compare_To_Zero2_out1 <= '1' WHEN AM /= to_unsigned(16#000000#, 23) ELSE
      '0';

  Logical_Operator_out1 <= Compare_To_Constant_out1 AND Compare_To_Zero2_out1;

  Logical_Operator_out1_1 <= AS XOR BS;

  
  Switch_out1 <= Logical_Operator_out1_1 WHEN Logical_Operator_out1 = '0' ELSE
      AS;

  Constant8_out1 <= '1';

  Constant6_out1 <= to_unsigned(16#00#, 8);

  
  Compare_To_Zero_out1 <= '1' WHEN AE = to_unsigned(16#00#, 8) ELSE
      '0';

  Constant1_out1 <= '1';

  Constant_out1 <= '0';

  
  Switch1_out1 <= Constant1_out1 WHEN Compare_To_Zero_out1 = '0' ELSE
      Constant_out1;

  Bit_Concat_out1 <= Switch1_out1 & AM;

  Constant5_out1 <= to_unsigned(16#800000#, 24);

  Logical_Operator3_out1 <=  NOT Logical_Operator1_out1;

  Logical_Operator_out1_2 <= Logical_Operator_out1 AND Logical_Operator3_out1;

  
  Compare_To_Zero1_out1 <= '1' WHEN BE = to_unsigned(16#00#, 8) ELSE
      '0';

  Constant3_out1 <= '1';

  Constant2_out1 <= '0';

  
  Switch2_out1 <= Constant3_out1 WHEN Compare_To_Zero1_out1 = '0' ELSE
      Constant2_out1;

  Bit_Concat1_out1 <= Switch2_out1 & BM;

  
  Switch_out1_1 <= Bit_Concat_out1 WHEN Logical_Operator1_out1 = '0' ELSE
      Constant5_out1;

  Constant4_out1 <= to_unsigned(16#800000#, 24);

  
  Switch3_out1 <= Bit_Concat1_out1 WHEN Logical_Operator_out1_2 = '0' ELSE
      Constant4_out1;

  Product_out1 <= Switch_out1_1 * Switch3_out1;

  Constant1_out1_1 <= '0';

  Bit_Concat_out1_1 <= Product_out1 & Constant1_out1_1;

  Bit_Slice1_out1 <= Bit_Concat_out1_1(48);

  Logical_Operator1_out1_1 <= Compare_To_Constant_out1 OR Compare_To_Constant1_out1;

  Logical_Operator3_out1_1 <=  NOT Logical_Operator1_out1_1;

  Logical_Operator_out1_3 <= Compare_To_Zero_out1 OR Compare_To_Zero1_out1;

  Logical_Operator2_out1 <= Logical_Operator3_out1_1 AND Logical_Operator_out1_3;

  Constant2_out1_1 <= to_unsigned(16#3F#, 7);

  Constant1_out1_2 <= '1';

  Constant3_out1_1 <= '0';

  
  Switch_out1_2 <= Constant1_out1_2 WHEN Compare_To_Zero_out1 = '0' ELSE
      Constant3_out1_1;

  Bit_Concat1_out1_1 <= Constant2_out1_1 & Switch_out1_2;

  
  Switch1_out1_1 <= Constant1_out1_2 WHEN Compare_To_Zero1_out1 = '0' ELSE
      Constant3_out1_1;

  Subtract_out1 <= resize(resize(AE, 32) + resize(BE, 32), 9);

  Bit_Concat_out1_2 <= Constant2_out1_1 & Switch1_out1_1;

  Add1_out1 <= resize(resize(Bit_Concat1_out1_1, 32) + resize(Bit_Concat_out1_2, 32), 9);

  Subtract2_sub_cast <= signed(resize(Subtract_out1, 32));
  Subtract2_sub_cast_1 <= signed(resize(Add1_out1, 32));
  Subtract2_sub_temp <= Subtract2_sub_cast - Subtract2_sub_cast_1;
  Subtract2_out1 <= Subtract2_sub_temp(9 DOWNTO 0);

  Constant4_out1_1 <= to_signed(16#0FF#, 10);

  
  Switch2_out1_1 <= Subtract2_out1 WHEN Logical_Operator1_out1_1 = '0' ELSE
      Constant4_out1_1;

  Constant_out1_1 <= to_signed(-16#1FF#, 10);

  
  Switch1_out1_2 <= Switch2_out1_1 WHEN Logical_Operator2_out1 = '0' ELSE
      Constant_out1_1;

  Add_add_cast <= '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & Bit_Slice1_out1;
  Add_add_temp <= Add_add_cast + resize(Switch1_out1_2, 32);
  Add_out1 <= Add_add_temp(9 DOWNTO 0);

  
  Compare_To_Constant_out1_1 <= '1' WHEN Add_out1 > to_signed(-16#07F#, 10) ELSE
      '0';

  Constant1_out1_3 <= to_signed(-16#080#, 10);

  
  Switch2_out1_2 <= Constant1_out1_3 WHEN Compare_To_Constant_out1_1 = '0' ELSE
      Add_out1;

  
  Compare_To_Constant1_out1_1 <= '1' WHEN Switch2_out1_2 > to_signed(16#07F#, 10) ELSE
      '0';

  Logical_Operator1_out1_2 <=  NOT Compare_To_Zero3_out1;

  Logical_Operator4_out1 <= Logical_Operator1_out1_2 AND Compare_To_Zero1_out1;

  Logical_Operator7_out1 <= Logical_Operator4_out1 AND Compare_To_Constant_out1;

  Logical_Operator5_out1 <=  NOT Compare_To_Zero2_out1;

  Logical_Operator6_out1 <= Logical_Operator5_out1 AND Compare_To_Zero_out1;

  Logical_Operator8_out1 <= Logical_Operator6_out1 AND Compare_To_Constant1_out1;

  Inf_Zero_out1 <= Logical_Operator7_out1 OR Logical_Operator8_out1;

  Logical_Operator2_out1_1 <= Logical_Operator_out1 OR Logical_Operator1_out1;

  Logical_Operator10_out1 <= Inf_Zero_out1 OR Logical_Operator2_out1_1;

  Logical_Operator_out1_4 <= Compare_To_Constant1_out1_1 OR Logical_Operator10_out1;

  
  Compare_To_Constant_out1_2 <= '1' WHEN Switch2_out1_2 < to_signed(-16#07F#, 10) ELSE
      '0';

  Constant1_out1_4 <= to_unsigned(16#7F#, 8);

  Bit_Shift_out1 <= Bit_Concat_out1_1 srl 1;

  
  Switch_out1_3 <= Bit_Concat_out1_1 WHEN Bit_Slice1_out1 = '0' ELSE
      Bit_Shift_out1;

  Bit_Slice_out1 <= Switch_out1_3(47 DOWNTO 0);

  Bit_Slice2_out1 <= Bit_Slice_out1(23 DOWNTO 22);

  Bit_Slice4_out1 <= Bit_Slice2_out1(0);

  Bit_Slice1_out1_1 <= Bit_Slice_out1(21 DOWNTO 0);

  Bit_Reduce_out1 <= (Bit_Slice1_out1_1(21) OR Bit_Slice1_out1_1(20) OR Bit_Slice1_out1_1(19) OR Bit_Slice1_out1_1(18) OR Bit_Slice1_out1_1(17) OR Bit_Slice1_out1_1(16) OR Bit_Slice1_out1_1(15) OR Bit_Slice1_out1_1(14) OR Bit_Slice1_out1_1(13) OR Bit_Slice1_out1_1(12) OR Bit_Slice1_out1_1(11) OR Bit_Slice1_out1_1(10) OR Bit_Slice1_out1_1(9) OR Bit_Slice1_out1_1(8) OR Bit_Slice1_out1_1(7) OR Bit_Slice1_out1_1(6) OR Bit_Slice1_out1_1(5) OR Bit_Slice1_out1_1(4) OR Bit_Slice1_out1_1(3) OR Bit_Slice1_out1_1(2) OR Bit_Slice1_out1_1(1) OR Bit_Slice1_out1_1(0));

  Bit_Slice5_out1 <= Bit_Slice2_out1(1);

  Bit_Slice3_out1 <= Bit_Slice_out1(24);

  Logical_Operator1_out1_3 <= Bit_Slice3_out1 OR (Bit_Slice4_out1 OR Bit_Reduce_out1);

  Logical_Operator_out1_5 <= Bit_Slice5_out1 AND Logical_Operator1_out1_3;

  Bit_Slice1_out1_2 <= Bit_Slice_out1(46 DOWNTO 24);

  Delay2_out1_dtc <= resize(Bit_Slice1_out1_2, 24);

  Constant_out1_2 <= '1';

  Add_add_cast_1 <= '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & Constant_out1_2;
  Add_out1_1 <= resize(resize(Bit_Slice1_out1_2, 32) + Add_add_cast_1, 24);

  
  Switch_out1_4 <= Delay2_out1_dtc WHEN Logical_Operator_out1_5 = '0' ELSE
      Add_out1_1;

  Bit_Slice2_out1_1 <= Switch_out1_4(23);

  Add1_add_cast <= '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & Bit_Slice2_out1_1;
  Add1_out1_1 <= resize(resize(Constant1_out1_4, 32) + Add1_add_cast, 8);

  Add_add_cast_2 <= signed(resize(Add1_out1_1, 32));
  Add_add_temp_1 <= Add_add_cast_2 + resize(Switch2_out1_2, 32);
  Add_out1_2 <= unsigned(Add_add_temp_1(7 DOWNTO 0));

  Constant1_out1_5 <= to_unsigned(16#00#, 8);

  
  Switch1_out1_3 <= Add_out1_2 WHEN Compare_To_Constant_out1_2 = '0' ELSE
      Constant1_out1_5;

  Constant4_out1_2 <= to_unsigned(16#FF#, 8);

  
  Switch1_out1_4 <= Switch_out1 WHEN Logical_Operator1_out1 = '0' ELSE
      BS;

  
  Switch4_out1 <= Switch1_out1_3 WHEN Logical_Operator_out1_4 = '0' ELSE
      Constant4_out1_2;

  
  Switch6_out1 <= Constant6_out1 WHEN Constant8_out1 = '0' ELSE
      Switch4_out1;

  Bit_Slice4_out1_1 <= Switch_out1_4(22 DOWNTO 0);

  Bit_Shift_out1_1 <= Bit_Slice4_out1_1 srl 1;

  
  Switch1_out1_5 <= Bit_Slice4_out1_1 WHEN Bit_Slice2_out1_1 = '0' ELSE
      Bit_Shift_out1_1;

  Constant2_out1_2 <= to_unsigned(16#000000#, 23);

  
  Switch2_out1_3 <= Switch1_out1_5 WHEN Compare_To_Constant_out1_2 = '0' ELSE
      Constant2_out1_2;

  Constant5_out1_1 <= to_unsigned(16#000000#, 23);

  Bit_Set_out1 <= Switch2_out1_3 OR to_unsigned(16#400000#, 23);

  
  Switch7_out1 <= Constant5_out1_1 WHEN Logical_Operator10_out1 = '0' ELSE
      Bit_Set_out1;

  
  Switch5_out1 <= Switch2_out1_3 WHEN Logical_Operator_out1_4 = '0' ELSE
      Switch7_out1;

  -- Combine FP sign, exponent, mantissa into 32 bit word
  nfp_out_pack <= Switch1_out1_4 & Switch6_out1 & Switch5_out1;

  nfp_out <= std_logic_vector(nfp_out_pack);

END rtl;

