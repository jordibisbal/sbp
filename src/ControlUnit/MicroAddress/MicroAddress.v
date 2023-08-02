package MicroAddress;
    typedef enum logic[1:0] {
        noneCommand,
        resetCommand,
        incrementCommand,
        loadCommand
    } Command;

    localparam resetAddress = 24'h0000_0000_0000;
    localparam addressIncrementStep = 24'd1;

    typedef logic[23:0] Address;
endpackage : MicroAddress