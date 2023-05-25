// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <= 0.9.0;

contract poll_system {

    struct Poll{
        uint id;
        string question; 
        uint[] results;  //[1, 2]
        string[] options;  // ["true", "false"] 
    }
    
    struct VoterData{
        uint[] votedIds; // [0, 1, 2, 3]
        mapping(uint256 => bool) votedMap;
    }
    
    Poll[] polls;
    // string[] poll_opt;
    // mapping(address => VoterData) private voters;
    mapping(address => VoterData) private voters;
    uint[] result;

    function CreatePoll(uint id, string memory question, string[] memory option) public {
        // uint[] memory result = ;
        // poll_opt.push(option);
        // for(uint i=0; i < option.length; i++){
        //     result.push(0);
        // };
        Poll memory poll = Poll({
            id: id, question: question, results: new uint[](option.length), options: option
        });
        // Poll memory poll = Poll(id, question, result, option);
        polls.push(poll);
        // poll_opt = new string[](0);
    }

    function getLengthPoll() external view returns(uint) {
        return polls.length;
    }

    // function CreateVoter(uint id) public {
    //     // voterInfo voters.votedMap;
    //     voters[msg.sender].votedIds.push(id);
    //     voters[msg.sender].votedMap[id] = false;
    //     // uint[] v_id = votedIds.push(id);
    //     // voters[msg.sender] = VoterData(votedIds.push(id), votedIds.votedMap);
    // }

    function poll(uint pollId, uint selectOpt) public returns(uint) {
    //    voters[msg.sender].votedIds
        // require(voters[msg.sender].votedMap[pollId] == true, "not able to ans this poll.");
        polls[pollId].results[selectOpt] += 1;
        //voters[msg.sender].votedIds.push(pollId);
        //voters[msg.sender].votedMap[pollId] = true;
        // polls[pollId].results[selectOpt] = 2;
        return  polls[pollId].results[selectOpt];
    }

    function pollAns(uint pollId, uint selectOpt) public {
    //    voters[msg.sender].votedIds
        require(voters[msg.sender].votedMap[pollId] == false, "not able to ans this poll.");
        polls[pollId].results[selectOpt] += 1;
        voters[msg.sender].votedIds.push(pollId);
        voters[msg.sender].votedMap[pollId] = true;
    }

    function GetPoll(uint id) public view returns(string memory, uint[] memory, string[] memory) {
        return (polls[id].question,
            polls[id].results,
            polls[id].options);
    }

}