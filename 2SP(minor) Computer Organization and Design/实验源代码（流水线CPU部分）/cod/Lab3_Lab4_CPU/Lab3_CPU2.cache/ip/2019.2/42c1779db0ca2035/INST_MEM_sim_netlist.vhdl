-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
-- Date        : Wed Apr 17 19:04:06 2024
-- Host        : DESKTOP-6KORK05 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ INST_MEM_sim_netlist.vhdl
-- Design      : INST_MEM
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_spram is
  port (
    spo : out STD_LOGIC_VECTOR ( 31 downto 0 );
    we : in STD_LOGIC;
    a : in STD_LOGIC_VECTOR ( 8 downto 0 );
    clk : in STD_LOGIC;
    d : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_spram;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_spram is
  signal qspo_int : STD_LOGIC_VECTOR ( 31 downto 0 );
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of qspo_int : signal is "true";
  signal ram_reg_0_255_0_0_i_1_n_0 : STD_LOGIC;
  signal ram_reg_0_255_0_0_n_0 : STD_LOGIC;
  signal ram_reg_0_255_10_10_n_0 : STD_LOGIC;
  signal ram_reg_0_255_11_11_n_0 : STD_LOGIC;
  signal ram_reg_0_255_12_12_n_0 : STD_LOGIC;
  signal ram_reg_0_255_13_13_n_0 : STD_LOGIC;
  signal ram_reg_0_255_14_14_n_0 : STD_LOGIC;
  signal ram_reg_0_255_15_15_n_0 : STD_LOGIC;
  signal ram_reg_0_255_16_16_n_0 : STD_LOGIC;
  signal ram_reg_0_255_17_17_n_0 : STD_LOGIC;
  signal ram_reg_0_255_18_18_n_0 : STD_LOGIC;
  signal ram_reg_0_255_19_19_n_0 : STD_LOGIC;
  signal ram_reg_0_255_1_1_n_0 : STD_LOGIC;
  signal ram_reg_0_255_20_20_n_0 : STD_LOGIC;
  signal ram_reg_0_255_21_21_n_0 : STD_LOGIC;
  signal ram_reg_0_255_22_22_n_0 : STD_LOGIC;
  signal ram_reg_0_255_23_23_n_0 : STD_LOGIC;
  signal ram_reg_0_255_24_24_n_0 : STD_LOGIC;
  signal ram_reg_0_255_25_25_n_0 : STD_LOGIC;
  signal ram_reg_0_255_26_26_n_0 : STD_LOGIC;
  signal ram_reg_0_255_27_27_n_0 : STD_LOGIC;
  signal ram_reg_0_255_28_28_n_0 : STD_LOGIC;
  signal ram_reg_0_255_29_29_n_0 : STD_LOGIC;
  signal ram_reg_0_255_2_2_n_0 : STD_LOGIC;
  signal ram_reg_0_255_30_30_n_0 : STD_LOGIC;
  signal ram_reg_0_255_31_31_n_0 : STD_LOGIC;
  signal ram_reg_0_255_3_3_n_0 : STD_LOGIC;
  signal ram_reg_0_255_4_4_n_0 : STD_LOGIC;
  signal ram_reg_0_255_5_5_n_0 : STD_LOGIC;
  signal ram_reg_0_255_6_6_n_0 : STD_LOGIC;
  signal ram_reg_0_255_7_7_n_0 : STD_LOGIC;
  signal ram_reg_0_255_8_8_n_0 : STD_LOGIC;
  signal ram_reg_0_255_9_9_n_0 : STD_LOGIC;
  signal ram_reg_256_511_0_0_i_1_n_0 : STD_LOGIC;
  signal ram_reg_256_511_0_0_n_0 : STD_LOGIC;
  signal ram_reg_256_511_10_10_n_0 : STD_LOGIC;
  signal ram_reg_256_511_11_11_n_0 : STD_LOGIC;
  signal ram_reg_256_511_12_12_n_0 : STD_LOGIC;
  signal ram_reg_256_511_13_13_n_0 : STD_LOGIC;
  signal ram_reg_256_511_14_14_n_0 : STD_LOGIC;
  signal ram_reg_256_511_15_15_n_0 : STD_LOGIC;
  signal ram_reg_256_511_16_16_n_0 : STD_LOGIC;
  signal ram_reg_256_511_17_17_n_0 : STD_LOGIC;
  signal ram_reg_256_511_18_18_n_0 : STD_LOGIC;
  signal ram_reg_256_511_19_19_n_0 : STD_LOGIC;
  signal ram_reg_256_511_1_1_n_0 : STD_LOGIC;
  signal ram_reg_256_511_20_20_n_0 : STD_LOGIC;
  signal ram_reg_256_511_21_21_n_0 : STD_LOGIC;
  signal ram_reg_256_511_22_22_n_0 : STD_LOGIC;
  signal ram_reg_256_511_23_23_n_0 : STD_LOGIC;
  signal ram_reg_256_511_24_24_n_0 : STD_LOGIC;
  signal ram_reg_256_511_25_25_n_0 : STD_LOGIC;
  signal ram_reg_256_511_26_26_n_0 : STD_LOGIC;
  signal ram_reg_256_511_27_27_n_0 : STD_LOGIC;
  signal ram_reg_256_511_28_28_n_0 : STD_LOGIC;
  signal ram_reg_256_511_29_29_n_0 : STD_LOGIC;
  signal ram_reg_256_511_2_2_n_0 : STD_LOGIC;
  signal ram_reg_256_511_30_30_n_0 : STD_LOGIC;
  signal ram_reg_256_511_31_31_n_0 : STD_LOGIC;
  signal ram_reg_256_511_3_3_n_0 : STD_LOGIC;
  signal ram_reg_256_511_4_4_n_0 : STD_LOGIC;
  signal ram_reg_256_511_5_5_n_0 : STD_LOGIC;
  signal ram_reg_256_511_6_6_n_0 : STD_LOGIC;
  signal ram_reg_256_511_7_7_n_0 : STD_LOGIC;
  signal ram_reg_256_511_8_8_n_0 : STD_LOGIC;
  signal ram_reg_256_511_9_9_n_0 : STD_LOGIC;
  signal \^spo\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  attribute KEEP : string;
  attribute KEEP of \qspo_int_reg[0]\ : label is "yes";
  attribute equivalent_register_removal : string;
  attribute equivalent_register_removal of \qspo_int_reg[0]\ : label is "no";
  attribute KEEP of \qspo_int_reg[10]\ : label is "yes";
  attribute equivalent_register_removal of \qspo_int_reg[10]\ : label is "no";
  attribute KEEP of \qspo_int_reg[11]\ : label is "yes";
  attribute equivalent_register_removal of \qspo_int_reg[11]\ : label is "no";
  attribute KEEP of \qspo_int_reg[12]\ : label is "yes";
  attribute equivalent_register_removal of \qspo_int_reg[12]\ : label is "no";
  attribute KEEP of \qspo_int_reg[13]\ : label is "yes";
  attribute equivalent_register_removal of \qspo_int_reg[13]\ : label is "no";
  attribute KEEP of \qspo_int_reg[14]\ : label is "yes";
  attribute equivalent_register_removal of \qspo_int_reg[14]\ : label is "no";
  attribute KEEP of \qspo_int_reg[15]\ : label is "yes";
  attribute equivalent_register_removal of \qspo_int_reg[15]\ : label is "no";
  attribute KEEP of \qspo_int_reg[16]\ : label is "yes";
  attribute equivalent_register_removal of \qspo_int_reg[16]\ : label is "no";
  attribute KEEP of \qspo_int_reg[17]\ : label is "yes";
  attribute equivalent_register_removal of \qspo_int_reg[17]\ : label is "no";
  attribute KEEP of \qspo_int_reg[18]\ : label is "yes";
  attribute equivalent_register_removal of \qspo_int_reg[18]\ : label is "no";
  attribute KEEP of \qspo_int_reg[19]\ : label is "yes";
  attribute equivalent_register_removal of \qspo_int_reg[19]\ : label is "no";
  attribute KEEP of \qspo_int_reg[1]\ : label is "yes";
  attribute equivalent_register_removal of \qspo_int_reg[1]\ : label is "no";
  attribute KEEP of \qspo_int_reg[20]\ : label is "yes";
  attribute equivalent_register_removal of \qspo_int_reg[20]\ : label is "no";
  attribute KEEP of \qspo_int_reg[21]\ : label is "yes";
  attribute equivalent_register_removal of \qspo_int_reg[21]\ : label is "no";
  attribute KEEP of \qspo_int_reg[22]\ : label is "yes";
  attribute equivalent_register_removal of \qspo_int_reg[22]\ : label is "no";
  attribute KEEP of \qspo_int_reg[23]\ : label is "yes";
  attribute equivalent_register_removal of \qspo_int_reg[23]\ : label is "no";
  attribute KEEP of \qspo_int_reg[24]\ : label is "yes";
  attribute equivalent_register_removal of \qspo_int_reg[24]\ : label is "no";
  attribute KEEP of \qspo_int_reg[25]\ : label is "yes";
  attribute equivalent_register_removal of \qspo_int_reg[25]\ : label is "no";
  attribute KEEP of \qspo_int_reg[26]\ : label is "yes";
  attribute equivalent_register_removal of \qspo_int_reg[26]\ : label is "no";
  attribute KEEP of \qspo_int_reg[27]\ : label is "yes";
  attribute equivalent_register_removal of \qspo_int_reg[27]\ : label is "no";
  attribute KEEP of \qspo_int_reg[28]\ : label is "yes";
  attribute equivalent_register_removal of \qspo_int_reg[28]\ : label is "no";
  attribute KEEP of \qspo_int_reg[29]\ : label is "yes";
  attribute equivalent_register_removal of \qspo_int_reg[29]\ : label is "no";
  attribute KEEP of \qspo_int_reg[2]\ : label is "yes";
  attribute equivalent_register_removal of \qspo_int_reg[2]\ : label is "no";
  attribute KEEP of \qspo_int_reg[30]\ : label is "yes";
  attribute equivalent_register_removal of \qspo_int_reg[30]\ : label is "no";
  attribute KEEP of \qspo_int_reg[31]\ : label is "yes";
  attribute equivalent_register_removal of \qspo_int_reg[31]\ : label is "no";
  attribute KEEP of \qspo_int_reg[3]\ : label is "yes";
  attribute equivalent_register_removal of \qspo_int_reg[3]\ : label is "no";
  attribute KEEP of \qspo_int_reg[4]\ : label is "yes";
  attribute equivalent_register_removal of \qspo_int_reg[4]\ : label is "no";
  attribute KEEP of \qspo_int_reg[5]\ : label is "yes";
  attribute equivalent_register_removal of \qspo_int_reg[5]\ : label is "no";
  attribute KEEP of \qspo_int_reg[6]\ : label is "yes";
  attribute equivalent_register_removal of \qspo_int_reg[6]\ : label is "no";
  attribute KEEP of \qspo_int_reg[7]\ : label is "yes";
  attribute equivalent_register_removal of \qspo_int_reg[7]\ : label is "no";
  attribute KEEP of \qspo_int_reg[8]\ : label is "yes";
  attribute equivalent_register_removal of \qspo_int_reg[8]\ : label is "no";
  attribute KEEP of \qspo_int_reg[9]\ : label is "yes";
  attribute equivalent_register_removal of \qspo_int_reg[9]\ : label is "no";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_0_255_0_0 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of ram_reg_0_255_0_0 : label is 16384;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of ram_reg_0_255_0_0 : label is "synth_options.dist_mem_inst/gen_sp_ram.spram_inst/ram";
  attribute ram_addr_begin : integer;
  attribute ram_addr_begin of ram_reg_0_255_0_0 : label is 0;
  attribute ram_addr_end : integer;
  attribute ram_addr_end of ram_reg_0_255_0_0 : label is 255;
  attribute ram_offset : integer;
  attribute ram_offset of ram_reg_0_255_0_0 : label is 0;
  attribute ram_slice_begin : integer;
  attribute ram_slice_begin of ram_reg_0_255_0_0 : label is 0;
  attribute ram_slice_end : integer;
  attribute ram_slice_end of ram_reg_0_255_0_0 : label is 0;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_0_255_10_10 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_0_255_10_10 : label is 16384;
  attribute RTL_RAM_NAME of ram_reg_0_255_10_10 : label is "synth_options.dist_mem_inst/gen_sp_ram.spram_inst/ram";
  attribute ram_addr_begin of ram_reg_0_255_10_10 : label is 0;
  attribute ram_addr_end of ram_reg_0_255_10_10 : label is 255;
  attribute ram_offset of ram_reg_0_255_10_10 : label is 0;
  attribute ram_slice_begin of ram_reg_0_255_10_10 : label is 10;
  attribute ram_slice_end of ram_reg_0_255_10_10 : label is 10;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_0_255_11_11 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_0_255_11_11 : label is 16384;
  attribute RTL_RAM_NAME of ram_reg_0_255_11_11 : label is "synth_options.dist_mem_inst/gen_sp_ram.spram_inst/ram";
  attribute ram_addr_begin of ram_reg_0_255_11_11 : label is 0;
  attribute ram_addr_end of ram_reg_0_255_11_11 : label is 255;
  attribute ram_offset of ram_reg_0_255_11_11 : label is 0;
  attribute ram_slice_begin of ram_reg_0_255_11_11 : label is 11;
  attribute ram_slice_end of ram_reg_0_255_11_11 : label is 11;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_0_255_12_12 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_0_255_12_12 : label is 16384;
  attribute RTL_RAM_NAME of ram_reg_0_255_12_12 : label is "synth_options.dist_mem_inst/gen_sp_ram.spram_inst/ram";
  attribute ram_addr_begin of ram_reg_0_255_12_12 : label is 0;
  attribute ram_addr_end of ram_reg_0_255_12_12 : label is 255;
  attribute ram_offset of ram_reg_0_255_12_12 : label is 0;
  attribute ram_slice_begin of ram_reg_0_255_12_12 : label is 12;
  attribute ram_slice_end of ram_reg_0_255_12_12 : label is 12;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_0_255_13_13 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_0_255_13_13 : label is 16384;
  attribute RTL_RAM_NAME of ram_reg_0_255_13_13 : label is "synth_options.dist_mem_inst/gen_sp_ram.spram_inst/ram";
  attribute ram_addr_begin of ram_reg_0_255_13_13 : label is 0;
  attribute ram_addr_end of ram_reg_0_255_13_13 : label is 255;
  attribute ram_offset of ram_reg_0_255_13_13 : label is 0;
  attribute ram_slice_begin of ram_reg_0_255_13_13 : label is 13;
  attribute ram_slice_end of ram_reg_0_255_13_13 : label is 13;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_0_255_14_14 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_0_255_14_14 : label is 16384;
  attribute RTL_RAM_NAME of ram_reg_0_255_14_14 : label is "synth_options.dist_mem_inst/gen_sp_ram.spram_inst/ram";
  attribute ram_addr_begin of ram_reg_0_255_14_14 : label is 0;
  attribute ram_addr_end of ram_reg_0_255_14_14 : label is 255;
  attribute ram_offset of ram_reg_0_255_14_14 : label is 0;
  attribute ram_slice_begin of ram_reg_0_255_14_14 : label is 14;
  attribute ram_slice_end of ram_reg_0_255_14_14 : label is 14;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_0_255_15_15 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_0_255_15_15 : label is 16384;
  attribute RTL_RAM_NAME of ram_reg_0_255_15_15 : label is "synth_options.dist_mem_inst/gen_sp_ram.spram_inst/ram";
  attribute ram_addr_begin of ram_reg_0_255_15_15 : label is 0;
  attribute ram_addr_end of ram_reg_0_255_15_15 : label is 255;
  attribute ram_offset of ram_reg_0_255_15_15 : label is 0;
  attribute ram_slice_begin of ram_reg_0_255_15_15 : label is 15;
  attribute ram_slice_end of ram_reg_0_255_15_15 : label is 15;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_0_255_16_16 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_0_255_16_16 : label is 16384;
  attribute RTL_RAM_NAME of ram_reg_0_255_16_16 : label is "synth_options.dist_mem_inst/gen_sp_ram.spram_inst/ram";
  attribute ram_addr_begin of ram_reg_0_255_16_16 : label is 0;
  attribute ram_addr_end of ram_reg_0_255_16_16 : label is 255;
  attribute ram_offset of ram_reg_0_255_16_16 : label is 0;
  attribute ram_slice_begin of ram_reg_0_255_16_16 : label is 16;
  attribute ram_slice_end of ram_reg_0_255_16_16 : label is 16;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_0_255_17_17 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_0_255_17_17 : label is 16384;
  attribute RTL_RAM_NAME of ram_reg_0_255_17_17 : label is "synth_options.dist_mem_inst/gen_sp_ram.spram_inst/ram";
  attribute ram_addr_begin of ram_reg_0_255_17_17 : label is 0;
  attribute ram_addr_end of ram_reg_0_255_17_17 : label is 255;
  attribute ram_offset of ram_reg_0_255_17_17 : label is 0;
  attribute ram_slice_begin of ram_reg_0_255_17_17 : label is 17;
  attribute ram_slice_end of ram_reg_0_255_17_17 : label is 17;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_0_255_18_18 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_0_255_18_18 : label is 16384;
  attribute RTL_RAM_NAME of ram_reg_0_255_18_18 : label is "synth_options.dist_mem_inst/gen_sp_ram.spram_inst/ram";
  attribute ram_addr_begin of ram_reg_0_255_18_18 : label is 0;
  attribute ram_addr_end of ram_reg_0_255_18_18 : label is 255;
  attribute ram_offset of ram_reg_0_255_18_18 : label is 0;
  attribute ram_slice_begin of ram_reg_0_255_18_18 : label is 18;
  attribute ram_slice_end of ram_reg_0_255_18_18 : label is 18;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_0_255_19_19 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_0_255_19_19 : label is 16384;
  attribute RTL_RAM_NAME of ram_reg_0_255_19_19 : label is "synth_options.dist_mem_inst/gen_sp_ram.spram_inst/ram";
  attribute ram_addr_begin of ram_reg_0_255_19_19 : label is 0;
  attribute ram_addr_end of ram_reg_0_255_19_19 : label is 255;
  attribute ram_offset of ram_reg_0_255_19_19 : label is 0;
  attribute ram_slice_begin of ram_reg_0_255_19_19 : label is 19;
  attribute ram_slice_end of ram_reg_0_255_19_19 : label is 19;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_0_255_1_1 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_0_255_1_1 : label is 16384;
  attribute RTL_RAM_NAME of ram_reg_0_255_1_1 : label is "synth_options.dist_mem_inst/gen_sp_ram.spram_inst/ram";
  attribute ram_addr_begin of ram_reg_0_255_1_1 : label is 0;
  attribute ram_addr_end of ram_reg_0_255_1_1 : label is 255;
  attribute ram_offset of ram_reg_0_255_1_1 : label is 0;
  attribute ram_slice_begin of ram_reg_0_255_1_1 : label is 1;
  attribute ram_slice_end of ram_reg_0_255_1_1 : label is 1;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_0_255_20_20 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_0_255_20_20 : label is 16384;
  attribute RTL_RAM_NAME of ram_reg_0_255_20_20 : label is "synth_options.dist_mem_inst/gen_sp_ram.spram_inst/ram";
  attribute ram_addr_begin of ram_reg_0_255_20_20 : label is 0;
  attribute ram_addr_end of ram_reg_0_255_20_20 : label is 255;
  attribute ram_offset of ram_reg_0_255_20_20 : label is 0;
  attribute ram_slice_begin of ram_reg_0_255_20_20 : label is 20;
  attribute ram_slice_end of ram_reg_0_255_20_20 : label is 20;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_0_255_21_21 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_0_255_21_21 : label is 16384;
  attribute RTL_RAM_NAME of ram_reg_0_255_21_21 : label is "synth_options.dist_mem_inst/gen_sp_ram.spram_inst/ram";
  attribute ram_addr_begin of ram_reg_0_255_21_21 : label is 0;
  attribute ram_addr_end of ram_reg_0_255_21_21 : label is 255;
  attribute ram_offset of ram_reg_0_255_21_21 : label is 0;
  attribute ram_slice_begin of ram_reg_0_255_21_21 : label is 21;
  attribute ram_slice_end of ram_reg_0_255_21_21 : label is 21;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_0_255_22_22 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_0_255_22_22 : label is 16384;
  attribute RTL_RAM_NAME of ram_reg_0_255_22_22 : label is "synth_options.dist_mem_inst/gen_sp_ram.spram_inst/ram";
  attribute ram_addr_begin of ram_reg_0_255_22_22 : label is 0;
  attribute ram_addr_end of ram_reg_0_255_22_22 : label is 255;
  attribute ram_offset of ram_reg_0_255_22_22 : label is 0;
  attribute ram_slice_begin of ram_reg_0_255_22_22 : label is 22;
  attribute ram_slice_end of ram_reg_0_255_22_22 : label is 22;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_0_255_23_23 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_0_255_23_23 : label is 16384;
  attribute RTL_RAM_NAME of ram_reg_0_255_23_23 : label is "synth_options.dist_mem_inst/gen_sp_ram.spram_inst/ram";
  attribute ram_addr_begin of ram_reg_0_255_23_23 : label is 0;
  attribute ram_addr_end of ram_reg_0_255_23_23 : label is 255;
  attribute ram_offset of ram_reg_0_255_23_23 : label is 0;
  attribute ram_slice_begin of ram_reg_0_255_23_23 : label is 23;
  attribute ram_slice_end of ram_reg_0_255_23_23 : label is 23;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_0_255_24_24 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_0_255_24_24 : label is 16384;
  attribute RTL_RAM_NAME of ram_reg_0_255_24_24 : label is "synth_options.dist_mem_inst/gen_sp_ram.spram_inst/ram";
  attribute ram_addr_begin of ram_reg_0_255_24_24 : label is 0;
  attribute ram_addr_end of ram_reg_0_255_24_24 : label is 255;
  attribute ram_offset of ram_reg_0_255_24_24 : label is 0;
  attribute ram_slice_begin of ram_reg_0_255_24_24 : label is 24;
  attribute ram_slice_end of ram_reg_0_255_24_24 : label is 24;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_0_255_25_25 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_0_255_25_25 : label is 16384;
  attribute RTL_RAM_NAME of ram_reg_0_255_25_25 : label is "synth_options.dist_mem_inst/gen_sp_ram.spram_inst/ram";
  attribute ram_addr_begin of ram_reg_0_255_25_25 : label is 0;
  attribute ram_addr_end of ram_reg_0_255_25_25 : label is 255;
  attribute ram_offset of ram_reg_0_255_25_25 : label is 0;
  attribute ram_slice_begin of ram_reg_0_255_25_25 : label is 25;
  attribute ram_slice_end of ram_reg_0_255_25_25 : label is 25;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_0_255_26_26 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_0_255_26_26 : label is 16384;
  attribute RTL_RAM_NAME of ram_reg_0_255_26_26 : label is "synth_options.dist_mem_inst/gen_sp_ram.spram_inst/ram";
  attribute ram_addr_begin of ram_reg_0_255_26_26 : label is 0;
  attribute ram_addr_end of ram_reg_0_255_26_26 : label is 255;
  attribute ram_offset of ram_reg_0_255_26_26 : label is 0;
  attribute ram_slice_begin of ram_reg_0_255_26_26 : label is 26;
  attribute ram_slice_end of ram_reg_0_255_26_26 : label is 26;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_0_255_27_27 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_0_255_27_27 : label is 16384;
  attribute RTL_RAM_NAME of ram_reg_0_255_27_27 : label is "synth_options.dist_mem_inst/gen_sp_ram.spram_inst/ram";
  attribute ram_addr_begin of ram_reg_0_255_27_27 : label is 0;
  attribute ram_addr_end of ram_reg_0_255_27_27 : label is 255;
  attribute ram_offset of ram_reg_0_255_27_27 : label is 0;
  attribute ram_slice_begin of ram_reg_0_255_27_27 : label is 27;
  attribute ram_slice_end of ram_reg_0_255_27_27 : label is 27;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_0_255_28_28 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_0_255_28_28 : label is 16384;
  attribute RTL_RAM_NAME of ram_reg_0_255_28_28 : label is "synth_options.dist_mem_inst/gen_sp_ram.spram_inst/ram";
  attribute ram_addr_begin of ram_reg_0_255_28_28 : label is 0;
  attribute ram_addr_end of ram_reg_0_255_28_28 : label is 255;
  attribute ram_offset of ram_reg_0_255_28_28 : label is 0;
  attribute ram_slice_begin of ram_reg_0_255_28_28 : label is 28;
  attribute ram_slice_end of ram_reg_0_255_28_28 : label is 28;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_0_255_29_29 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_0_255_29_29 : label is 16384;
  attribute RTL_RAM_NAME of ram_reg_0_255_29_29 : label is "synth_options.dist_mem_inst/gen_sp_ram.spram_inst/ram";
  attribute ram_addr_begin of ram_reg_0_255_29_29 : label is 0;
  attribute ram_addr_end of ram_reg_0_255_29_29 : label is 255;
  attribute ram_offset of ram_reg_0_255_29_29 : label is 0;
  attribute ram_slice_begin of ram_reg_0_255_29_29 : label is 29;
  attribute ram_slice_end of ram_reg_0_255_29_29 : label is 29;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_0_255_2_2 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_0_255_2_2 : label is 16384;
  attribute RTL_RAM_NAME of ram_reg_0_255_2_2 : label is "synth_options.dist_mem_inst/gen_sp_ram.spram_inst/ram";
  attribute ram_addr_begin of ram_reg_0_255_2_2 : label is 0;
  attribute ram_addr_end of ram_reg_0_255_2_2 : label is 255;
  attribute ram_offset of ram_reg_0_255_2_2 : label is 0;
  attribute ram_slice_begin of ram_reg_0_255_2_2 : label is 2;
  attribute ram_slice_end of ram_reg_0_255_2_2 : label is 2;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_0_255_30_30 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_0_255_30_30 : label is 16384;
  attribute RTL_RAM_NAME of ram_reg_0_255_30_30 : label is "synth_options.dist_mem_inst/gen_sp_ram.spram_inst/ram";
  attribute ram_addr_begin of ram_reg_0_255_30_30 : label is 0;
  attribute ram_addr_end of ram_reg_0_255_30_30 : label is 255;
  attribute ram_offset of ram_reg_0_255_30_30 : label is 0;
  attribute ram_slice_begin of ram_reg_0_255_30_30 : label is 30;
  attribute ram_slice_end of ram_reg_0_255_30_30 : label is 30;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_0_255_31_31 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_0_255_31_31 : label is 16384;
  attribute RTL_RAM_NAME of ram_reg_0_255_31_31 : label is "synth_options.dist_mem_inst/gen_sp_ram.spram_inst/ram";
  attribute ram_addr_begin of ram_reg_0_255_31_31 : label is 0;
  attribute ram_addr_end of ram_reg_0_255_31_31 : label is 255;
  attribute ram_offset of ram_reg_0_255_31_31 : label is 0;
  attribute ram_slice_begin of ram_reg_0_255_31_31 : label is 31;
  attribute ram_slice_end of ram_reg_0_255_31_31 : label is 31;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_0_255_3_3 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_0_255_3_3 : label is 16384;
  attribute RTL_RAM_NAME of ram_reg_0_255_3_3 : label is "synth_options.dist_mem_inst/gen_sp_ram.spram_inst/ram";
  attribute ram_addr_begin of ram_reg_0_255_3_3 : label is 0;
  attribute ram_addr_end of ram_reg_0_255_3_3 : label is 255;
  attribute ram_offset of ram_reg_0_255_3_3 : label is 0;
  attribute ram_slice_begin of ram_reg_0_255_3_3 : label is 3;
  attribute ram_slice_end of ram_reg_0_255_3_3 : label is 3;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_0_255_4_4 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_0_255_4_4 : label is 16384;
  attribute RTL_RAM_NAME of ram_reg_0_255_4_4 : label is "synth_options.dist_mem_inst/gen_sp_ram.spram_inst/ram";
  attribute ram_addr_begin of ram_reg_0_255_4_4 : label is 0;
  attribute ram_addr_end of ram_reg_0_255_4_4 : label is 255;
  attribute ram_offset of ram_reg_0_255_4_4 : label is 0;
  attribute ram_slice_begin of ram_reg_0_255_4_4 : label is 4;
  attribute ram_slice_end of ram_reg_0_255_4_4 : label is 4;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_0_255_5_5 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_0_255_5_5 : label is 16384;
  attribute RTL_RAM_NAME of ram_reg_0_255_5_5 : label is "synth_options.dist_mem_inst/gen_sp_ram.spram_inst/ram";
  attribute ram_addr_begin of ram_reg_0_255_5_5 : label is 0;
  attribute ram_addr_end of ram_reg_0_255_5_5 : label is 255;
  attribute ram_offset of ram_reg_0_255_5_5 : label is 0;
  attribute ram_slice_begin of ram_reg_0_255_5_5 : label is 5;
  attribute ram_slice_end of ram_reg_0_255_5_5 : label is 5;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_0_255_6_6 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_0_255_6_6 : label is 16384;
  attribute RTL_RAM_NAME of ram_reg_0_255_6_6 : label is "synth_options.dist_mem_inst/gen_sp_ram.spram_inst/ram";
  attribute ram_addr_begin of ram_reg_0_255_6_6 : label is 0;
  attribute ram_addr_end of ram_reg_0_255_6_6 : label is 255;
  attribute ram_offset of ram_reg_0_255_6_6 : label is 0;
  attribute ram_slice_begin of ram_reg_0_255_6_6 : label is 6;
  attribute ram_slice_end of ram_reg_0_255_6_6 : label is 6;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_0_255_7_7 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_0_255_7_7 : label is 16384;
  attribute RTL_RAM_NAME of ram_reg_0_255_7_7 : label is "synth_options.dist_mem_inst/gen_sp_ram.spram_inst/ram";
  attribute ram_addr_begin of ram_reg_0_255_7_7 : label is 0;
  attribute ram_addr_end of ram_reg_0_255_7_7 : label is 255;
  attribute ram_offset of ram_reg_0_255_7_7 : label is 0;
  attribute ram_slice_begin of ram_reg_0_255_7_7 : label is 7;
  attribute ram_slice_end of ram_reg_0_255_7_7 : label is 7;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_0_255_8_8 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_0_255_8_8 : label is 16384;
  attribute RTL_RAM_NAME of ram_reg_0_255_8_8 : label is "synth_options.dist_mem_inst/gen_sp_ram.spram_inst/ram";
  attribute ram_addr_begin of ram_reg_0_255_8_8 : label is 0;
  attribute ram_addr_end of ram_reg_0_255_8_8 : label is 255;
  attribute ram_offset of ram_reg_0_255_8_8 : label is 0;
  attribute ram_slice_begin of ram_reg_0_255_8_8 : label is 8;
  attribute ram_slice_end of ram_reg_0_255_8_8 : label is 8;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_0_255_9_9 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_0_255_9_9 : label is 16384;
  attribute RTL_RAM_NAME of ram_reg_0_255_9_9 : label is "synth_options.dist_mem_inst/gen_sp_ram.spram_inst/ram";
  attribute ram_addr_begin of ram_reg_0_255_9_9 : label is 0;
  attribute ram_addr_end of ram_reg_0_255_9_9 : label is 255;
  attribute ram_offset of ram_reg_0_255_9_9 : label is 0;
  attribute ram_slice_begin of ram_reg_0_255_9_9 : label is 9;
  attribute ram_slice_end of ram_reg_0_255_9_9 : label is 9;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_256_511_0_0 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_256_511_0_0 : label is 16384;
  attribute RTL_RAM_NAME of ram_reg_256_511_0_0 : label is "synth_options.dist_mem_inst/gen_sp_ram.spram_inst/ram";
  attribute ram_addr_begin of ram_reg_256_511_0_0 : label is 256;
  attribute ram_addr_end of ram_reg_256_511_0_0 : label is 511;
  attribute ram_offset of ram_reg_256_511_0_0 : label is 0;
  attribute ram_slice_begin of ram_reg_256_511_0_0 : label is 0;
  attribute ram_slice_end of ram_reg_256_511_0_0 : label is 0;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_256_511_10_10 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_256_511_10_10 : label is 16384;
  attribute RTL_RAM_NAME of ram_reg_256_511_10_10 : label is "synth_options.dist_mem_inst/gen_sp_ram.spram_inst/ram";
  attribute ram_addr_begin of ram_reg_256_511_10_10 : label is 256;
  attribute ram_addr_end of ram_reg_256_511_10_10 : label is 511;
  attribute ram_offset of ram_reg_256_511_10_10 : label is 0;
  attribute ram_slice_begin of ram_reg_256_511_10_10 : label is 10;
  attribute ram_slice_end of ram_reg_256_511_10_10 : label is 10;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_256_511_11_11 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_256_511_11_11 : label is 16384;
  attribute RTL_RAM_NAME of ram_reg_256_511_11_11 : label is "synth_options.dist_mem_inst/gen_sp_ram.spram_inst/ram";
  attribute ram_addr_begin of ram_reg_256_511_11_11 : label is 256;
  attribute ram_addr_end of ram_reg_256_511_11_11 : label is 511;
  attribute ram_offset of ram_reg_256_511_11_11 : label is 0;
  attribute ram_slice_begin of ram_reg_256_511_11_11 : label is 11;
  attribute ram_slice_end of ram_reg_256_511_11_11 : label is 11;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_256_511_12_12 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_256_511_12_12 : label is 16384;
  attribute RTL_RAM_NAME of ram_reg_256_511_12_12 : label is "synth_options.dist_mem_inst/gen_sp_ram.spram_inst/ram";
  attribute ram_addr_begin of ram_reg_256_511_12_12 : label is 256;
  attribute ram_addr_end of ram_reg_256_511_12_12 : label is 511;
  attribute ram_offset of ram_reg_256_511_12_12 : label is 0;
  attribute ram_slice_begin of ram_reg_256_511_12_12 : label is 12;
  attribute ram_slice_end of ram_reg_256_511_12_12 : label is 12;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_256_511_13_13 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_256_511_13_13 : label is 16384;
  attribute RTL_RAM_NAME of ram_reg_256_511_13_13 : label is "synth_options.dist_mem_inst/gen_sp_ram.spram_inst/ram";
  attribute ram_addr_begin of ram_reg_256_511_13_13 : label is 256;
  attribute ram_addr_end of ram_reg_256_511_13_13 : label is 511;
  attribute ram_offset of ram_reg_256_511_13_13 : label is 0;
  attribute ram_slice_begin of ram_reg_256_511_13_13 : label is 13;
  attribute ram_slice_end of ram_reg_256_511_13_13 : label is 13;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_256_511_14_14 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_256_511_14_14 : label is 16384;
  attribute RTL_RAM_NAME of ram_reg_256_511_14_14 : label is "synth_options.dist_mem_inst/gen_sp_ram.spram_inst/ram";
  attribute ram_addr_begin of ram_reg_256_511_14_14 : label is 256;
  attribute ram_addr_end of ram_reg_256_511_14_14 : label is 511;
  attribute ram_offset of ram_reg_256_511_14_14 : label is 0;
  attribute ram_slice_begin of ram_reg_256_511_14_14 : label is 14;
  attribute ram_slice_end of ram_reg_256_511_14_14 : label is 14;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_256_511_15_15 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_256_511_15_15 : label is 16384;
  attribute RTL_RAM_NAME of ram_reg_256_511_15_15 : label is "synth_options.dist_mem_inst/gen_sp_ram.spram_inst/ram";
  attribute ram_addr_begin of ram_reg_256_511_15_15 : label is 256;
  attribute ram_addr_end of ram_reg_256_511_15_15 : label is 511;
  attribute ram_offset of ram_reg_256_511_15_15 : label is 0;
  attribute ram_slice_begin of ram_reg_256_511_15_15 : label is 15;
  attribute ram_slice_end of ram_reg_256_511_15_15 : label is 15;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_256_511_16_16 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_256_511_16_16 : label is 16384;
  attribute RTL_RAM_NAME of ram_reg_256_511_16_16 : label is "synth_options.dist_mem_inst/gen_sp_ram.spram_inst/ram";
  attribute ram_addr_begin of ram_reg_256_511_16_16 : label is 256;
  attribute ram_addr_end of ram_reg_256_511_16_16 : label is 511;
  attribute ram_offset of ram_reg_256_511_16_16 : label is 0;
  attribute ram_slice_begin of ram_reg_256_511_16_16 : label is 16;
  attribute ram_slice_end of ram_reg_256_511_16_16 : label is 16;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_256_511_17_17 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_256_511_17_17 : label is 16384;
  attribute RTL_RAM_NAME of ram_reg_256_511_17_17 : label is "synth_options.dist_mem_inst/gen_sp_ram.spram_inst/ram";
  attribute ram_addr_begin of ram_reg_256_511_17_17 : label is 256;
  attribute ram_addr_end of ram_reg_256_511_17_17 : label is 511;
  attribute ram_offset of ram_reg_256_511_17_17 : label is 0;
  attribute ram_slice_begin of ram_reg_256_511_17_17 : label is 17;
  attribute ram_slice_end of ram_reg_256_511_17_17 : label is 17;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_256_511_18_18 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_256_511_18_18 : label is 16384;
  attribute RTL_RAM_NAME of ram_reg_256_511_18_18 : label is "synth_options.dist_mem_inst/gen_sp_ram.spram_inst/ram";
  attribute ram_addr_begin of ram_reg_256_511_18_18 : label is 256;
  attribute ram_addr_end of ram_reg_256_511_18_18 : label is 511;
  attribute ram_offset of ram_reg_256_511_18_18 : label is 0;
  attribute ram_slice_begin of ram_reg_256_511_18_18 : label is 18;
  attribute ram_slice_end of ram_reg_256_511_18_18 : label is 18;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_256_511_19_19 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_256_511_19_19 : label is 16384;
  attribute RTL_RAM_NAME of ram_reg_256_511_19_19 : label is "synth_options.dist_mem_inst/gen_sp_ram.spram_inst/ram";
  attribute ram_addr_begin of ram_reg_256_511_19_19 : label is 256;
  attribute ram_addr_end of ram_reg_256_511_19_19 : label is 511;
  attribute ram_offset of ram_reg_256_511_19_19 : label is 0;
  attribute ram_slice_begin of ram_reg_256_511_19_19 : label is 19;
  attribute ram_slice_end of ram_reg_256_511_19_19 : label is 19;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_256_511_1_1 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_256_511_1_1 : label is 16384;
  attribute RTL_RAM_NAME of ram_reg_256_511_1_1 : label is "synth_options.dist_mem_inst/gen_sp_ram.spram_inst/ram";
  attribute ram_addr_begin of ram_reg_256_511_1_1 : label is 256;
  attribute ram_addr_end of ram_reg_256_511_1_1 : label is 511;
  attribute ram_offset of ram_reg_256_511_1_1 : label is 0;
  attribute ram_slice_begin of ram_reg_256_511_1_1 : label is 1;
  attribute ram_slice_end of ram_reg_256_511_1_1 : label is 1;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_256_511_20_20 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_256_511_20_20 : label is 16384;
  attribute RTL_RAM_NAME of ram_reg_256_511_20_20 : label is "synth_options.dist_mem_inst/gen_sp_ram.spram_inst/ram";
  attribute ram_addr_begin of ram_reg_256_511_20_20 : label is 256;
  attribute ram_addr_end of ram_reg_256_511_20_20 : label is 511;
  attribute ram_offset of ram_reg_256_511_20_20 : label is 0;
  attribute ram_slice_begin of ram_reg_256_511_20_20 : label is 20;
  attribute ram_slice_end of ram_reg_256_511_20_20 : label is 20;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_256_511_21_21 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_256_511_21_21 : label is 16384;
  attribute RTL_RAM_NAME of ram_reg_256_511_21_21 : label is "synth_options.dist_mem_inst/gen_sp_ram.spram_inst/ram";
  attribute ram_addr_begin of ram_reg_256_511_21_21 : label is 256;
  attribute ram_addr_end of ram_reg_256_511_21_21 : label is 511;
  attribute ram_offset of ram_reg_256_511_21_21 : label is 0;
  attribute ram_slice_begin of ram_reg_256_511_21_21 : label is 21;
  attribute ram_slice_end of ram_reg_256_511_21_21 : label is 21;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_256_511_22_22 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_256_511_22_22 : label is 16384;
  attribute RTL_RAM_NAME of ram_reg_256_511_22_22 : label is "synth_options.dist_mem_inst/gen_sp_ram.spram_inst/ram";
  attribute ram_addr_begin of ram_reg_256_511_22_22 : label is 256;
  attribute ram_addr_end of ram_reg_256_511_22_22 : label is 511;
  attribute ram_offset of ram_reg_256_511_22_22 : label is 0;
  attribute ram_slice_begin of ram_reg_256_511_22_22 : label is 22;
  attribute ram_slice_end of ram_reg_256_511_22_22 : label is 22;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_256_511_23_23 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_256_511_23_23 : label is 16384;
  attribute RTL_RAM_NAME of ram_reg_256_511_23_23 : label is "synth_options.dist_mem_inst/gen_sp_ram.spram_inst/ram";
  attribute ram_addr_begin of ram_reg_256_511_23_23 : label is 256;
  attribute ram_addr_end of ram_reg_256_511_23_23 : label is 511;
  attribute ram_offset of ram_reg_256_511_23_23 : label is 0;
  attribute ram_slice_begin of ram_reg_256_511_23_23 : label is 23;
  attribute ram_slice_end of ram_reg_256_511_23_23 : label is 23;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_256_511_24_24 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_256_511_24_24 : label is 16384;
  attribute RTL_RAM_NAME of ram_reg_256_511_24_24 : label is "synth_options.dist_mem_inst/gen_sp_ram.spram_inst/ram";
  attribute ram_addr_begin of ram_reg_256_511_24_24 : label is 256;
  attribute ram_addr_end of ram_reg_256_511_24_24 : label is 511;
  attribute ram_offset of ram_reg_256_511_24_24 : label is 0;
  attribute ram_slice_begin of ram_reg_256_511_24_24 : label is 24;
  attribute ram_slice_end of ram_reg_256_511_24_24 : label is 24;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_256_511_25_25 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_256_511_25_25 : label is 16384;
  attribute RTL_RAM_NAME of ram_reg_256_511_25_25 : label is "synth_options.dist_mem_inst/gen_sp_ram.spram_inst/ram";
  attribute ram_addr_begin of ram_reg_256_511_25_25 : label is 256;
  attribute ram_addr_end of ram_reg_256_511_25_25 : label is 511;
  attribute ram_offset of ram_reg_256_511_25_25 : label is 0;
  attribute ram_slice_begin of ram_reg_256_511_25_25 : label is 25;
  attribute ram_slice_end of ram_reg_256_511_25_25 : label is 25;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_256_511_26_26 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_256_511_26_26 : label is 16384;
  attribute RTL_RAM_NAME of ram_reg_256_511_26_26 : label is "synth_options.dist_mem_inst/gen_sp_ram.spram_inst/ram";
  attribute ram_addr_begin of ram_reg_256_511_26_26 : label is 256;
  attribute ram_addr_end of ram_reg_256_511_26_26 : label is 511;
  attribute ram_offset of ram_reg_256_511_26_26 : label is 0;
  attribute ram_slice_begin of ram_reg_256_511_26_26 : label is 26;
  attribute ram_slice_end of ram_reg_256_511_26_26 : label is 26;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_256_511_27_27 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_256_511_27_27 : label is 16384;
  attribute RTL_RAM_NAME of ram_reg_256_511_27_27 : label is "synth_options.dist_mem_inst/gen_sp_ram.spram_inst/ram";
  attribute ram_addr_begin of ram_reg_256_511_27_27 : label is 256;
  attribute ram_addr_end of ram_reg_256_511_27_27 : label is 511;
  attribute ram_offset of ram_reg_256_511_27_27 : label is 0;
  attribute ram_slice_begin of ram_reg_256_511_27_27 : label is 27;
  attribute ram_slice_end of ram_reg_256_511_27_27 : label is 27;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_256_511_28_28 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_256_511_28_28 : label is 16384;
  attribute RTL_RAM_NAME of ram_reg_256_511_28_28 : label is "synth_options.dist_mem_inst/gen_sp_ram.spram_inst/ram";
  attribute ram_addr_begin of ram_reg_256_511_28_28 : label is 256;
  attribute ram_addr_end of ram_reg_256_511_28_28 : label is 511;
  attribute ram_offset of ram_reg_256_511_28_28 : label is 0;
  attribute ram_slice_begin of ram_reg_256_511_28_28 : label is 28;
  attribute ram_slice_end of ram_reg_256_511_28_28 : label is 28;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_256_511_29_29 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_256_511_29_29 : label is 16384;
  attribute RTL_RAM_NAME of ram_reg_256_511_29_29 : label is "synth_options.dist_mem_inst/gen_sp_ram.spram_inst/ram";
  attribute ram_addr_begin of ram_reg_256_511_29_29 : label is 256;
  attribute ram_addr_end of ram_reg_256_511_29_29 : label is 511;
  attribute ram_offset of ram_reg_256_511_29_29 : label is 0;
  attribute ram_slice_begin of ram_reg_256_511_29_29 : label is 29;
  attribute ram_slice_end of ram_reg_256_511_29_29 : label is 29;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_256_511_2_2 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_256_511_2_2 : label is 16384;
  attribute RTL_RAM_NAME of ram_reg_256_511_2_2 : label is "synth_options.dist_mem_inst/gen_sp_ram.spram_inst/ram";
  attribute ram_addr_begin of ram_reg_256_511_2_2 : label is 256;
  attribute ram_addr_end of ram_reg_256_511_2_2 : label is 511;
  attribute ram_offset of ram_reg_256_511_2_2 : label is 0;
  attribute ram_slice_begin of ram_reg_256_511_2_2 : label is 2;
  attribute ram_slice_end of ram_reg_256_511_2_2 : label is 2;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_256_511_30_30 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_256_511_30_30 : label is 16384;
  attribute RTL_RAM_NAME of ram_reg_256_511_30_30 : label is "synth_options.dist_mem_inst/gen_sp_ram.spram_inst/ram";
  attribute ram_addr_begin of ram_reg_256_511_30_30 : label is 256;
  attribute ram_addr_end of ram_reg_256_511_30_30 : label is 511;
  attribute ram_offset of ram_reg_256_511_30_30 : label is 0;
  attribute ram_slice_begin of ram_reg_256_511_30_30 : label is 30;
  attribute ram_slice_end of ram_reg_256_511_30_30 : label is 30;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_256_511_31_31 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_256_511_31_31 : label is 16384;
  attribute RTL_RAM_NAME of ram_reg_256_511_31_31 : label is "synth_options.dist_mem_inst/gen_sp_ram.spram_inst/ram";
  attribute ram_addr_begin of ram_reg_256_511_31_31 : label is 256;
  attribute ram_addr_end of ram_reg_256_511_31_31 : label is 511;
  attribute ram_offset of ram_reg_256_511_31_31 : label is 0;
  attribute ram_slice_begin of ram_reg_256_511_31_31 : label is 31;
  attribute ram_slice_end of ram_reg_256_511_31_31 : label is 31;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_256_511_3_3 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_256_511_3_3 : label is 16384;
  attribute RTL_RAM_NAME of ram_reg_256_511_3_3 : label is "synth_options.dist_mem_inst/gen_sp_ram.spram_inst/ram";
  attribute ram_addr_begin of ram_reg_256_511_3_3 : label is 256;
  attribute ram_addr_end of ram_reg_256_511_3_3 : label is 511;
  attribute ram_offset of ram_reg_256_511_3_3 : label is 0;
  attribute ram_slice_begin of ram_reg_256_511_3_3 : label is 3;
  attribute ram_slice_end of ram_reg_256_511_3_3 : label is 3;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_256_511_4_4 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_256_511_4_4 : label is 16384;
  attribute RTL_RAM_NAME of ram_reg_256_511_4_4 : label is "synth_options.dist_mem_inst/gen_sp_ram.spram_inst/ram";
  attribute ram_addr_begin of ram_reg_256_511_4_4 : label is 256;
  attribute ram_addr_end of ram_reg_256_511_4_4 : label is 511;
  attribute ram_offset of ram_reg_256_511_4_4 : label is 0;
  attribute ram_slice_begin of ram_reg_256_511_4_4 : label is 4;
  attribute ram_slice_end of ram_reg_256_511_4_4 : label is 4;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_256_511_5_5 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_256_511_5_5 : label is 16384;
  attribute RTL_RAM_NAME of ram_reg_256_511_5_5 : label is "synth_options.dist_mem_inst/gen_sp_ram.spram_inst/ram";
  attribute ram_addr_begin of ram_reg_256_511_5_5 : label is 256;
  attribute ram_addr_end of ram_reg_256_511_5_5 : label is 511;
  attribute ram_offset of ram_reg_256_511_5_5 : label is 0;
  attribute ram_slice_begin of ram_reg_256_511_5_5 : label is 5;
  attribute ram_slice_end of ram_reg_256_511_5_5 : label is 5;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_256_511_6_6 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_256_511_6_6 : label is 16384;
  attribute RTL_RAM_NAME of ram_reg_256_511_6_6 : label is "synth_options.dist_mem_inst/gen_sp_ram.spram_inst/ram";
  attribute ram_addr_begin of ram_reg_256_511_6_6 : label is 256;
  attribute ram_addr_end of ram_reg_256_511_6_6 : label is 511;
  attribute ram_offset of ram_reg_256_511_6_6 : label is 0;
  attribute ram_slice_begin of ram_reg_256_511_6_6 : label is 6;
  attribute ram_slice_end of ram_reg_256_511_6_6 : label is 6;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_256_511_7_7 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_256_511_7_7 : label is 16384;
  attribute RTL_RAM_NAME of ram_reg_256_511_7_7 : label is "synth_options.dist_mem_inst/gen_sp_ram.spram_inst/ram";
  attribute ram_addr_begin of ram_reg_256_511_7_7 : label is 256;
  attribute ram_addr_end of ram_reg_256_511_7_7 : label is 511;
  attribute ram_offset of ram_reg_256_511_7_7 : label is 0;
  attribute ram_slice_begin of ram_reg_256_511_7_7 : label is 7;
  attribute ram_slice_end of ram_reg_256_511_7_7 : label is 7;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_256_511_8_8 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_256_511_8_8 : label is 16384;
  attribute RTL_RAM_NAME of ram_reg_256_511_8_8 : label is "synth_options.dist_mem_inst/gen_sp_ram.spram_inst/ram";
  attribute ram_addr_begin of ram_reg_256_511_8_8 : label is 256;
  attribute ram_addr_end of ram_reg_256_511_8_8 : label is 511;
  attribute ram_offset of ram_reg_256_511_8_8 : label is 0;
  attribute ram_slice_begin of ram_reg_256_511_8_8 : label is 8;
  attribute ram_slice_end of ram_reg_256_511_8_8 : label is 8;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_256_511_9_9 : label is "{SYNTH-5 {cell *THIS*}}";
  attribute RTL_RAM_BITS of ram_reg_256_511_9_9 : label is 16384;
  attribute RTL_RAM_NAME of ram_reg_256_511_9_9 : label is "synth_options.dist_mem_inst/gen_sp_ram.spram_inst/ram";
  attribute ram_addr_begin of ram_reg_256_511_9_9 : label is 256;
  attribute ram_addr_end of ram_reg_256_511_9_9 : label is 511;
  attribute ram_offset of ram_reg_256_511_9_9 : label is 0;
  attribute ram_slice_begin of ram_reg_256_511_9_9 : label is 9;
  attribute ram_slice_end of ram_reg_256_511_9_9 : label is 9;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \spo[0]_INST_0\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \spo[10]_INST_0\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \spo[11]_INST_0\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \spo[12]_INST_0\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \spo[13]_INST_0\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \spo[14]_INST_0\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \spo[15]_INST_0\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \spo[16]_INST_0\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \spo[17]_INST_0\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \spo[18]_INST_0\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \spo[19]_INST_0\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \spo[1]_INST_0\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \spo[20]_INST_0\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \spo[21]_INST_0\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \spo[22]_INST_0\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \spo[23]_INST_0\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \spo[24]_INST_0\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \spo[25]_INST_0\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \spo[26]_INST_0\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \spo[27]_INST_0\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \spo[28]_INST_0\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \spo[29]_INST_0\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \spo[2]_INST_0\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \spo[30]_INST_0\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \spo[31]_INST_0\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \spo[3]_INST_0\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \spo[4]_INST_0\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \spo[5]_INST_0\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \spo[6]_INST_0\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \spo[7]_INST_0\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \spo[8]_INST_0\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \spo[9]_INST_0\ : label is "soft_lutpair4";
begin
  spo(31 downto 0) <= \^spo\(31 downto 0);
\qspo_int_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \^spo\(0),
      Q => qspo_int(0),
      R => '0'
    );
