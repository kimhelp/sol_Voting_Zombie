// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;


contract Voting{
    string[] public candidateList;
    mapping(string => uint8) public votesReceived;

    constructor(string[] memory candidateNames){
        candidateList = candidateNames;
    }
    function voteForcandidate(string memory candidate) public{
        require(validCandidate(candidate),'Error!!');
        votesReceived[candidate] += 1;
    }

    function totalVotesFor(string memory candidate) public view returns(uint8){
        require(validCandidate(candidate),'Error!!');
        votesReceived[candidate];
    }
    function validCandidate(string memory candidate) private view returns(bool){
        // 1.후보자 리스트 candidateList
        // 2. 내가 입력한 후보자군과 candidateList 안에 있는 후보자가 일치하는게 있는가.
        for(uint i=0; i< candidateList.length;i++){
            if(keccak256(abi.encodePacked(candidateList[i])) == keccak256(abi.encodePacked(candidate))){
                return true;
            }
        }
        return false;
    }
}