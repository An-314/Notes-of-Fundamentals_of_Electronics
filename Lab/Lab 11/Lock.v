module Lock(Input, CLK_in, State, Unlock);
input [9:0] Input;
input CLK_in;
output wire [3:0] State;
output wire Unlock;

wire [9:0] isPressed;
wire CLK;
wire [3:0] encoded;


FrequencyDivider FreqDiv(CLK_in, CLK);

Button Btn0(CLK, Input[0], isPressed[0]);
Button Btn1(CLK, Input[1], isPressed[1]);
Button Btn2(CLK, Input[2], isPressed[2]);
Button Btn3(CLK, Input[3], isPressed[3]);
Button Btn4(CLK, Input[4], isPressed[4]);
Button Btn5(CLK, Input[5], isPressed[5]);
Button Btn6(CLK, Input[6], isPressed[6]);
Button Btn7(CLK, Input[7], isPressed[7]);
Button Btn8(CLK, Input[8], isPressed[8]);
Button Btn9(CLK, Input[9], isPressed[9]);

Encoder Enc(isPressed, CLK, encoded);

FiniteStateMachine FSM(encoded, CLK, State, Unlock);

endmodule