\qspo_int_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \^spo\(10),
      Q => qspo_int(10),
      R => '0'
    );
\qspo_int_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \^spo\(11),
      Q => qspo_int(11),
      R => '0'
    );
\qspo_int_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \^spo\(12),
      Q => qspo_int(12),
      R => '0'
    );
\qspo_int_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \^spo\(13),
      Q => qspo_int(13),
      R => '0'
    );
\qspo_int_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \^spo\(14),
      Q => qspo_int(14),
      R => '0'
    );
\qspo_int_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \^spo\(15),
      Q => qspo_int(15),
      R => '0'
    );
\qspo_int_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \^spo\(16),
      Q => qspo_int(16),
      R => '0'
    );
\qspo_int_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \^spo\(17),
      Q => qspo_int(17),
      R => '0'
    );
\qspo_int_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \^spo\(18),
      Q => qspo_int(18),
      R => '0'
    );
\qspo_int_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \^spo\(19),
      Q => qspo_int(19),
      R => '0'
    );
\qspo_int_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \^spo\(1),
      Q => qspo_int(1),
      R => '0'
    );
\qspo_int_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \^spo\(20),
      Q => qspo_int(20),
      R => '0'
    );
\qspo_int_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \^spo\(21),
      Q => qspo_int(21),
      R => '0'
    );
