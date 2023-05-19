// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.5.0 <= 0.9.0;

contract polls_system {
    
    uint polls_count;

    struct pollInfo {
        address poll_id;
        string question;
        uint total_ans;
        uint y_count;
        uint n_count;
        // uint result;
        // string option;
    }

    struct voterInfo {
        uint voter_id;
        string name;
        uint ans_poll;
        uint ans_poll_y;
        uint ans_poll_n;
    }

    struct pollAns {
        string que;
        uint answer;
        string voter_name;
    }

    mapping(address => pollInfo) public polls;
    mapping(uint => voterInfo) public voter;
    mapping(uint => pollAns) pollAnswer;

    function CreatePoll(string memory question) public {
        require(polls[msg.sender].poll_id != msg.sender, "not able to added a new poll because your poll is already exist.");
        uint total_count = polls[msg.sender].total_ans;
        uint yes_count = polls[msg.sender].y_count;
        uint no_count = polls[msg.sender].n_count;
        polls[msg.sender] = pollInfo(msg.sender, question, total_count, yes_count, no_count);
        polls_count += 1;
    }

    function createVoter(uint id, string memory name) public {
        uint voter_poll = voter[id].ans_poll;
        uint voter_poll_y= voter[id].ans_poll_y;
        uint voter_poll_n = voter[id].ans_poll_n;
        voter[id] = voterInfo(id, name, voter_poll, voter_poll_y, voter_poll_n);
    }

    function poll_ans(address pollid, uint voterid, uint ans) public {
        // polls[pollid].question;
        if(ans == 1){
            ans = 1;
            polls[pollid].y_count += 1;
            voter[voterid].ans_poll_y += 1; 
        } else {
            ans = 0;
            polls[pollid].n_count += 1;
            voter[voterid].ans_poll_n += 1;
        }
        pollAnswer[voterid] = pollAns(polls[pollid].question, ans, voter[voterid].name);
        polls[pollid].total_ans += 1;
        voter[voterid].ans_poll += 1;
    }

    

    function getPolls() public view returns (uint) {
        return polls_count;
    }

}