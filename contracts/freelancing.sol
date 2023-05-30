// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <= 0.9.0;

contract freelancing{

    enum projectStatus{pendding, approve, proccessing, complete}

    struct clientInfo{
        address p_id;
        string project;
        uint p_amt;
        uint time_limit;
    }

    struct freelancerInfo{
        uint[] pro_id;
        uint pro_amt;
    }

    clientInfo[] clicents;
    mapping (uint => freelancerInfo) user;
 
    function client(string memory p_name, uint amount, uint timelimit) public {
        clientInfo memory clicent = clientInfo({ p_id: msg.sender, project: p_name, p_amt: amount, time_limit: timelimit });
        clicents.push(clicent);
    }

    function TotalProjetc() public view returns(uint){
        return clicents.length;
    }
 
    function getClicent(uint clicentID) public view returns(address, string memory, uint, uint) {
        return( clicents[clicentID].p_id,
            clicents[clicentID].project,
            clicents[clicentID].p_amt,
            clicents[clicentID].time_limit
        );
    }  

    function freelancer(uint user_id,uint clicent_id) public payable {
        require(clicents[clicent_id].p_amt == msg.value, "Payable amount not equl project amount.");
        user[user_id].pro_id.push(clicent_id);
        if(user[user_id].pro_amt == 0) {
            user[user_id].pro_amt = msg.value;    
        } else {
            user[user_id].pro_amt += msg.value;
        }
        // user[user_id].pro_amt = msg.value;
    } 

    function getBalance() public view returns(uint){
        return address(this).balance;
    }

    function getFreelancer(uint u_id) public view returns(uint[] memory, uint) {
        return ( user[u_id].pro_id,
            user[u_id].pro_amt
        );
    }

}