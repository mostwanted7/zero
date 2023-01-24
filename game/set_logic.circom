pragma circom 2.0.0;

// Circom libraries useed
include "../node_modules/circomlib/circuits/mimcsponge.circom";
include "../node_modules/circomlib/circuits/comparators.circom";

template Main() {
    // Declare signals
    signal input x;
    signal output h;

    // Check if setable
    component comp = LessThan(64); // number of bits input has
    comp.in[0] <== x;
    comp.in[1] <== 10;
    comp.out === 1;

    // MIMC hash
    component mimc = MiMCSponge(1, 220, 1); // #Inputs, #Repeatcount, #Outputs
    mimc.ins[0] <== x;
    mimc.k <== 0;
    h <== mimc.outs[0];
}

component main = Main();