\qspo_int_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \^spo\(22),
      Q => qspo_int(22),
      R => '0'
    );
\qspo_int_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \^spo\(23),
      Q => qspo_int(23),
      R => '0'
    );
\qspo_int_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \^spo\(24),
      Q => qspo_int(24),
      R => '0'
    );
\qspo_int_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \^spo\(25),
      Q => qspo_int(25),
      R => '0'
    );
\qspo_int_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \^spo\(26),
      Q => qspo_int(26),
      R => '0'
    );
\qspo_int_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \^spo\(27),
      Q => qspo_int(27),
      R => '0'
    );
\qspo_int_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \^spo\(28),
      Q => qspo_int(28),
      R => '0'
    );
\qspo_int_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \^spo\(29),
      Q => qspo_int(29),
      R => '0'
    );
\qspo_int_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \^spo\(2),
      Q => qspo_int(2),
      R => '0'
    );
\qspo_int_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \^spo\(30),
      Q => qspo_int(30),
      R => '0'
    );
\qspo_int_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \^spo\(31),
      Q => qspo_int(31),
      R => '0'
    );
\qspo_int_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \^spo\(3),
      Q => qspo_int(3),
      R => '0'
    );
\qspo_int_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \^spo\(4),
      Q => qspo_int(4),
      R => '0'
    );
