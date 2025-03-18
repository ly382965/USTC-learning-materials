-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
-- Date        : Wed May 22 21:56:25 2024
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
      INIT => X"009400EF41CE971C08798097982F798E97840F404EE48009FFFF0000FFFF0000"
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
      INIT => X"809305214BC2F319E143CCE319267B8CE319C673C0F385C7FFFFFFFF00000000"
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
      INIT => X"5294A5294A50842108421084A5294A5294A5295A5285210A4054500055115554"
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
      INIT => X"0000000000000000010842108421080400080010802108001151015445114040"
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
      INIT => X"42108000000210846108C2100000004630846118C62008024501455050441505"
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
      INIT => X"0884150C4000D420CD6B5056A1216B4AC62429311E0134ADC8D9998DDD99CCDD"
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
      INIT => X"1010252022460719E90850642189224603048C08D4859525B0F0B1E0B4F5B0B1"
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
      INIT => X"425400A9621051BDA2221AC2912D681C9289A97BD8B18D85BB10BB55FB45EA00"
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
      INIT => X"409005AD031E92B4016940B6950D611C872C2D1A1E54002BEAAB4150FAFE5550"
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
      INIT => X"409221094B16F399A9130E621504614E539CA53BC0F6A88EABBBFEFE05441441"
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
      INIT => X"50102009080EB015EF7B4CB690056318C40C24631A413D2DAA95B697B55514D5"
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
      INIT => X"00000021404666B1E6390CA08501494C55990D31025228C8E9F41BC706C09112"
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
      INIT => X"42800561580EE0A1C6791CE42428401E4481006B521281CC5573FBD3F595FB4F"
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
      INIT => X"02100509021457BCC6620A242409425805880D085AA10CA295EA7099DFC23525"
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
      INIT => X"420484210A4CE4A162325CE4A429435897A12D4308E69D091964F5A64133A5A5"
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
      INIT => X"10802100020466104E711CA02100030845108840188239049EFC28B8359B1AA5"
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
      INIT => X"00042100101CE40046331CE0000843084329886008653140AE1305B7C64359AC"
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
      INIT => X"10842100000C60214A721CE00000011C862108610820184A794DABC277160B04"
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
      INIT => X"00000808421CE421CA731CE00000010C4210800210C4290CD32D01FE649E3F16"
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
      INIT => X"108421085218E5290C721CC0000001000210840108610084F192730CE90E7C68"
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
      INIT => X"8421084210842108421084210842108421084210842108425555555555555555"
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
      INIT => X"00000000100C6000C6310C642108435AD4A5084210D5B56FA950A6BDA23BFC5E"
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
      INIT => X"00000002000C4108C6210860000001044210000000411006BC0D2E67470EC3DC"
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
      INIT => X"0000000000000000000000000000000000000000000000000000000000000000"
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
      INIT => X"EF7BDEF7BDEF7BDEF7BDEF7BDEF7BDEF7BDEF7BDEF7BDEF7FFFFFFFFFFFFFFFF"
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
      INIT => X"94A5294A5296B5AD6B5AD6B5AD6B5AD6B5AD6B5AD6B5AD6B5555555555555555"
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
      INIT => X"1084210842108421084210842108421084210842108421080000000000000000"
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
      INIT => X"CC10982708007084C739C263842039CC738401318E001CC7CCCCCCCCCCCCCCCC"
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
      INIT => X"0200042030400398E100026084E130400300C70002109826F0F0F0F0F0F0F0F0"
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
      INIT => X"106481C17852641DE0705E771927781E1701E179DE1401E6FF00FF00FF00FF00"
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
      INIT => X"0000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF"
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
      INIT => X"00000000000000000000000002E71C2E4980F41C29780CE484EF400C94980F70"
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
      INIT => X"0000000000000000000000000EF31D01724EE301E64B829019C04A408319264B"
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
      INIT => X"00000000000000000000000016B42D085A16B42108425294A508421094A5294A"
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
      INIT => X"00000000000000000000000000318C6300060084210842108421084200000000"
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
      INIT => X"00000000000000000000000006018C6318003084210842108400000010842108"
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
      INIT => X"0000000000000000000000000E71BCEF61C8B014A46B4202142D215A9211A503"
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
      INIT => X"0000000000000000000000001800208361D844110D0848162428484204350C40"
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
      INIT => X"0000000000000000000000409E863D6339D8C2A521431AC00521025250A00560"
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
      INIT => X"00000000000000000000000010723D045900F03108604844A1AC080894902C28"
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
      INIT => X"0000000000000000000000001EC3B00B221E42858541128098A14A0002950541"
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
      INIT => X"0000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF"
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
      INIT => X"0000000000000000000000C110B1A1685A1032A1AE420214A80962101621283B"
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
      INIT => X"00000000000000000000004010318160421682A0AE0050141C01080002A40831"
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
      INIT => X"0000000000000000000000401C2724A342D08400072A128088010842D2900D71"
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
      INIT => X"0000000000000000000000400087B44B0206B034044052809509001002A42869"
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
      INIT => X"00000000000000000000004016C7A4805810B4010D0202103D00004016A42923"
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
      INIT => X"0000000000000000000000401E83B50002C606800D68529029200A4006000861"
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
      INIT => X"0000000000000000000000400875A5600010B680042A129008084A4002218C61"
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
      INIT => X"0000000000000000000000400600040842D08694A52842042929424202008003"
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
      INIT => X"0000000000000000000000400631886018003021A84252843D294A0242008000"
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
      INIT => X"00000000000000000000004008721CE318003294040002001C20085086218C63"
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
      INIT => X"00000000000000000000002046318C6318C63108421084210842108421084210"
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
      INIT => X"000000000000000000000040084210E318063280A5004000080000025284A521"
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
      INIT => X"00000000000000000000004006318C6018060014A42840001420004042008020"
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
      INIT => X"0000000000000000000000000000000000000000000000000000000000000000"
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
      INIT => X"0000000000000000000000FFEF7BDEF7BDEF7BDEF7BDEF7BDEF7BDEF7BDEF7BD"
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
      INIT => X"0000000000000000000000A154A5294B5AD6B5294A5294A5294A5294A5294A52"
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
      INIT => X"0000000000000000000000811084210842108421084210842108421084210842"
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
      INIT => X"0000000000000000000000000C601CC7398C1018C639C0031807318E1318E601"
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
      INIT => X"0000000000000000000000000E0004C0398E609827000C0384010800009C2708"
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
      INIT => X"000000000000000000000060DE179D20719E77052049DE740120405264050678"
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
