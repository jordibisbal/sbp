module top
    (
        input N_RESET,
        input XTAL_IN,

        output [5:0] LED
    );

    logic reset;
    reg idle;
    wire systemClock;

    always_comb begin
        reset = ~N_RESET;
    end

    Gowin_rPLL rpll_inst (
        .clkin(XTAL_IN),
        .clkout(systemClock)
    );

    StatusLeds statusLeds (
        .clk(systemClock),
        .idle(idle),
        .led(LED),
        .reset(reset)
    );

    ControlUnit controlUnit (
        .clock(systemClock),
        .reset(reset)
    );

    always @(negedge N_RESET) begin
        idle <= 1;
    end
endmodule : top