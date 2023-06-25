// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 < 0.9.0;


contract TotalCount
{
    
    struct Data{
        address A;
        string name;
    }
    struct Voter{
        bool isVoted;
        string name;
    }
    event dataLog(address , string);
    Data[] database;
    string public primary_name;
    address public primary_address;
    mapping(address => Voter)  flag;
    uint public count;
    

    function vote(string memory _name) public{
        if(flag[msg.sender].isVoted == false){
            flag[msg.sender].isVoted = true;
            flag[msg.sender].name = _name;
            count++;
            database.push(Data(msg.sender , _name));
        }
        if(count == 1){
            primary_name = flag[msg.sender].name;
            primary_address = msg.sender;
        }
    }

    function ShowData(address _primary) public view returns(Data[] memory){
        if(_primary == primary_address){
            return database;
        }
        Data[] memory temp;
        return temp;
    }

    function logData(address _primary) public {
        if(_primary == primary_address){
            for(uint i = 0; i < database.length; i++){
                emit dataLog(database[i].A , database[i].name);
            }
        }
    }

}