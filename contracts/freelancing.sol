// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <= 0.9.0;

contract freelancing{

    enum projectStatus{pendding, approved, rejected, completed}

    struct clientInfo{
        address p_id;
        string project;
        uint p_amt;
        uint time_limit;
        projectStatus status;
    }

    struct freelancerInfo{
        uint[] pro_id;
        uint pro_amt;
    }

    clientInfo[] clicents;
    mapping (address => freelancerInfo) user;
 
    function client(string memory p_name, uint amount, uint timelimit) public{
        clientInfo memory clicent = clientInfo(msg.sender, p_name, amount, timelimit, projectStatus.pendding);
        clicents.push(clicent);
    }
    
    function getClicent(uint clicentID) public view returns(address, string memory, uint, uint, projectStatus){
        return( clicents[clicentID].p_id,
            clicents[clicentID].project,
            clicents[clicentID].p_amt,
            clicents[clicentID].time_limit,
            clicents[clicentID].status
        );
    }  

    function TotalProjetc() public view returns(uint){
        return clicents.length;
    } 

    function freelancer(uint clicent_id) public payable{
        require(clicents[clicent_id].p_amt == msg.value, "Payable amount not equl project amount.");
        user[msg.sender].pro_id.push(clicent_id);
        if(user[msg.sender].pro_amt == 0) {
            user[msg.sender].pro_amt = msg.value;    
        } else {
            user[msg.sender].pro_amt += msg.value;
        }
    } 

    function getFreelancer(address u_id) public view returns(uint[] memory, uint){
        require(u_id == msg.sender, "Record not found.");
        return ( user[u_id].pro_id,
            user[u_id].pro_amt
        );
    }

    function projectApprove(uint pId) public{
        clicents[pId].status = projectStatus.approved;
    }

    function getBalance() public view returns(uint){
        return address(this).balance;
    }

}