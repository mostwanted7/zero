pragma circom 2.1.4;

include "circomlib/poseidon.circom";
include "circomlib/comparators.circom";

template Close_to (bits) {
    signal input secret; // The secret number chosen
    signal input challenge; // Public challenge number
    signal output commit; // Make sure secret isn't change between rounds

    // 1 - True; 0 - False
    signal output answer;

    // Intermediate signals for calculating range
    signal lowerBound <== secret - 5;
    signal upperBound <== secret + 5;

    // Check if secret is close to challenge
    component less = LessEqThan(bits);
    less.in[0] <== challenge;
    less.in[1] <== upperBound;

    component more = GreaterEqThan(bits);
    more.in[0] <== challenge;
    more.in[1] <== lowerBound;

    // Is 1 IFF 'challenge' is higher than lowerBound AND lower than upperBound
    answer <== less.out * more.out;

    // Calculate hash of the secret, needs to match all rounds
    component hash = Poseidon(1);
    hash.inputs[0] <== secret;
    commit <== hash.out;
}

component main { public [ challenge ] } = Close_to(32);