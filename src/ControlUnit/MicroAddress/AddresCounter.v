import MicroAddress::*;

module MicroAddressCounter
    (
        input clock,
        input reset,
        input MicroAddress::Command command,
        input MicroAddress::Address loadAddress,
        output MicroAddress::Address address
    );

    MicroAddress::Address nextAddress;

    always_comb begin
        case (command)
            noneCommand:
                nextAddress = address;
            incrementCommand:
                nextAddress = address + addressIncrementStep;
            resetCommand:
                nextAddress = resetAddress;
            loadCommand:
                nextAddress = loadAddress;
            default:
                nextAddress = resetAddress;
        endcase

        if (reset)
            nextAddress = resetAddress;
    end

    always @(posedge clock) begin
        address <= nextAddress;
    end
endmodule : MicroAddressCounter