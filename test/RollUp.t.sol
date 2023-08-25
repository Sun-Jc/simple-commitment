// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import {IRollUp} from "../src/IRollUp.sol";
import {RollUp} from "../src/RollUp.sol";

contract RollUpTest is Test {
    IRollUp _rollup;
    
    function setUp() public {
        _rollup = new RollUp();
    }

    function testRollUp() public {
        bytes32 c1 = 0x0000000000000000000000000000000000000000000000000000000000000001;
        bytes32 c2 = 0x0000000000000000000000000000000000000000000000000000000000000002;
        bytes32 c3 = 0x0000000000000000000000000000000000000000000000000000000000000003;
        bytes memory proof = "proof";
        _rollup.update(c1, c2, proof);
        assertEq(_rollup.latestCommitment(), c2);
        _rollup.update(c2, c3, proof);
        assertEq(_rollup.latestCommitment(), c3);
    }
}