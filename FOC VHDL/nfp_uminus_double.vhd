-- -------------------------------------------------------------
-- 
-- File Name: hdlsrc\untitled\nfp_uminus_double.vhd
-- Created: 2020-07-03 00:04:52
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: nfp_uminus_double
-- Source Path: untitled/CurrentController/Decoupling/nfp_uminus_double
-- Hierarchy Level: 3
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY nfp_uminus_double IS
  PORT( nfp_in                            :   IN    std_logic_vector(63 DOWNTO 0);  -- ufix64
        nfp_out                           :   OUT   std_logic_vector(63 DOWNTO 0)  -- ufix64
        );
END nfp_uminus_double;


ARCHITECTURE rtl OF nfp_uminus_double IS

  -- Signals
  SIGNAL nfp_in_unsigned                  : unsigned(63 DOWNTO 0);  -- ufix64
  SIGNAL XS                               : std_logic;  -- ufix1
  SIGNAL XE                               : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL XM                               : unsigned(51 DOWNTO 0);  -- ufix52
  SIGNAL Constant1_out1                   : std_logic;  -- ufix1
  SIGNAL Constant_out1                    : std_logic;  -- ufix1
  SIGNAL Switch_out1                      : std_logic;  -- ufix1
  SIGNAL nfp_out_pack                     : unsigned(63 DOWNTO 0);  -- ufix64

BEGIN
  nfp_in_unsigned <= unsigned(nfp_in);

  -- Split 64 bit word into FP sign, exponent, mantissa
  XS <= nfp_in_unsigned(63);
  XE <= nfp_in_unsigned(62 DOWNTO 52);
  XM <= nfp_in_unsigned(51 DOWNTO 0);

  Constant1_out1 <= '1';

  Constant_out1 <= '0';

  
  Switch_out1 <= Constant1_out1 WHEN XS = '0' ELSE
      Constant_out1;

  -- Combine FP sign, exponent, mantissa into 64 bit word
  nfp_out_pack <= Switch_out1 & XE & XM;

  nfp_out <= std_logic_vector(nfp_out_pack);

END rtl;

