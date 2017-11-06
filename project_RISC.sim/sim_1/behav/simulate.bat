@echo off
set xv_path=H:\\Vivaldo\\Vivado\\2016.4\\bin
call %xv_path%/xsim test_Risc_16_bit_behav -key {Behavioral:sim_1:Functional:test_Risc_16_bit} -tclbatch test_Risc_16_bit.tcl -view H:/project_RISC/test_Risc_16_bit_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
