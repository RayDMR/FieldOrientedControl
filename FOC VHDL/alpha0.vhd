-- -------------------------------------------------------------
-- 
-- File Name: hdlsrc\untitled\alpha0.vhd
-- Created: 2020-07-03 00:04:52
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: alpha0
-- Source Path: untitled/abc2dq/Park Transform/0
-- Hierarchy Level: 3
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.untitled_pkg.ALL;

ENTITY alpha0 IS
  PORT( u                                 :   IN    vector_of_std_logic_vector32(0 TO 3);  -- single [4]
        y                                 :   OUT   std_logic_vector(31 DOWNTO 0)  -- single
        );
END alpha0;


ARCHITECTURE rtl OF alpha0 IS

  -- Component Declarations
  COMPONENT nfp_add_single
    PORT( nfp_in1                         :   IN    std_logic_vector(31 DOWNTO 0);  -- single
          nfp_in2                         :   IN    std_logic_vector(31 DOWNTO 0);  -- single
          nfp_out                         :   OUT   std_logic_vector(31 DOWNTO 0)  -- single
          );
  END COMPONENT;

  COMPONENT nfp_gain_pow2_single
    PORT( nfp_in1                         :   IN    std_logic_vector(31 DOWNTO 0);  -- single
          nfp_in2                         :   IN    std_logic;  -- ufix1
          nfp_in3                         :   IN    std_logic_vector(8 DOWNTO 0);  -- sfix9
          nfp_out                         :   OUT   std_logic_vector(31 DOWNTO 0)  -- single
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : nfp_add_single
    USE ENTITY work.nfp_add_single(rtl);

  FOR ALL : nfp_gain_pow2_single
    USE ENTITY work.nfp_gain_pow2_single(rtl);

  -- Signals
  SIGNAL out0                             : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL out0_1                           : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL pw2_sign_const                   : std_logic;  -- ufix1
  SIGNAL pw2_shift_const                  : signed(8 DOWNTO 0);  -- sfix9

BEGIN
  u_nfp_add_comp : nfp_add_single
    PORT MAP( nfp_in1 => u(0),  -- single
              nfp_in2 => u(1),  -- single
              nfp_out => out0  -- single
              );

  u_nfp_add_comp_1 : nfp_add_single
    PORT MAP( nfp_in1 => out0,  -- single
              nfp_in2 => u(2),  -- single
              nfp_out => out0_1  -- single
              );

  u_nfp_gain_pow2_single : nfp_gain_pow2_single
    PORT MAP( nfp_in1 => out0_1,  -- single
              nfp_in2 => pw2_sign_const,  -- ufix1
              nfp_in3 => std_logic_vector(pw2_shift_const),  -- sfix9
              nfp_out => y  -- single
              );

  pw2_sign_const <= '0';

  pw2_shift_const <= to_signed(-16#001#, 9);

END rtl;

