// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

abstract contract CBDC {
    mapping(bytes32 => uint256) public balanceOf;
    
    function transfer(bytes32 to, uint256 value) public {
        bytes32 sender = recoverSender();
        balanceOf[to] += value;
        balanceOf[sender] -= value;
    }


    function recoverSender() virtual internal returns (bytes32);
}
