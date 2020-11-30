set projDir "C:/Users/dylan/Desktop/50.002-game/work/vivado"
set projName "compStrucGame1"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/dylan/Desktop/50.002-game/work/verilog/au_top_0.v" "C:/Users/dylan/Desktop/50.002-game/work/verilog/rngGenerator_1.v" "C:/Users/dylan/Desktop/50.002-game/work/verilog/reset_conditioner_2.v" "C:/Users/dylan/Desktop/50.002-game/work/verilog/counter_3.v" "C:/Users/dylan/Desktop/50.002-game/work/verilog/pn_gen_4.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/Users/dylan/Desktop/50.002-game/work/constraint/alchitry.xdc" "C:/Users/dylan/Desktop/50.002-game/work/constraint/io.xdc" "C:/Program\ Files/Alchitry/Alchitry\ Labs/library/components/au.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
