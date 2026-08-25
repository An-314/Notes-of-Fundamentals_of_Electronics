/*
分频器：把一个50MHz的CLK_in信号分频成5kHz的CLK信号
@Input CLK_in: 50MHz时钟信号
@Output CLK: 5kHz时钟信号
*/

module FrequencyDivider(CLK_in, CLK);
input CLK_in;
output reg CLK;

parameter DIVISOR = 100;
reg [13:0] counter;

always @(posedge CLK_in) begin
    if (counter == DIVISOR - 1) begin
        counter <= 0;
        CLK <= ~CLK;
    end else begin
        counter <= counter + 1;
    end
end

endmodule
