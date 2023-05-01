// SPDX-License-Identifier: GPL-3.0

pragma solidity >= 0.7.0 <0.9.0;

contract StudentResult {

    uint mathe;
    uint hind;
    uint scince;
    uint social_scince;
    uint gujrati;
    uint sanskrit;
    uint computer;

    function Setmathe(uint m_mathe) public {
        mathe = m_mathe;
    }

    function Sethind(uint m_hind) public {
        hind = m_hind;
    }
    
    function Setscince(uint m_scince) public {
        scince = m_scince;
    }
    
    function Setsocial_scince(uint m_social_scince) public {
        social_scince = m_social_scince;
    }
    
    function Setgujrati(uint m_gujrati) public {
        gujrati = m_gujrati;
    }

    function Setsanskrit(uint m_sanskrit) public {
        sanskrit = m_sanskrit;
    }

    function Setcomputer(uint m_computer) public {
        computer = m_computer;
    }

    function Getmark() public view returns(uint total){
        return total = mathe+hind+scince+social_scince+gujrati+sanskrit+computer;
    }

    function Getper() public view returns(uint per){
        return per = (mathe+hind+scince+social_scince+gujrati+sanskrit+computer)/7;
    }

    function Getgrade() public view returns(string memory grade){
        uint Gradeper = (mathe+hind+scince+social_scince+gujrati+sanskrit+computer)/7;
        if(Gradeper <= 50){
            grade = 'C';
        } else if(Gradeper >= 50 && Gradeper <= 60){
            grade = 'B';
        } else if(Gradeper >= 60 && Gradeper <= 70){
            grade = 'A';
        } else if(Gradeper >= 70 && Gradeper <= 80){
            grade = 'A+';
        } else if(Gradeper >= 80 && Gradeper <= 90){
            grade = 'A++';
        } else if(Gradeper > 90){
            grade = 'Top';
        }
        return grade;
    }




}