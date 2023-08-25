// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

interface IRollUp {
    /// @dev You can get the latest commitment either by calling `latestCommitment` function or by filtering this event
    event Updated(bytes32 oldCommitment, bytes32 newCommitment);

    /// @notice Returns the latest commitment
    function latestCommitment() external view returns (bytes32);

    /// @notice Update the commitment
    /// @param oldCommitment The old commitment, must be the latest commitment
    /// @param newCommitment The new commitment
    function update(bytes32 oldCommitment, bytes32 newCommitment, bytes calldata proof) external;
}