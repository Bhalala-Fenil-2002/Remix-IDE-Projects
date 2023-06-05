// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <= 0.9.0;

contract bikeRentel {

    address admin;

    constructor() {
        admin = msg.sender;
    }

    enum BikeStatus {avilable ,rented}

    struct bike{
        string name;
        uint b_no;
        uint renter_count;
        BikeStatus b_status; 
    }

    struct renter{
        address w_address;
        string f_name;
        string l_name;
        uint active;
        uint balance;
        uint due;
        uint ride_start;
        uint ride_end;
    }

    bike[] bikes;

    mapping(address=>renter) renterInfo;

    function AddRenter(string memory First_Name, string memory Last_Name) public payable {
        require(msg.value == 200, "Please pay 200 deposite.");
        renterInfo[msg.sender].w_address = msg.sender;
        renterInfo[msg.sender].f_name = First_Name;
        renterInfo[msg.sender].l_name = Last_Name;
        renterInfo[msg.sender].balance = msg.value;
    }

    function GetRenter(address r_address) public view returns(address, string memory, string memory, uint, uint, uint, uint, uint) {
        return( renterInfo[r_address].w_address,
            renterInfo[r_address].f_name,
            renterInfo[r_address].l_name,
            renterInfo[r_address].active,
            renterInfo[r_address].balance,
            renterInfo[r_address].due,
            renterInfo[r_address].ride_end,
            renterInfo[r_address].ride_start
        );
    }

    function AddBike(string memory Bike_Name, uint Bike_No) public {
        require(msg.sender == admin, "You don't have admin access.");
        bike memory bikess = bike(Bike_Name, Bike_No, 0, BikeStatus.avilable);
        bikes.push(bikess);
    }

    function GetBike(uint bike_) public view returns(string memory, uint, uint, BikeStatus) {
        return( bikes[bike_].name,
            bikes[bike_].b_no,
            bikes[bike_].renter_count,
            bikes[bike_].b_status
        );
    }

    function GetBalance() public view returns(uint) {
        require(msg.sender == admin, "You don't have admin access.");
        return address(this).balance;
    }

    function GetRenterBalance(address renter_add) public view returns(uint) {
        require(msg.sender == admin, "You don't have admin access.");
        return renterInfo[renter_add].balance;
    }

    function TimeDuration(address renter_add) public view returns (uint) {
        require(msg.sender == admin, "You don't have admin access.");
        require(renterInfo[renter_add].ride_start != 0, "Not found.");
        return renterInfo[renter_add].ride_start - renterInfo[renter_add].ride_end;
    }

    function CheckIn(address renter_add, uint bike_id, uint s_ride) public {
        require(renterInfo[renter_add].ride_start == s_ride, "Bike is not avilable for this duration");
        bikes[bike_id].b_status = BikeStatus.rented;
    }

    function CheckOut(address renter_add, uint bike_id, uint e_ride) public {
        require(renterInfo[renter_add].ride_end == e_ride, "Bike is not avilable for this duration");
        bikes[bike_id].b_status = BikeStatus.avilable;
    }

    function BookRide(address r_add, uint b_id, uint s_ride, uint e_ride) public {
        // require(renterInfo[r_add].balance == 50 || renterInfo[r_add].balance >= 50, "Insufficient deposite Balance. please add more deposite balance.");
        require(bikes[b_id].b_status == BikeStatus.avilable, "Bike is not avilable for this duration");
        // 1 duration = 2 pay
        if(renterInfo[r_add].balance == 50 || renterInfo[r_add].balance >= 50) {
            renterInfo[r_add].balance -= (s_ride - e_ride) * 2; 
        } else {
            renterInfo[r_add].due = (s_ride - e_ride) * 2;
        }
        renterInfo[r_add].ride_start = s_ride;
        renterInfo[r_add].ride_end = e_ride;
    }

}