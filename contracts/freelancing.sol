// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <= 0.9.0;

contract freelancing{

    // enum projectStatus{pendding, approved, rejected, completed}
    
    enum ScheduleState {proposal, financed, started, approved, released}
    
    struct clientInfo{
        address p_id;
        string shortCode;
        string description;
        uint p_amt;
        uint time_limit;
        uint[] freelancer_id;
        ScheduleState scheduleState;
    }

    struct freelancerInfo{
        address lancer_add;
        string bid_desc;
        ScheduleState scheduleState;
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

    function freelancer(uint clicent_id, uint lancer_id, string memory bid) public{
        require(clicents[clicent_id].scheduleState == ScheduleState.proposal,"Project allocate other freelancer.");
        clicents[clicent_id].freelancer_id.push(lancer_id);        
        user[lancer_id].lancer_add = msg.sender;
        user[lancer_id].bid_desc = bid;
    } 

    function getFreelancer(uint u_id) public view returns(string memory, ScheduleState, address) {
        return ( user[u_id].bid_desc,
            user[u_id].scheduleState,
            user[u_id].lancer_add
        );
    }

    function select(uint pId, uint lancer_id) public {
        require(clicents[pId].scheduleState == ScheduleState.proposal, "You are not selected.");
        user[lancer_id].scheduleState = ScheduleState.financed;
        clicents[pId].scheduleState = ScheduleState.financed;
    }

    function Start(uint pId, uint lancer_id) public {
        require(user[lancer_id].scheduleState == ScheduleState.financed, "You are not selected.");
        clicents[pId].scheduleState = ScheduleState.started;
        user[lancer_id].scheduleState = ScheduleState.started;
    }

    function Approve(uint pId, uint lancer_id) public {
        require(user[lancer_id].scheduleState == ScheduleState.started, "Project wrok is not completed.");
        clicents[pId].scheduleState = ScheduleState.approved;
        user[lancer_id].scheduleState = ScheduleState.approved;
    }

    function Payment(uint pId, uint lancer_id) public payable {
        require(user[lancer_id].scheduleState == ScheduleState.approved, "Project wrok is not proparly working please check your work.");
        clicents[pId].scheduleState = ScheduleState.released;
        user[lancer_id].scheduleState = ScheduleState.released;
        address payable lan_add = payable(user[lancer_id].lancer_add);
        lan_add.transfer(clicents[pId].p_amt);
    }

}