\qspo_int_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \^spo\(5),
      Q => qspo_int(5),
      R => '0'
    );
\qspo_int_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \^spo\(6),
      Q => qspo_int(6),
      R => '0'
    );
\qspo_int_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \^spo\(7),
      Q => qspo_int(7),
      R => '0'
    );
\qspo_int_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \^spo\(8),
      Q => qspo_int(8),
      R => '0'
    );
\qspo_int_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \^spo\(9),
      Q => qspo_int(9),
      R => '0'
    );
ram_reg_0_255_0_0: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(0),
      O => ram_reg_0_255_0_0_n_0,
      WCLK => clk,
      WE => ram_reg_0_255_0_0_i_1_n_0
    );
ram_reg_0_255_0_0_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => we,
      I1 => a(8),
      O => ram_reg_0_255_0_0_i_1_n_0
    );
ram_reg_0_255_10_10: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"3B0E7024E3F13863863B7FF0E30E31270F86266AE0813AC0FFFF0000FFFF0000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(10),
      O => ram_reg_0_255_10_10_n_0,
      WCLK => clk,
      WE => ram_reg_0_255_0_0_i_1_n_0
    );
ram_reg_0_255_11_11: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"FCEC37388240E4F1B1F89C01E09DF03BE0418120608D23D0FFFFFFFF00000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(11),
      O => ram_reg_0_255_11_11_n_0,
      WCLK => clk,
      WE => ram_reg_0_255_0_0_i_1_n_0
    );
