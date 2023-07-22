cd /home/runner
export PATH=/usr/bin:/bin:/tool/pandora64/bin:/usr/share/iverilog-0.9.7/bin
export HOME=/home/runner
iverilog '-Wall' design.sv testbench.sv  && unbuffer vvp a.out  ; echo 'Creating result.zip...' && zip -r /tmp/tmp_zip_file_123play.zip . && mv /tmp/tmp_zip_file_123play.zip result.zip