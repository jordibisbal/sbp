//Copyright (C)2014-2023 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: IP file
//GOWIN Version: V1.9.8.11 Education
//Part Number: GW1N-LV9QN48C6/I5
//Device: GW1N-9
//Device Version: C
//Created Time: Tue Aug 01 18:33:19 2023

module Gowin_OSC (oscout);

output oscout;

OSC osc_inst (
    .OSCOUT(oscout)
);

defparam osc_inst.FREQ_DIV = 2;
defparam osc_inst.DEVICE = "GW1NR-9C";

endmodule //Gowin_OSC
