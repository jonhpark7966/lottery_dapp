// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Import this file to use console.log
import "hardhat/console.sol";

contract LotteryPhase1 {
    uint256 public drawTime;
    address public owner;
    mapping(address=>uint256) public amount;

    uint256 public totalAmount;

    constructor(uint256 _drawTime){
        drawTime = _drawTime;
        owner = msg.sender;
    }

    function buyticket() external payable{
        require(block.timestamp < drawTime, "This Lottery is Over");

        amount[msg.sender] += msg.value;
        totalAmount += msg.value;
    }

    function draw() external{
        // TODO, every body should be able to call draw, not only owner.
        // for now, only owner could call for test. 
        require(msg.sender == owner, "Temporal requirement, You are not owner!");

        require(block.timestamp > drawTime, "Not Finished Yet.");

        // TODO, GET RANDOM to find out winner.

        // Pay it to winner.
        payable(owner).transfer(totalAmount);
    }
}
