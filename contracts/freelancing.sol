// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <= 0.9.0;

contract freelancing{

    enum projectStatus{pendding, approved, rejected, completed}
    
    enum ScheduleState {proposal, financed, started, approved, released}
    
    struct clientInfo{
        address p_id;
        string shortCode;
        string description;
        uint p_amt;
        uint time_limit;
        uint[] freelancer_id;
        ScheduleState scheduleState;
        // string project;
        // projectStatus status;
        // uint256 value;
    }

    struct freelancerInfo{
        address lancer_add;
        uint[] pro_id;
        uint pro_amt;
        ScheduleState scheduleState;
        // projectStatus pro_status;
    }

    clientInfo[] clicents;
    mapping (uint => freelancerInfo) user;
    uint[] client_lancer;
 
    function client(string memory project, string memory description, uint amount, uint timelimit) public{
        clientInfo memory clicent = clientInfo(msg.sender, project, description, amount, timelimit, client_lancer, ScheduleState.proposal);
        clicents.push(clicent);
    }
    
    function getClicent(uint clicentID) public view returns(address, string memory, string memory, uint, uint, uint[] memory, ScheduleState){
        return( clicents[clicentID].p_id,
            clicents[clicentID].shortCode,
            clicents[clicentID].description,
            clicents[clicentID].p_amt,
            clicents[clicentID].time_limit,
            clicents[clicentID].freelancer_id,
            clicents[clicentID].scheduleState
        );
    }  

    function TotalProjetc() public view returns(uint){
        return clicents.length;
    } 

    function freelancer(uint clicent_id, uint lancer_id) public payable{
        require(clicents[clicent_id].p_amt == msg.value, "Payable amount not equl project amount.");
        
        address payable clicent_add = payable(clicents[clicent_id].p_id); 
        
        clicents[clicent_id].freelancer_id.push(lancer_id);
        
        user[lancer_id].pro_id.push(clicent_id);
        
        user[lancer_id].lancer_add = msg.sender;
        
        clicent_add.transfer(msg.value);
        // if(user[lancer_id].pro_amt == 0) {
        //     user[lancer_id].pro_amt = msg.value;    
        // } else {
        //     user[lancer_id].pro_amt += msg.value;
        // }
    } 

    function getFreelancer(uint u_id) public view returns(uint[] memory, uint, ScheduleState, address){
        require(user[u_id].lancer_add == msg.sender, "Record not found.");
        return ( user[u_id].pro_id,
            user[u_id].pro_amt,
            user[u_id].scheduleState,
            user[u_id].lancer_add
        );
    }

    // function approve(uint pId, uint lancer_id) public{
    //     clicents[pId].status = projectStatus.approved;
    //     user[lancer_id].pro_status = projectStatus.approved;
    // }

    // function done(uint pId, uint lancer_id) public {
    //     clicents[pId].status = projectStatus.completed;
    //     user[lancer_id].pro_status = projectStatus.completed;
    //     address payable lan_add = payable(user[lancer_id].lancer_add);

    //     lan_add.transfer(clicents[pId].p_amt + clicents[pId].p_amt);
    // }

    // function getBalance() public view returns(uint){
    //     return address(this).balance;
    // }

}