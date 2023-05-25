// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <= 0.9.0;

contract freelancing{

    struct clientInfo{
        address p_id;
        string project;
        uint p_amt;
        uint time_limit;
    }

    clientInfo[] clicents;
 
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

}