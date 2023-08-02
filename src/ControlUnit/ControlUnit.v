module ControlUnit
    (
        input clock,
        input reset
    );

    MicroAddressCounter addressCounter (
        .clock(clock),
        .reset(reset)
    );
endmodule