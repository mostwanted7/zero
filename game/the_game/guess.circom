pragma circom 2.1.4;

include "../node_modules/circomlib/circuits/poseidon.circom";
include "../node_modules/circomlib/circuits/comparators.circom";

template Guess () {
    signal input secret; // The secret number chosen
    signal input challenge; // Public challenge number
    signal output commit; // Make sure secret isn't change between rounds

    // 1 - True; 0 - False
    signal output answer;

    component checkGuess = IsEqual();
    checkGuess.in[0] <== secret;
    checkGuess.in[1] <== challenge;

    answer <== checkGuess.out;

    // Calculate hash of the secret, needs to match all rounds
    component hash = Poseidon(1);
    hash.inputs[0] <== secret;
    commit <== hash.out;
}

component main { public [ challenge ] } = Guess();