ram_reg_0_255_12_12: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"2086030C10C060860924920820964920861E160A881021005455505014451100"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(12),
      O => ram_reg_0_255_12_12_n_0,
      WCLK => clk,
      WE => ram_reg_0_255_0_0_i_1_n_0
    );
ram_reg_0_255_13_13: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"41041A08008140001041000040040045105FA000000000005000005505445054"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(13),
      O => ram_reg_0_255_13_13_n_0,
      WCLK => clk,
      WE => ram_reg_0_255_0_0_i_1_n_0
    );
ram_reg_0_255_14_14: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"45145228828844144105140000000000001FB760000000005040411504411445"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(14),
      O => ram_reg_0_255_14_14_n_0,
      WCLK => clk,
      WE => ram_reg_0_255_0_0_i_1_n_0
    );
ram_reg_0_255_15_15: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"30016D043B63B1C50DC71D11919968769F0E0142B8119080CC8988DCC8D8D9D8"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(15),
      O => ram_reg_0_255_15_15_n_0,
      WCLK => clk,
      WE => ram_reg_0_255_0_0_i_1_n_0
    );
ram_reg_0_255_16_16: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"C186738C3383E70775F1DC0C719975A78606A16094D83000A5E0A4F5E0E4A4A5"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(16),
      O => ram_reg_0_255_16_16_n_0,
      WCLK => clk,
      WE => ram_reg_0_255_0_0_i_1_n_0
    );
ram_reg_0_255_17_17: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"86196C0E38EE769D1411837D96DF78760571842058018180BF45EE44AA51EB05"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(17),
      O => ram_reg_0_255_17_17_n_0,
      WCLK => clk,
      WE => ram_reg_0_255_0_0_i_1_n_0
    );
