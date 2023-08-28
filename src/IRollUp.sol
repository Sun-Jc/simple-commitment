// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

interface IRollUp {
    function latestCommitment() external view returns (bytes32);
    
    function transfer(bytes32 from, bytes32 to, uint256 amount, bytes32 oldCommitment, bytes32 newCommitment, bytes calldata proof) external;
}