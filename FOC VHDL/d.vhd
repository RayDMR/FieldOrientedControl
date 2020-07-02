-- -------------------------------------------------------------
-- 
-- File Name: hdlsrc\untitled\d.vhd
-- Created: 2020-07-03 00:04:52
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: d
-- Source Path: untitled/abc2dq/Park Transform/d
-- Hierarchy Level: 3
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.untitled_pkg.ALL;

ENTITY d IS
  PORT( u                                 :   IN    vector_of_std_logic_vector32(0 TO 3);  -- single [4]
        y                                 :   OUT   std_logic_vector(31 DOWNTO 0)  -- single
        );
END d;


ARCHITECTURE rtl OF d IS

  -- Component Declarations
  COMPONENT nfp_add_single
    PORT( nfp_in1                         :   IN    std_logic_vector(31 DOWNTO 0);  -- single
          nfp_in2                         :   IN    std_logic_vector(31 DOWNTO 0);  -- single
          nfp_out                         :   OUT   std_logic_vector(31 DOWNTO 0)  -- single
          );
  END COMPONENT;

  COMPONENT nfp_sin_single
    PORT( nfp_in                          :   IN    std_logic_vector(31 DOWNTO 0);  -- single
          nfp_out                         :   OUT   std_logic_vector(31 DOWNTO 0)  -- single
          );
  END COMPONENT;

  COMPONENT nfp_sub_single
    PORT( nfp_in1                         :   IN    std_logic_vector(31 DOWNTO 0);  -- single
          nfp_in2                         :   IN    std_logic_vector(31 DOWNTO 0);  -- single
          nfp_out                         :   OUT   std_logic_vector(31 DOWNTO 0)  -- single
          );
  END COMPONENT;

  COMPONENT nfp_mul_single
    PORT( nfp_in1                         :   IN    std_logic_vector(31 DOWNTO 0);  -- single
          nfp_in2                         :   IN    std_logic_vector(31 DOWNTO 0);  -- single
          nfp_out                         :   OUT   std_logic_vector(31 DOWNTO 0)  -- single
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : nfp_add_single
    USE ENTITY work.nfp_add_single(rtl);

  FOR ALL : nfp_sin_single
    USE ENTITY work.nfp_sin_single(rtl);

  FOR ALL : nfp_sub_single
    USE ENTITY work.nfp_sub_single(rtl);

  FOR ALL : nfp_mul_single
    USE ENTITY work.nfp_mul_single(rtl);

  -- Signals
  SIGNAL Offset                           : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL out0                             : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL out0_1                           : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Offset_1                         : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL out0_2                           : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL const_expression                 : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL out0_3                           : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL out0_4                           : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Offset_2                         : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL out0_5                           : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL const_expression_1               : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL out0_6                           : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL out0_7                           : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL out0_8                           : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL out0_9                           : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL out0_10                          : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL out0_11                          : std_logic_vector(31 DOWNTO 0);  -- ufix32

BEGIN
  u_nfp_add_comp : nfp_add_single
    PORT MAP( nfp_in1 => u(3),  -- single
              nfp_in2 => Offset,  -- single
              nfp_out => out0  -- single
              );

  u_nfp_sin_comp : nfp_sin_single
    PORT MAP( nfp_in => out0,  -- single
              nfp_out => out0_1  -- single
              );

  u_nfp_add_comp_1 : nfp_add_single
    PORT MAP( nfp_in1 => u(3),  -- single
              nfp_in2 => Offset_1,  -- single
              nfp_out => out0_2  -- single
              );

  u_nfp_sub_comp : nfp_sub_single
    PORT MAP( nfp_in1 => out0_2,  -- single
              nfp_in2 => const_expression,  -- single
              nfp_out => out0_3  -- single
              );

  u_nfp_sin_comp_1 : nfp_sin_single
    PORT MAP( nfp_in => out0_3,  -- single
              nfp_out => out0_4  -- single
              );

  u_nfp_add_comp_2 : nfp_add_single
    PORT MAP( nfp_in1 => u(3),  -- single
              nfp_in2 => Offset_2,  -- single
              nfp_out => out0_5  -- single
              );

  u_nfp_add_comp_3 : nfp_add_single
    PORT MAP( nfp_in1 => out0_5,  -- single
              nfp_in2 => const_expression_1,  -- single
              nfp_out => out0_6  -- single
              );

  u_nfp_sin_comp_2 : nfp_sin_single
    PORT MAP( nfp_in => out0_6,  -- single
              nfp_out => out0_7  -- single
              );

  u_nfp_mul_comp : nfp_mul_single
    PORT MAP( nfp_in1 => out0_1,  -- single
              nfp_in2 => u(0),  -- single
              nfp_out => out0_8  -- single
              );

  u_nfp_mul_comp_1 : nfp_mul_single
    PORT MAP( nfp_in1 => out0_4,  -- single
              nfp_in2 => u(1),  -- single
              nfp_out => out0_9  -- single
              );

  u_nfp_add_comp_4 : nfp_add_single
    PORT MAP( nfp_in1 => out0_8,  -- single
              nfp_in2 => out0_9,  -- single
              nfp_out => out0_10  -- single
              );

  u_nfp_mul_comp_2 : nfp_mul_single
    PORT MAP( nfp_in1 => out0_7,  -- single
              nfp_in2 => u(2),  -- single
              nfp_out => out0_11  -- single
              );

  u_nfp_add_comp_5 : nfp_add_single
    PORT MAP( nfp_in1 => out0_10,  -- single
              nfp_in2 => out0_11,  -- single
              nfp_out => y  -- single
              );

  Offset <= X"3fc90fdb";

  Offset_1 <= X"3fc90fdb";

  const_expression <= X"40060a92";

  Offset_2 <= X"3fc90fdb";

  const_expression_1 <= X"40060a92";

END rtl;

