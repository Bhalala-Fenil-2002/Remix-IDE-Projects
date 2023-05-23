// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <= 0.9.0;

contract poll_system {

    struct Poll{
        uint id;
        string question; 
        // uint[] results;  
        string[] options;   
    }
    
    struct VoterData{
        uint[] votedIds;
        mapping(uint256 => bool) votedMap;
    }
    
    Poll[] polls;
    // string[] poll_opt;
    // mapping(address => VoterData) private voters;
    mapping(address => VoterData) private voters;

    function CreatePoll(uint id, string memory question, string[] memory option) public {
        // uint[] memory result = Poll.results;
        // poll_opt.push(option);
        Poll memory poll = Poll(id, question, option);
        // Poll memory poll = Poll(id, question, result, option);
        polls.push(poll);
        // poll_opt = new string[](0);
    }

    function getLengthPoll() external  view returns(uint) {
        return polls.length;
    }

    function CreateVoter(uint id) public {
        // voterInfo voters.votedMap;
        voters[msg.sender].votedIds.push(id);
        voters[msg.sender].votedMap[id] = false;
        // uint[] v_id = votedIds.push(id);
        // voters[msg.sender] = VoterData(votedIds.push(id), votedIds.votedMap);
    }

    function pollAns(uint pollId, bool ans) public {
    //    voters[msg.sender].votedIds
        voters[msg.sender].votedMap[pollId] = ans;
    }

}