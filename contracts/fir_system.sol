// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.5.0 <= 0.9.0;

contract fir_system{
    struct firInfo {
        uint fir_id;
        string report;
        uint report_date;
        string resolve;
        uint solve_date;
    }

    mapping (uint => firInfo) public GetFirInfo;

    function submitFIR(uint id, string memory rep) public {
        uint rep_date = block.timestamp;
        uint reso_date = 0;
        string memory reso = "NO";
        GetFirInfo[id] = firInfo(id, rep, rep_date, reso, reso_date);
    }

    function resolveFIR(uint id, string memory reso) public {
        GetFirInfo[id].resolve = reso;
        GetFirInfo[id].solve_date = block.timestamp;
    }

}