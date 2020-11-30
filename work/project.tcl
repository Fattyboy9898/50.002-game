set projDir "C:/Users/user/OneDrive/Term\ 4/Computation\ Structures/alchitry/compStrucGame1/work/vivado"
set projName "compStrucGame1"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/user/OneDrive/Term\ 4/Computation\ Structures/alchitry/compStrucGame1/work/verilog/au_top_0.v" "C:/Users/user/OneDrive/Term\ 4/Computation\ Structures/alchitry/compStrucGame1/work/verilog/reset_conditioner_1.v" "C:/Users/user/OneDrive/Term\ 4/Computation\ Structures/alchitry/compStrucGame1/work/verilog/edge_detector_2.v" "C:/Users/user/OneDrive/Term\ 4/Computation\ Structures/alchitry/compStrucGame1/work/verilog/button_conditioner_3.v" "C:/Users/user/OneDrive/Term\ 4/Computation\ Structures/alchitry/compStrucGame1/work/verilog/game_beta_4.v" "C:/Users/user/OneDrive/Term\ 4/Computation\ Structures/alchitry/compStrucGame1/work/verilog/multi_seven_seg_5.v" "C:/Users/user/OneDrive/Term\ 4/Computation\ Structures/alchitry/compStrucGame1/work/verilog/pipeline_6.v" "C:/Users/user/OneDrive/Term\ 4/Computation\ Structures/alchitry/compStrucGame1/work/verilog/alu_7.v" "C:/Users/user/OneDrive/Term\ 4/Computation\ Structures/alchitry/compStrucGame1/work/verilog/game_cu_8.v" "C:/Users/user/OneDrive/Term\ 4/Computation\ Structures/alchitry/compStrucGame1/work/verilog/game_regfiles_9.v" "C:/Users/user/OneDrive/Term\ 4/Computation\ Structures/alchitry/compStrucGame1/work/verilog/counter_10.v" "C:/Users/user/OneDrive/Term\ 4/Computation\ Structures/alchitry/compStrucGame1/work/verilog/counter_11.v" "C:/Users/user/OneDrive/Term\ 4/Computation\ Structures/alchitry/compStrucGame1/work/verilog/seven_seg_12.v" "C:/Users/user/OneDrive/Term\ 4/Computation\ Structures/alchitry/compStrucGame1/work/verilog/decoder_13.v" "C:/Users/user/OneDrive/Term\ 4/Computation\ Structures/alchitry/compStrucGame1/work/verilog/fasixteen_14.v" "C:/Users/user/OneDrive/Term\ 4/Computation\ Structures/alchitry/compStrucGame1/work/verilog/comparesixteen_15.v" "C:/Users/user/OneDrive/Term\ 4/Computation\ Structures/alchitry/compStrucGame1/work/verilog/shiftersixteen_16.v" "C:/Users/user/OneDrive/Term\ 4/Computation\ Structures/alchitry/compStrucGame1/work/verilog/boolesixteen_17.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/Users/user/OneDrive/Term\ 4/Computation\ Structures/alchitry/compStrucGame1/work/constraint/alchitry.xdc" "C:/Users/user/OneDrive/Term\ 4/Computation\ Structures/alchitry/compStrucGame1/work/constraint/io.xdc" "C:/Program\ Files/Alchitry/Alchitry\ Labs/library/components/au.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