ram_reg_0_255_18_18: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"161A6104D32010410416DB6186186826190DB54868103080AAFA4554EFEA4004"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(18),
      O => ram_reg_0_255_18_18_n_0,
      WCLK => clk,
      WE => ram_reg_0_255_0_0_i_1_n_0
    );
ram_reg_0_255_19_19: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"B0586D341001A0C169909809809B6016420D160288182180BBAFFEFB44100555"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(19),
      O => ram_reg_0_255_19_19_n_0,
      WCLK => clk,
      WE => ram_reg_0_255_0_0_i_1_n_0
    );
ram_reg_0_255_1_1: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(1),
      O => ram_reg_0_255_1_1_n_0,
      WCLK => clk,
      WE => ram_reg_0_255_0_0_i_1_n_0
    );
ram_reg_0_255_20_20: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"201A08001340A09A49800220A01A61A61A660608E0C0210031202ACA0A62E077"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(20),
      O => ram_reg_0_255_20_20_n_0,
      WCLK => clk,
      WE => ram_reg_0_255_0_0_i_1_n_0
    );
ram_reg_0_255_21_21: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"80080900C10D061A09A2980826024882104E916AC891A000187B4F2FF429EC0D"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(21),
      O => ram_reg_0_255_21_21_n_0,
      WCLK => clk,
      WE => ram_reg_0_255_0_0_i_1_n_0
    );
ram_reg_0_255_22_22: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"001208345244A20228A00A68A49200A61A4FABAA622F49EA3A7BBE7B5D72CE96"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(22),
      O => ram_reg_0_255_22_22_n_0,
      WCLK => clk,
      WE => ram_reg_0_255_0_0_i_1_n_0
    );
ram_reg_0_255_23_23: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"A60860300041A28A48229200000801040A03F024E003B737A27F9016AACDD379"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(23),
      O => ram_reg_0_255_23_23_n_0,
      WCLK => clk,
      WE => ram_reg_0_255_0_0_i_1_n_0
    );
ram_reg_0_255_24_24: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"A49020308208008A60A60041040A21A6982B57E9211101A0C26AE1F6AF2CA16C"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(24),
      O => ram_reg_0_255_24_24_n_0,
      WCLK => clk,
      WE => ram_reg_0_255_0_0_i_1_n_0
    );
ram_reg_0_255_25_25: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"869805009249068809A20241068848A01A201BA01D809520B4F2C01DF155F2EF"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(25),
      O => ram_reg_0_255_25_25_n_0,
      WCLK => clk,
      WE => ram_reg_0_255_0_0_i_1_n_0
    );
ram_reg_0_255_26_26: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"82120100000C249021868261021A0824100FDBA0049BA5204186566DA867A6AF"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(26),
      O => ram_reg_0_255_26_26_n_0,
      WCLK => clk,
      WE => ram_reg_0_255_0_0_i_1_n_0
    );
ram_reg_0_255_27_27: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"001828245141228021801028A29A48A4080000157912A520C9B1AAC3B1DD87B3"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(27),
      O => ram_reg_0_255_27_27_n_0,
      WCLK => clk,
      WE => ram_reg_0_255_0_0_i_1_n_0
    );
ram_reg_0_255_28_28: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"E796131C71CAE39C50C10C11431C51C79E7FDBB57D9BB5A08C98F029F0DAB18C"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(28),
      O => ram_reg_0_255_28_28_n_0,
      WCLK => clk,
      WE => ram_reg_0_255_0_0_i_1_n_0
    );
ram_reg_0_255_29_29: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"A29201149148A49860020000841861820060000000C1000AE881C5B24D92772B"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(29),
      O => ram_reg_0_255_29_29_n_0,
      WCLK => clk,
      WE => ram_reg_0_255_0_0_i_1_n_0
    );
ram_reg_0_255_2_2: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"492492492492492492492492492492492490489503A74E7F5555555555555555"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(2),
      O => ram_reg_0_255_2_2_n_0,
      WCLK => clk,
      WE => ram_reg_0_255_0_0_i_1_n_0
    );
ram_reg_0_255_30_30: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"860024204105021208208A49229209A09A0FDBB57953252AE1016D5A87CB7353"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(30),
      O => ram_reg_0_255_30_30_n_0,
      WCLK => clk,
      WE => ram_reg_0_255_0_0_i_1_n_0
    );
ram_reg_0_255_31_31: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"82180C00C00C001861800800041060800840000000808000F1CFD475F39526F7"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(31),
      O => ram_reg_0_255_31_31_n_0,
      WCLK => clk,
      WE => ram_reg_0_255_0_0_i_1_n_0
    );
ram_reg_0_255_3_3: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"00000000000000000000000000000000000048950102063F0000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(3),
      O => ram_reg_0_255_3_3_n_0,
      WCLK => clk,
      WE => ram_reg_0_255_0_0_i_1_n_0
    );
ram_reg_0_255_4_4: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"DB6DB6DB6DB6DB6DB6DB6DB6DB6DB6DB6DB00000066CD8C0FFFFFFFFFFFFFFFF"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(4),
      O => ram_reg_0_255_4_4_n_0,
      WCLK => clk,
      WE => ram_reg_0_255_0_0_i_1_n_0
    );
ram_reg_0_255_5_5: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"69A69B4D34D369A69A69A69A69A69A69A69FFFFFFBB76F7F5555555555555555"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(5),
      O => ram_reg_0_255_5_5_n_0,
      WCLK => clk,
      WE => ram_reg_0_255_0_0_i_1_n_0
    );
ram_reg_0_255_6_6: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"20820104104020820820820820820820820FFFFFF993273F0000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(6),
      O => ram_reg_0_255_6_6_n_0,
      WCLK => clk,
      WE => ram_reg_0_255_0_0_i_1_n_0
    );
ram_reg_0_255_7_7: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"1C01B6208FB9DC7187C30D80D81DB11F1DC000000081D8C0CCCCCCCCCCCCCCCC"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(7),
      O => ram_reg_0_255_7_7_n_0,
      WCLK => clk,
      WE => ram_reg_0_255_0_0_i_1_n_0
    );
ram_reg_0_255_8_8: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"C01070E08381C701F6DC7C071C1DB6C710400000066D1A00F0F0F0F0F0F0F0F0"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(8),
      O => ram_reg_0_255_8_8_n_0,
      WCLK => clk,
      WE => ram_reg_0_255_0_0_i_1_n_0
    );
ram_reg_0_255_9_9: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"E38FB6038E3E3F9F8E3893FFFBFFF93F83BA82202880E0D0FF00FF00FF00FF00"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(9),
      O => ram_reg_0_255_9_9_n_0,
      WCLK => clk,
      WE => ram_reg_0_255_0_0_i_1_n_0
    );
ram_reg_256_511_0_0: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"00000000000001FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(0),
      O => ram_reg_256_511_0_0_n_0,
      WCLK => clk,
      WE => ram_reg_256_511_0_0_i_1_n_0
    );
ram_reg_256_511_0_0_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => we,
      I1 => a(8),
      O => ram_reg_256_511_0_0_i_1_n_0
    );
ram_reg_256_511_10_10: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"00000000000000001C83C12063F1C7024EE46FC6E303CE1C727127124E240FC6"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(10),
      O => ram_reg_256_511_10_10_n_0,
      WCLK => clk,
      WE => ram_reg_256_511_0_0_i_1_n_0
    );
ram_reg_256_511_11_11: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"00000000000000011BEE40248C46200E470080703F6DCF1B11C6278047F883F1"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(11),
      O => ram_reg_256_511_11_11_n_0,
      WCLK => clk,
      WE => ram_reg_256_511_0_0_i_1_n_0
    );
ram_reg_256_511_12_12: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"00000000000000010C30C36182182C1041058208611041040218208043041018"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(12),
      O => ram_reg_256_511_12_12_n_0,
      WCLK => clk,
      WE => ram_reg_256_511_0_0_i_1_n_0
    );
ram_reg_256_511_13_13: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"00000000000000000000000100100820820804104120820824100000000820C0"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(13),
      O => ram_reg_256_511_13_13_n_0,
      WCLK => clk,
      WE => ram_reg_256_511_0_0_i_1_n_0
    );
ram_reg_256_511_14_14: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"000000000000000020820805105108820820104104028A28A451041008208201"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(14),
      O => ram_reg_256_511_14_14_n_0,
      WCLK => clk,
      WE => ram_reg_256_511_0_0_i_1_n_0
    );
ram_reg_256_511_15_15: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"00000000000000010A30AE61C1103A38CE3FDD7861302080D865D7C78E3EEB9C"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(15),
      O => ram_reg_256_511_15_15_n_0,
      WCLK => clk,
      WE => ram_reg_256_511_0_0_i_1_n_0
    );
ram_reg_256_511_16_16: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"00000000000000003A308277C119BADB60869B6400C3E3BCE669B0D8638CE8F5"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(16),
      O => ram_reg_256_511_16_16_n_0,
      WCLK => clk,
      WE => ram_reg_256_511_0_0_i_1_n_0
    );
ram_reg_256_511_17_17: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000025B2D361809F087033EEB9C479E13BE23E3D746707E33EE89D"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(17),
      O => ram_reg_256_511_17_17_n_0,
      WCLK => clk,
      WE => ram_reg_256_511_0_0_i_1_n_0
    );
ram_reg_256_511_18_18: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"000000000000000034130000436982104D805B0586134C30C26826804D001B04"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(18),
      O => ram_reg_256_511_18_18_n_0,
      WCLK => clk,
      WE => ram_reg_256_511_0_0_i_1_n_0
    );
ram_reg_256_511_19_19: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"000000000000000036D800201A0400180C00026036CB4C32030426000DB41369"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(19),
      O => ram_reg_256_511_19_19_n_0,
      WCLK => clk,
      WE => ram_reg_256_511_0_0_i_1_n_0
    );
ram_reg_256_511_1_1: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"00000000000001FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(1),
      O => ram_reg_256_511_1_1_n_0,
      WCLK => clk,
      WE => ram_reg_256_511_0_0_i_1_n_0
    );
ram_reg_256_511_20_20: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"000000000000012004034D869A0024D00C069A6180834100C16C30C220B61B48"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(20),
      O => ram_reg_256_511_20_20_n_0,
      WCLK => clk,
      WE => ram_reg_256_511_0_0_i_1_n_0
    );
ram_reg_256_511_21_21: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"000000000000002004C205248A0034504536124880414D00884026984D20D109"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(21),
      O => ram_reg_256_511_21_21_n_0,
      WCLK => clk,
      WE => ram_reg_256_511_0_0_i_1_n_0
    );
ram_reg_256_511_22_22: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000061348244060241300241368841061340241B4D94526CB6DB69"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(22),
      O => ram_reg_256_511_22_22_n_0,
      WCLK => clk,
      WE => ram_reg_256_511_0_0_i_1_n_0
    );
ram_reg_256_511_23_23: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"000000000000002010410482820034C301208A2884C20C000124944904105168"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(23),
      O => ram_reg_256_511_23_23_n_0,
      WCLK => clk,
      WE => ram_reg_256_511_0_0_i_1_n_0
    );
ram_reg_256_511_24_24: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"000000000000002834D30D02180820520026104124500C149A48841305208240"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(24),
      O => ram_reg_256_511_24_24_n_0,
      WCLK => clk,
      WE => ram_reg_256_511_0_0_i_1_n_0
    );
ram_reg_256_511_25_25: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000020248205A01A20B4820D141A6000C10D105A21049205205221"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(25),
      O => ram_reg_256_511_25_25_n_0,
      WCLK => clk,
      WE => ram_reg_256_511_0_0_i_1_n_0
    );
ram_reg_256_511_26_26: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000020209249221848B4C30C30820102D14110810C36C00C34D060"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(26),
      O => ram_reg_256_511_26_26_n_0,
      WCLK => clk,
      WE => ram_reg_256_511_0_0_i_1_n_0
    );
