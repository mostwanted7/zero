pragma circom 2.1.4;

include "circomlib/poseidon.circom";

template More_than () {
    signal input secret; // The secret number chosen
    signal input challenge; // Public challenge number
    signal output commit; // Make sure secret isn't change between rounds

    // Intermediate signals for calculating challenge
    signal int1;
    // 1 - True; 0 - False
    signal output answer;

    // Check if secret is close to challenge
    int1 <-- secret > challenge ? 1 : 0;
    answer <== int1 * int1;

    // Calculate hash of the secret, needs to match all rounds
    component hash = Poseidon(1);
    hash.inputs[0] <== secret;
    commit <== hash.out;
}

component main { public [ challenge ] } = More_than();