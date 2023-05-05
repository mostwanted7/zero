pragma circom 2.1.4;

include "../node_modules/circomlib/circuits/poseidon.circom";
include "../node_modules/circomlib/circuits/comparators.circom";

template MoreLess (bits) {
    signal input secret; // The secret number chosen
    signal input challenge; // Public challenge number
    signal output commit; // Make sure secret isn't change between rounds

    // 1 - Challenge is less than or equal to secret; 0 - more than
    signal output answer;

    component less = LessEqThan(bits);
    less.in[0] <== challenge;
    less.in[1] <== secret;

    answer <== less.out;

    // Calculate hash of the secret, needs to match all rounds
    component hash = Poseidon(1);
    hash.inputs[0] <== secret;
    commit <== hash.out;
}

component main { public [ challenge ] } = MoreLess(32);