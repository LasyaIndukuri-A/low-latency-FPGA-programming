# Vivado build script template
set project_name "adder_timing_lab"
create_project $project_name ./build -part xc7a100tcsg324-1
add_files ./adder_top.v
add_files -fileset constrs_1 ./adder_top.xdc
update_compile_order -fileset sources_1
launch_runs synth_1 -jobs 4
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream
wait_on_run impl_1
report_timing_summary -file ./reports/timing_summary.rpt
exit
