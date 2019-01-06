-- megafunction wizard: %LPM_CONSTANT%
-- GENERATION: STANDARD
-- VERSION: WM1.0
-- MODULE: LPM_CONSTANT 

-- ============================================================
-- File Name: fdkasfdas.vhd
-- Megafunction Name(s):
-- 			LPM_CONSTANT
--
-- Simulation Library Files(s):
-- 			
-- ============================================================
-- ************************************************************
-- THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
--
-- 17.0.0 Build 595 04/25/2017 SJ Standard Edition
-- ************************************************************


--Copyright (C) 2017  Intel Corporation. All rights reserved.
--Your use of Intel Corporation's design tools, logic functions 
--and other software and tools, and its AMPP partner logic 
--functions, and any output files from any of the foregoing 
--(including device programming or simulation files), and any 
--associated documentation or information are expressly subject 
--to the terms and conditions of the Intel Program License 
--Subscription Agreement, the Intel Quartus Prime License Agreement,
--the Intel MegaCore Function License Agreement, or other 
--applicable license agreement, including, without limitation, 
--that your use is for the sole purpose of programming logic 
--devices manufactured by Intel and sold by Intel or its 
--authorized distributors.  Please refer to the applicable 
--agreement for further details.


--lpm_constant CBX_AUTO_BLACKBOX="ALL" ENABLE_RUNTIME_MOD="YES" INSTANCE_NAME="a123" LPM_CVALUE=00000064 LPM_WIDTH=32 result
--VERSION_BEGIN 17.0 cbx_lpm_constant 2017:04:25:18:06:29:SJ cbx_mgl 2017:04:25:18:09:28:SJ  VERSION_END

--synthesis_resources = sld_mod_ram_rom 1 
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 ENTITY  fdkasfdas_lpm_constant_6sa IS 
	 PORT 
	 ( 
		 result	:	OUT  STD_LOGIC_VECTOR (31 DOWNTO 0)
	 ); 
 END fdkasfdas_lpm_constant_6sa;

 ARCHITECTURE RTL OF fdkasfdas_lpm_constant_6sa IS

	 SIGNAL  wire_mgl_prim1_data_write	:	STD_LOGIC_VECTOR (31 DOWNTO 0);
	 COMPONENT  sld_mod_ram_rom
	 GENERIC 
	 (
		CVALUE	:	STD_LOGIC_VECTOR(31 DOWNTO 0) := "00000000000000000000000000000000";
		IS_DATA_IN_RAM	:	NATURAL;
		IS_READABLE	:	NATURAL;
		NODE_NAME	:	NATURAL;
		NUMWORDS	:	NATURAL;
		SHIFT_COUNT_BITS	:	NATURAL;
		WIDTH_WORD	:	NATURAL;
		WIDTHAD	:	NATURAL
	 );
	 PORT
	 ( 
		data_write	:	OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	 ); 
	 END COMPONENT;
 BEGIN

	result <= wire_mgl_prim1_data_write;
	mgl_prim1 :  sld_mod_ram_rom
	  GENERIC MAP (
		CVALUE => "00000000000000000000000001100100",
		IS_DATA_IN_RAM => 0,
		IS_READABLE => 0,
		NODE_NAME => 1630614067,
		NUMWORDS => 1,
		SHIFT_COUNT_BITS => 6,
		WIDTH_WORD => 32,
		WIDTHAD => 1
	  )
	  PORT MAP ( 
		data_write => wire_mgl_prim1_data_write
	  );

 END RTL; --fdkasfdas_lpm_constant_6sa
--VALID FILE


LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY fdkasfdas IS
	PORT
	(
		result		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
END fdkasfdas;


ARCHITECTURE RTL OF fdkasfdas IS

	SIGNAL sub_wire0	: STD_LOGIC_VECTOR (31 DOWNTO 0);



	COMPONENT fdkasfdas_lpm_constant_6sa
	PORT (
			result	: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
	END COMPONENT;

BEGIN
	result    <= sub_wire0(31 DOWNTO 0);

	fdkasfdas_lpm_constant_6sa_component : fdkasfdas_lpm_constant_6sa
	PORT MAP (
		result => sub_wire0
	);



END RTL;

-- ============================================================
-- CNX file retrieval info
-- ============================================================
-- Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone V"
-- Retrieval info: PRIVATE: JTAG_ENABLED NUMERIC "1"
-- Retrieval info: PRIVATE: JTAG_ID STRING "a123"
-- Retrieval info: PRIVATE: Radix NUMERIC "10"
-- Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
-- Retrieval info: PRIVATE: Value NUMERIC "100"
-- Retrieval info: PRIVATE: nBit NUMERIC "32"
-- Retrieval info: PRIVATE: new_diagram STRING "1"
-- Retrieval info: LIBRARY: lpm lpm.lpm_components.all
-- Retrieval info: CONSTANT: LPM_CVALUE NUMERIC "100"
-- Retrieval info: CONSTANT: LPM_HINT STRING "ENABLE_RUNTIME_MOD=YES, INSTANCE_NAME=a123"
-- Retrieval info: CONSTANT: LPM_TYPE STRING "LPM_CONSTANT"
-- Retrieval info: CONSTANT: LPM_WIDTH NUMERIC "32"
-- Retrieval info: USED_PORT: result 0 0 32 0 OUTPUT NODEFVAL "result[31..0]"
-- Retrieval info: CONNECT: result 0 0 32 0 @result 0 0 32 0
-- Retrieval info: GEN_FILE: TYPE_NORMAL fdkasfdas.vhd TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL fdkasfdas.inc FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL fdkasfdas.cmp FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL fdkasfdas.bsf TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL fdkasfdas_inst.vhd FALSE
