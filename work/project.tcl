set projDir "C:/Users/dylan/Desktop/50.002-game/work/vivado"
set projName "compStrucGame1"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/dylan/Desktop/50.002-game/work/verilog/au_top_0.v" "C:/Users/dylan/Desktop/50.002-game/work/verilog/reset_conditioner_1.v" "C:/Users/dylan/Desktop/50.002-game/work/verilog/edge_detector_2.v" "C:/Users/dylan/Desktop/50.002-game/work/verilog/button_conditioner_3.v" "C:/Users/dylan/Desktop/50.002-game/work/verilog/multi_dec_ctr_4.v" "C:/Users/dylan/Desktop/50.002-game/work/verilog/game_beta_5.v" "C:/Users/dylan/Desktop/50.002-game/work/verilog/multi_seven_seg_6.v" "C:/Users/dylan/Desktop/50.002-game/work/verilog/rngGenerator_7.v" "C:/Users/dylan/Desktop/50.002-game/work/verilog/pipeline_8.v" "C:/Users/dylan/Desktop/50.002-game/work/verilog/decimal_counter_9.v" "C:/Users/dylan/Desktop/50.002-game/work/verilog/alu_10.v" "C:/Users/dylan/Desktop/50.002-game/work/verilog/game_cu_11.v" "C:/Users/dylan/Desktop/50.002-game/work/verilog/game_regfiles_12.v" "C:/Users/dylan/Desktop/50.002-game/work/verilog/counter_13.v" "C:/Users/dylan/Desktop/50.002-game/work/verilog/counter_14.v" "C:/Users/dylan/Desktop/50.002-game/work/verilog/seven_seg_15.v" "C:/Users/dylan/Desktop/50.002-game/work/verilog/decoder_16.v" "C:/Users/dylan/Desktop/50.002-game/work/verilog/counter_17.v" "C:/Users/dylan/Desktop/50.002-game/work/verilog/pn_gen_18.v" "C:/Users/dylan/Desktop/50.002-game/work/verilog/fasixteen_19.v" "C:/Users/dylan/Desktop/50.002-game/work/verilog/comparesixteen_20.v" "C:/Users/dylan/Desktop/50.002-game/work/verilog/shiftersixteen_21.v" "C:/Users/dylan/Desktop/50.002-game/work/verilog/boolesixteen_22.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/Users/dylan/Desktop/50.002-game/work/constraint/alchitry.xdc" "C:/Users/dylan/Desktop/50.002-game/work/constraint/io.xdc" "C:/Program\ Files/Alchitry/Alchitry\ Labs/library/components/au.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