ram_reg_256_511_27_27: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"000000000000002030C30C049A49344108101808265145108821000969A65B40"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(27),
      O => ram_reg_256_511_27_27_n_0,
      WCLK => clk,
      WE => ram_reg_256_511_0_0_i_1_n_0
    );
ram_reg_256_511_28_28: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"000000000000002018A287C504314872C72F8E7865B1CB187470411C8A1861D9"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(28),
      O => ram_reg_256_511_28_28_n_0,
      WCLK => clk,
      WE => ram_reg_256_511_0_0_i_1_n_0
    );
ram_reg_256_511_29_29: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"000000000000002020410480006030C30006006100C00C34C269229A49145248"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(29),
      O => ram_reg_256_511_29_29_n_0,
      WCLK => clk,
      WE => ram_reg_256_511_0_0_i_1_n_0
    );
ram_reg_256_511_2_2: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"000000000000005A492492492492492492492492492492492492492492492492"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(2),
      O => ram_reg_256_511_2_2_n_0,
      WCLK => clk,
      WE => ram_reg_256_511_0_0_i_1_n_0
    );
ram_reg_256_511_30_30: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000020104109060020108100340040008308208061040204208141"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(30),
      O => ram_reg_256_511_30_30_n_0,
      WCLK => clk,
      WE => ram_reg_256_511_0_0_i_1_n_0
    );
ram_reg_256_511_31_31: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"000000000000002020820900080080C308300041864204108001040A0030C300"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(31),
      O => ram_reg_256_511_31_31_n_0,
      WCLK => clk,
      WE => ram_reg_256_511_0_0_i_1_n_0
    );
ram_reg_256_511_3_3: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000048000000000000000000000000000000000000000000000000"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(3),
      O => ram_reg_256_511_3_3_n_0,
      WCLK => clk,
      WE => ram_reg_256_511_0_0_i_1_n_0
    );
ram_reg_256_511_4_4: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"00000000000001B6DB6DB6DB6DB6DB6DB6DB6DB6DB6DB6DB6DB6DB6DB6DB6DB6"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(4),
      O => ram_reg_256_511_4_4_n_0,
      WCLK => clk,
      WE => ram_reg_256_511_0_0_i_1_n_0
    );
ram_reg_256_511_5_5: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"000000000000015B4D34D369A69A6D34D34DA69A69B4D34D369A69A6D34D34DA"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(5),
      O => ram_reg_256_511_5_5_n_0,
      WCLK => clk,
      WE => ram_reg_256_511_0_0_i_1_n_0
    );
ram_reg_256_511_6_6: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000149041040208208041041008208201041040208208041041008"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(6),
      O => ram_reg_256_511_6_6_n_0,
      WCLK => clk,
      WE => ram_reg_256_511_0_0_i_1_n_0
    );
ram_reg_256_511_7_7: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"00000000000000002302370471801B0E0E1F7DB1048230C07C36DB71861BED87"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(7),
      O => ram_reg_256_511_7_7_n_0,
      WCLK => clk,
      WE => ram_reg_256_511_0_0_i_1_n_0
    );
ram_reg_256_511_8_8: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"00000000000000001B02001F7181FB6FB8C71DF600E1B8F8F071DC7C38E0EC36"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(8),
      O => ram_reg_256_511_8_8_n_0,
      WCLK => clk,
      WE => ram_reg_256_511_0_0_i_1_n_0
    );
ram_reg_256_511_9_9: unisim.vcomponents.RAM256X1S
    generic map(
      INIT => X"0000000000000036FB63B8E09FC93803BEDCF239E48FB81B9FBE2781B83BEC0F"
    )
        port map (
      A(7 downto 0) => a(7 downto 0),
      D => d(9),
      O => ram_reg_256_511_9_9_n_0,
      WCLK => clk,
      WE => ram_reg_256_511_0_0_i_1_n_0
    );
\spo[0]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ram_reg_256_511_0_0_n_0,
      I1 => a(8),
      I2 => ram_reg_0_255_0_0_n_0,
      O => \^spo\(0)
    );
\spo[10]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ram_reg_256_511_10_10_n_0,
      I1 => a(8),
      I2 => ram_reg_0_255_10_10_n_0,
      O => \^spo\(10)
    );
\spo[11]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ram_reg_256_511_11_11_n_0,
      I1 => a(8),
      I2 => ram_reg_0_255_11_11_n_0,
      O => \^spo\(11)
    );
\spo[12]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ram_reg_256_511_12_12_n_0,
      I1 => a(8),
      I2 => ram_reg_0_255_12_12_n_0,
      O => \^spo\(12)
    );
\spo[13]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ram_reg_256_511_13_13_n_0,
      I1 => a(8),
      I2 => ram_reg_0_255_13_13_n_0,
      O => \^spo\(13)
    );
\spo[14]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ram_reg_256_511_14_14_n_0,
      I1 => a(8),
      I2 => ram_reg_0_255_14_14_n_0,
      O => \^spo\(14)
    );
\spo[15]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ram_reg_256_511_15_15_n_0,
      I1 => a(8),
      I2 => ram_reg_0_255_15_15_n_0,
      O => \^spo\(15)
    );
\spo[16]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ram_reg_256_511_16_16_n_0,
      I1 => a(8),
      I2 => ram_reg_0_255_16_16_n_0,
      O => \^spo\(16)
    );
\spo[17]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ram_reg_256_511_17_17_n_0,
      I1 => a(8),
      I2 => ram_reg_0_255_17_17_n_0,
      O => \^spo\(17)
    );
\spo[18]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ram_reg_256_511_18_18_n_0,
      I1 => a(8),
      I2 => ram_reg_0_255_18_18_n_0,
      O => \^spo\(18)
    );
\spo[19]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ram_reg_256_511_19_19_n_0,
      I1 => a(8),
      I2 => ram_reg_0_255_19_19_n_0,
      O => \^spo\(19)
    );
\spo[1]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ram_reg_256_511_1_1_n_0,
      I1 => a(8),
      I2 => ram_reg_0_255_1_1_n_0,
      O => \^spo\(1)
    );
\spo[20]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ram_reg_256_511_20_20_n_0,
      I1 => a(8),
      I2 => ram_reg_0_255_20_20_n_0,
      O => \^spo\(20)
    );
\spo[21]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ram_reg_256_511_21_21_n_0,
      I1 => a(8),
      I2 => ram_reg_0_255_21_21_n_0,
      O => \^spo\(21)
    );
\spo[22]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ram_reg_256_511_22_22_n_0,
      I1 => a(8),
      I2 => ram_reg_0_255_22_22_n_0,
      O => \^spo\(22)
    );
\spo[23]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ram_reg_256_511_23_23_n_0,
      I1 => a(8),
      I2 => ram_reg_0_255_23_23_n_0,
      O => \^spo\(23)
    );
\spo[24]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ram_reg_256_511_24_24_n_0,
      I1 => a(8),
      I2 => ram_reg_0_255_24_24_n_0,
      O => \^spo\(24)
    );
\spo[25]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ram_reg_256_511_25_25_n_0,
      I1 => a(8),
      I2 => ram_reg_0_255_25_25_n_0,
      O => \^spo\(25)
    );
\spo[26]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ram_reg_256_511_26_26_n_0,
      I1 => a(8),
      I2 => ram_reg_0_255_26_26_n_0,
      O => \^spo\(26)
    );
\spo[27]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ram_reg_256_511_27_27_n_0,
      I1 => a(8),
      I2 => ram_reg_0_255_27_27_n_0,
      O => \^spo\(27)
    );
\spo[28]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ram_reg_256_511_28_28_n_0,
      I1 => a(8),
      I2 => ram_reg_0_255_28_28_n_0,
      O => \^spo\(28)
    );
\spo[29]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ram_reg_256_511_29_29_n_0,
      I1 => a(8),
      I2 => ram_reg_0_255_29_29_n_0,
      O => \^spo\(29)
    );
\spo[2]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ram_reg_256_511_2_2_n_0,
      I1 => a(8),
      I2 => ram_reg_0_255_2_2_n_0,
      O => \^spo\(2)
    );
\spo[30]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ram_reg_256_511_30_30_n_0,
      I1 => a(8),
      I2 => ram_reg_0_255_30_30_n_0,
      O => \^spo\(30)
    );
\spo[31]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ram_reg_256_511_31_31_n_0,
      I1 => a(8),
      I2 => ram_reg_0_255_31_31_n_0,
      O => \^spo\(31)
    );
\spo[3]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ram_reg_256_511_3_3_n_0,
      I1 => a(8),
      I2 => ram_reg_0_255_3_3_n_0,
      O => \^spo\(3)
    );
\spo[4]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ram_reg_256_511_4_4_n_0,
      I1 => a(8),
      I2 => ram_reg_0_255_4_4_n_0,
      O => \^spo\(4)
    );
\spo[5]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ram_reg_256_511_5_5_n_0,
      I1 => a(8),
      I2 => ram_reg_0_255_5_5_n_0,
      O => \^spo\(5)
    );
\spo[6]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ram_reg_256_511_6_6_n_0,
      I1 => a(8),
      I2 => ram_reg_0_255_6_6_n_0,
      O => \^spo\(6)
    );
\spo[7]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ram_reg_256_511_7_7_n_0,
      I1 => a(8),
      I2 => ram_reg_0_255_7_7_n_0,
      O => \^spo\(7)
    );
\spo[8]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ram_reg_256_511_8_8_n_0,
      I1 => a(8),
      I2 => ram_reg_0_255_8_8_n_0,
      O => \^spo\(8)
    );
