module StatusLeds
    (
        input clk,
        input idle,
        input reset,

        output reg [5:0] led
    );

    localparam idleCycleTime = 23'd5_000_000;
    localparam right = 1'b0;
    localparam left = 1'b1;

    reg [22:0] counter;
    reg direction;

    always @(posedge clk, posedge reset) begin
        if (reset)
            counter <= 0;
        else if (counter == idleCycleTime)
            counter <= 0;
        else
            counter <= counter + 23'd1;
    end

    always @(posedge clk, posedge reset) begin
        if (reset) begin
            direction <= right;
            led[5:0] <= 6'b011111;
        end else if (counter == idleCycleTime) begin
            if (direction == right) begin
                if (led[5] == 1)
                    led[5:0] <= {led[4:0], led[5]};
                else begin
                    direction <= left;
                    led[5:0] <= {led[0], led[5:1]};
                end
            end else begin
                if (led[0] == 1)
                    led[5:0] <= {led[0], led[5:1]};
                else begin
                    direction <= right;
                    led[5:0] <= {led[4:0], led[5]};
                end
            end
        end else
            led <= led;
    end

endmodule