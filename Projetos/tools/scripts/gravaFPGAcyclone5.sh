#!/bin/bash

# quartus_pgm  -l | grep -i blaster

#pkill jtagd
#sleep 5
#jtagd

quartus_pgm  -c 1  -m jtag  ../sof/DE0_CV_Default.cdf

#   puts stdout [format {%08x%-52s%-16s} $address $hex_line $ascii_line ]
#   set address [ expr $address + $bytes_per_line ]

#   quartus_pgm  -c "USB-Blaster \[1-1\]"  -m jtag  output_files/Chain1.cdf

