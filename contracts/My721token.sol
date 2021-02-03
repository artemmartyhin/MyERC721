pragma solidity ^0.7.4;

contract My721token{
    string public name;
    string public symbol;

    constructor(string memory _name, string memory _symbol){
        name=_name;
        symbol=_symbol;
    }

    mapping(address=>uint) tokens;
    mapping(uint=>address) owners;

    event Transfer(address indexed _from, address indexed _to, uint indexed _tokenId);
    event Approval(address indexed _owner, address indexed _approved, uint indexed _tokenId);


    function balanceOf(address _owner) public view returns(uint){
        return tokens[_owner];
    }
    function ownerOf(uint _tokenId) public view returns(address){
        return owners[_tokenId];
    }
    function TransferFrom(address _from, address _to, uint _tokenId) public payable{
        require(tokens[_from]==_tokenId);
        tokens[_from]=0;
        owners[_tokenId]=_to;
        tokens[_to]=_tokenId;
        emit Transfer(_from, _to, _tokenId);
    }
    function approve(address _approved, uint _tokenId) public payable{
        require(tokens[msg.sender]==_tokenId);
        tokens[_approved]=_tokenId;
        emit Approval(msg.sender, _approved, _tokenId);
    }
}