\spo[9]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => ram_reg_256_511_9_9_n_0,
      I1 => a(8),
      I2 => ram_reg_0_255_9_9_n_0,
      O => \^spo\(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dist_mem_gen_v8_0_13_synth is
  port (
    spo : out STD_LOGIC_VECTOR ( 31 downto 0 );
    we : in STD_LOGIC;
    a : in STD_LOGIC_VECTOR ( 8 downto 0 );
    clk : in STD_LOGIC;
    d : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dist_mem_gen_v8_0_13_synth;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dist_mem_gen_v8_0_13_synth is
begin
\gen_sp_ram.spram_inst\: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_spram
     port map (
      a(8 downto 0) => a(8 downto 0),
      clk => clk,
      d(31 downto 0) => d(31 downto 0),
      spo(31 downto 0) => spo(31 downto 0),
      we => we
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dist_mem_gen_v8_0_13 is
  port (
    a : in STD_LOGIC_VECTOR ( 8 downto 0 );
    d : in STD_LOGIC_VECTOR ( 31 downto 0 );
    dpra : in STD_LOGIC_VECTOR ( 8 downto 0 );
    clk : in STD_LOGIC;
    we : in STD_LOGIC;
    i_ce : in STD_LOGIC;
    qspo_ce : in STD_LOGIC;
    qdpo_ce : in STD_LOGIC;
    qdpo_clk : in STD_LOGIC;
    qspo_rst : in STD_LOGIC;
    qdpo_rst : in STD_LOGIC;
    qspo_srst : in STD_LOGIC;
    qdpo_srst : in STD_LOGIC;
    spo : out STD_LOGIC_VECTOR ( 31 downto 0 );
    dpo : out STD_LOGIC_VECTOR ( 31 downto 0 );
    qspo : out STD_LOGIC_VECTOR ( 31 downto 0 );
    qdpo : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  attribute C_ADDR_WIDTH : integer;
  attribute C_ADDR_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dist_mem_gen_v8_0_13 : entity is 9;
  attribute C_DEFAULT_DATA : string;
  attribute C_DEFAULT_DATA of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dist_mem_gen_v8_0_13 : entity is "0";
  attribute C_DEPTH : integer;
  attribute C_DEPTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dist_mem_gen_v8_0_13 : entity is 512;
  attribute C_ELABORATION_DIR : string;
  attribute C_ELABORATION_DIR of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dist_mem_gen_v8_0_13 : entity is "./";
  attribute C_FAMILY : string;
  attribute C_FAMILY of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dist_mem_gen_v8_0_13 : entity is "artix7";
  attribute C_HAS_CLK : integer;
  attribute C_HAS_CLK of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dist_mem_gen_v8_0_13 : entity is 1;
  attribute C_HAS_D : integer;
  attribute C_HAS_D of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dist_mem_gen_v8_0_13 : entity is 1;
  attribute C_HAS_DPO : integer;
  attribute C_HAS_DPO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_HAS_DPRA : integer;
  attribute C_HAS_DPRA of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_HAS_I_CE : integer;
  attribute C_HAS_I_CE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_HAS_QDPO : integer;
  attribute C_HAS_QDPO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_HAS_QDPO_CE : integer;
  attribute C_HAS_QDPO_CE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_HAS_QDPO_CLK : integer;
  attribute C_HAS_QDPO_CLK of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_HAS_QDPO_RST : integer;
  attribute C_HAS_QDPO_RST of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_HAS_QDPO_SRST : integer;
  attribute C_HAS_QDPO_SRST of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_HAS_QSPO : integer;
  attribute C_HAS_QSPO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_HAS_QSPO_CE : integer;
  attribute C_HAS_QSPO_CE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_HAS_QSPO_RST : integer;
  attribute C_HAS_QSPO_RST of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_HAS_QSPO_SRST : integer;
  attribute C_HAS_QSPO_SRST of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_HAS_SPO : integer;
  attribute C_HAS_SPO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dist_mem_gen_v8_0_13 : entity is 1;
  attribute C_HAS_WE : integer;
  attribute C_HAS_WE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dist_mem_gen_v8_0_13 : entity is 1;
  attribute C_MEM_INIT_FILE : string;
  attribute C_MEM_INIT_FILE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dist_mem_gen_v8_0_13 : entity is "INST_MEM.mif";
  attribute C_MEM_TYPE : integer;
  attribute C_MEM_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dist_mem_gen_v8_0_13 : entity is 1;
  attribute C_PARSER_TYPE : integer;
  attribute C_PARSER_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dist_mem_gen_v8_0_13 : entity is 1;
  attribute C_PIPELINE_STAGES : integer;
  attribute C_PIPELINE_STAGES of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_QCE_JOINED : integer;
  attribute C_QCE_JOINED of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_QUALIFY_WE : integer;
  attribute C_QUALIFY_WE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_READ_MIF : integer;
  attribute C_READ_MIF of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dist_mem_gen_v8_0_13 : entity is 1;
  attribute C_REG_A_D_INPUTS : integer;
  attribute C_REG_A_D_INPUTS of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_REG_DPRA_INPUT : integer;
  attribute C_REG_DPRA_INPUT of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dist_mem_gen_v8_0_13 : entity is 0;
  attribute C_SYNC_ENABLE : integer;
  attribute C_SYNC_ENABLE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dist_mem_gen_v8_0_13 : entity is 1;
  attribute C_WIDTH : integer;
  attribute C_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dist_mem_gen_v8_0_13 : entity is 32;
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dist_mem_gen_v8_0_13;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dist_mem_gen_v8_0_13 is
  signal \<const0>\ : STD_LOGIC;
begin
  dpo(31) <= \<const0>\;
  dpo(30) <= \<const0>\;
  dpo(29) <= \<const0>\;
  dpo(28) <= \<const0>\;
  dpo(27) <= \<const0>\;
  dpo(26) <= \<const0>\;
  dpo(25) <= \<const0>\;
  dpo(24) <= \<const0>\;
  dpo(23) <= \<const0>\;
  dpo(22) <= \<const0>\;
  dpo(21) <= \<const0>\;
  dpo(20) <= \<const0>\;
  dpo(19) <= \<const0>\;
  dpo(18) <= \<const0>\;
  dpo(17) <= \<const0>\;
  dpo(16) <= \<const0>\;
  dpo(15) <= \<const0>\;
  dpo(14) <= \<const0>\;
  dpo(13) <= \<const0>\;
  dpo(12) <= \<const0>\;
  dpo(11) <= \<const0>\;
  dpo(10) <= \<const0>\;
  dpo(9) <= \<const0>\;
  dpo(8) <= \<const0>\;
  dpo(7) <= \<const0>\;
  dpo(6) <= \<const0>\;
  dpo(5) <= \<const0>\;
  dpo(4) <= \<const0>\;
  dpo(3) <= \<const0>\;
  dpo(2) <= \<const0>\;
  dpo(1) <= \<const0>\;
  dpo(0) <= \<const0>\;
  qdpo(31) <= \<const0>\;
  qdpo(30) <= \<const0>\;
  qdpo(29) <= \<const0>\;
  qdpo(28) <= \<const0>\;
  qdpo(27) <= \<const0>\;
  qdpo(26) <= \<const0>\;
  qdpo(25) <= \<const0>\;
  qdpo(24) <= \<const0>\;
  qdpo(23) <= \<const0>\;
  qdpo(22) <= \<const0>\;
  qdpo(21) <= \<const0>\;
  qdpo(20) <= \<const0>\;
  qdpo(19) <= \<const0>\;
  qdpo(18) <= \<const0>\;
  qdpo(17) <= \<const0>\;
  qdpo(16) <= \<const0>\;
  qdpo(15) <= \<const0>\;
  qdpo(14) <= \<const0>\;
  qdpo(13) <= \<const0>\;
  qdpo(12) <= \<const0>\;
  qdpo(11) <= \<const0>\;
  qdpo(10) <= \<const0>\;
  qdpo(9) <= \<const0>\;
  qdpo(8) <= \<const0>\;
  qdpo(7) <= \<const0>\;
  qdpo(6) <= \<const0>\;
  qdpo(5) <= \<const0>\;
  qdpo(4) <= \<const0>\;
  qdpo(3) <= \<const0>\;
  qdpo(2) <= \<const0>\;
  qdpo(1) <= \<const0>\;
  qdpo(0) <= \<const0>\;
  qspo(31) <= \<const0>\;
  qspo(30) <= \<const0>\;
  qspo(29) <= \<const0>\;
  qspo(28) <= \<const0>\;
  qspo(27) <= \<const0>\;
  qspo(26) <= \<const0>\;
  qspo(25) <= \<const0>\;
  qspo(24) <= \<const0>\;
  qspo(23) <= \<const0>\;
  qspo(22) <= \<const0>\;
  qspo(21) <= \<const0>\;
  qspo(20) <= \<const0>\;
  qspo(19) <= \<const0>\;
  qspo(18) <= \<const0>\;
  qspo(17) <= \<const0>\;
  qspo(16) <= \<const0>\;
  qspo(15) <= \<const0>\;
  qspo(14) <= \<const0>\;
  qspo(13) <= \<const0>\;
  qspo(12) <= \<const0>\;
  qspo(11) <= \<const0>\;
  qspo(10) <= \<const0>\;
  qspo(9) <= \<const0>\;
  qspo(8) <= \<const0>\;
  qspo(7) <= \<const0>\;
  qspo(6) <= \<const0>\;
  qspo(5) <= \<const0>\;
  qspo(4) <= \<const0>\;
  qspo(3) <= \<const0>\;
  qspo(2) <= \<const0>\;
  qspo(1) <= \<const0>\;
  qspo(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
\synth_options.dist_mem_inst\: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dist_mem_gen_v8_0_13_synth
     port map (
      a(8 downto 0) => a(8 downto 0),
      clk => clk,
      d(31 downto 0) => d(31 downto 0),
      spo(31 downto 0) => spo(31 downto 0),
      we => we
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    a : in STD_LOGIC_VECTOR ( 8 downto 0 );
    d : in STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    we : in STD_LOGIC;
    spo : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "INST_MEM,dist_mem_gen_v8_0_13,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "dist_mem_gen_v8_0_13,Vivado 2019.2";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  signal NLW_U0_dpo_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_U0_qdpo_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_U0_qspo_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  attribute C_FAMILY : string;
  attribute C_FAMILY of U0 : label is "artix7";
  attribute C_HAS_CLK : integer;
  attribute C_HAS_CLK of U0 : label is 1;
  attribute C_HAS_D : integer;
  attribute C_HAS_D of U0 : label is 1;
  attribute C_HAS_DPO : integer;
  attribute C_HAS_DPO of U0 : label is 0;
  attribute C_HAS_DPRA : integer;
  attribute C_HAS_DPRA of U0 : label is 0;
  attribute C_HAS_QDPO : integer;
  attribute C_HAS_QDPO of U0 : label is 0;
  attribute C_HAS_QDPO_CE : integer;
  attribute C_HAS_QDPO_CE of U0 : label is 0;
  attribute C_HAS_QDPO_CLK : integer;
  attribute C_HAS_QDPO_CLK of U0 : label is 0;
  attribute C_HAS_QDPO_RST : integer;
  attribute C_HAS_QDPO_RST of U0 : label is 0;
  attribute C_HAS_QDPO_SRST : integer;
  attribute C_HAS_QDPO_SRST of U0 : label is 0;
  attribute C_HAS_WE : integer;
  attribute C_HAS_WE of U0 : label is 1;
  attribute C_MEM_TYPE : integer;
  attribute C_MEM_TYPE of U0 : label is 1;
  attribute C_QCE_JOINED : integer;
  attribute C_QCE_JOINED of U0 : label is 0;
  attribute C_REG_DPRA_INPUT : integer;
  attribute C_REG_DPRA_INPUT of U0 : label is 0;
  attribute c_addr_width : integer;
  attribute c_addr_width of U0 : label is 9;
  attribute c_default_data : string;
  attribute c_default_data of U0 : label is "0";
  attribute c_depth : integer;
  attribute c_depth of U0 : label is 512;
  attribute c_elaboration_dir : string;
  attribute c_elaboration_dir of U0 : label is "./";
  attribute c_has_i_ce : integer;
  attribute c_has_i_ce of U0 : label is 0;
  attribute c_has_qspo : integer;
  attribute c_has_qspo of U0 : label is 0;
  attribute c_has_qspo_ce : integer;
  attribute c_has_qspo_ce of U0 : label is 0;
  attribute c_has_qspo_rst : integer;
  attribute c_has_qspo_rst of U0 : label is 0;
  attribute c_has_qspo_srst : integer;
  attribute c_has_qspo_srst of U0 : label is 0;
  attribute c_has_spo : integer;
  attribute c_has_spo of U0 : label is 1;
  attribute c_mem_init_file : string;
  attribute c_mem_init_file of U0 : label is "INST_MEM.mif";
  attribute c_parser_type : integer;
  attribute c_parser_type of U0 : label is 1;
  attribute c_pipeline_stages : integer;
  attribute c_pipeline_stages of U0 : label is 0;
  attribute c_qualify_we : integer;
  attribute c_qualify_we of U0 : label is 0;
  attribute c_read_mif : integer;
  attribute c_read_mif of U0 : label is 1;
  attribute c_reg_a_d_inputs : integer;
  attribute c_reg_a_d_inputs of U0 : label is 0;
  attribute c_sync_enable : integer;
  attribute c_sync_enable of U0 : label is 1;
  attribute c_width : integer;
  attribute c_width of U0 : label is 32;
begin
U0: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dist_mem_gen_v8_0_13
     port map (
      a(8 downto 0) => a(8 downto 0),
      clk => clk,
      d(31 downto 0) => d(31 downto 0),
      dpo(31 downto 0) => NLW_U0_dpo_UNCONNECTED(31 downto 0),
      dpra(8 downto 0) => B"000000000",
      i_ce => '1',
      qdpo(31 downto 0) => NLW_U0_qdpo_UNCONNECTED(31 downto 0),
      qdpo_ce => '1',
      qdpo_clk => '0',
      qdpo_rst => '0',
      qdpo_srst => '0',
      qspo(31 downto 0) => NLW_U0_qspo_UNCONNECTED(31 downto 0),
      qspo_ce => '1',
      qspo_rst => '0',
      qspo_srst => '0',
      spo(31 downto 0) => spo(31 downto 0),
      we => we
    );
end STRUCTURE;
