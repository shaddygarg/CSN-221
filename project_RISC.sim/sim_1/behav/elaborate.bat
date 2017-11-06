@echo off
set xv_path=H:\\Vivaldo\\Vivado\\2016.4\\bin
call %xv_path%/xelab  -wto fc778b6ac7ec40e5864da8d3b8e5d765 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot test_Risc_16_bit_behav xil_defaultlib.test_Risc_16_bit xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
