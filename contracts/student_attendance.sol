// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.5.0 <= 0.9.0;

contract attendance_result {

    struct studentInfo {
        uint roll_no;
        string name;
        string std;
        uint total_a;
        uint total_p;
    }

    mapping (uint => studentInfo) public student;

    function createStudent(uint id, string memory name, string memory std) public {
        uint a = student[id].total_a;
        uint p = student[id].total_p;

        student[id] = studentInfo(id, name, std, a, p);
    }

    function studentAttendance(uint roll_no, uint attendance) public {
        if(attendance == 1) {
            if(student[roll_no].total_a >= 1){
                student[roll_no].total_a += 1; 
            } else {
                student[roll_no].total_a = 1;
            }
        } 
        if(attendance == 0) {
            if(student[roll_no].total_p >= 1) {
                student[roll_no].total_p += 1;
            } else {
                student[roll_no].total_p = 1;
            }
        }
    }



}