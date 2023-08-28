// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {IRollUp} from "./IRollUp.sol";

contract RollUp is IRollUp {
    bytes32 private _commitment;

    function latestCommitment() external view returns (bytes32) {
        return _commitment;
    }
    function transfer(bytes32 oldCommitment, bytes32 newCommitment, bytes calldata proof) external {
        require(_commitment == bytes32(0) || oldCommitment == _commitment, "RollUp: invalid old commitment");
        require(verify(proof), "RollUp: invalid proof");
        _commitment = newCommitment;
    }

    function verify(bytes calldata) internal pure returns (bool) {
        return true;
    }
}
