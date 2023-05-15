// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.7.0 <= 0.9.0;

contract eventorg{
    
    // eventAdmin, eventName, eventDate, TotalTicket, remainTicket, eventCity, eventFee = 0 & 1
    // features of event 
        // add many event
        // event participanet
    // uint num = 5;

    // event struct
    struct eventInfo {
        string organiser;
        string eventname;
        uint eventdate;
        uint eventticket;
        uint eventRemticket;
        string evnetcity;
        uint eventfee;
    }

    // user struct 
    // struct userInfo {
    //     string name;
    //     uint pur_ticket;
    //     uint[] eventId;
    // }

    // uint[] blankArr;

    // save Event information

    mapping(uint=>eventInfo) public eventData;

    function CreateEvent(uint eventid, string memory organiser, string memory eventname, uint eventticket, string memory evnetcity, uint eventfee) public{
        uint eventremticket = eventticket;
        uint timetamp = block.timestamp;
        eventData[eventid] = eventInfo(organiser, eventname, timetamp, eventticket, eventremticket, evnetcity, eventfee);
        // eventInfo memory ab = eventData[eventid];
    }

    // save User information 

    // mapping(uint=>userInfo) public userData;
    // mapping(address => mapping (uint => uint)) tickets;

    // function CreateUser(uint userID, uint pur_ticket, uint user_eventid) public {

    //     // eventData[user_eventid];
    //     // require(pur_ticket);
    //     // blankArr.push(user_eventid);        
    //     // userData[userID] = userInfo(name, pur_ticket, blankArr);
    // }

    function getEvent(uint id) public view returns(eventInfo memory) {
        // return  eventInfo = eventData[id];
        // return eventData[id]
    } 



    // function joinEvent(uint keyVal) public{
    //     eventData[keyVal].length;
    // }


    // uint[] public eventArray;

    // eventInfo Create_event;

    // function CreateEvent(string memory organiser, string memory eventname, uint eventticket, string memory evnetcity, uint eventfee) public{
        // uint eventremticket = eventticket;
        // uint timetamp = block.timestamp;
        // Create_event = eventInfo(organiser, eventname, timetamp, eventticket, eventremticket, evnetcity, eventfee);
    // }

    // function liveEvent() public {
        // eventArray.push(Create_event);
    // }

    // function showEvent() public view returns(string memory, string memory, uint, uint, uint, string memory, uint){
    //     return (Create_event.organiser, Create_event.eventname, Create_event.eventdate, Create_event.eventticket, Create_event.eventRemticket, Create_event.evnetcity, Create_event.eventfee);
    // }



}