// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {BasicNft} from "../src/BasicNft.sol";
import {MoodNft} from "../src/MoodNft.sol";

contract MintBasicNft is Script {
    string public constant SHIBA = "ipfs://QmQtsjmSZ5DJTZLWceqR45hsJJPxXjM45aa5aiziAcufao";

    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("BasicNft", block.chainid);
        mintNftOnContract(mostRecentlyDeployed);
    }

    function mintNftOnContract(address contractAddress) public {
        vm.startBroadcast();
        BasicNft(contractAddress).mintNft(SHIBA);
        vm.stopBroadcast();
    }
}

contract MintMoodNft is Script {
    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("MoodNft", block.chainid);
        mintNftOnContract(mostRecentlyDeployed);
    }

    function mintNftOnContract(address contractAddress) public {
        vm.startBroadcast();
        MoodNft(contractAddress).mintNft();
        vm.stopBroadcast();
    }
}

contract FlipMoodNft is Script {
    uint256 public constant TOKEN_ID = 0;

    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("MoodNft", block.chainid);
        flipMoodNft(mostRecentlyDeployed);
    }

    function flipMoodNft(address contractAddress) public {
        vm.startBroadcast();
        MoodNft(contractAddress).flipMood(TOKEN_ID);
        vm.stopBroadcast();
    }
}
