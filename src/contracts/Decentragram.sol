pragma solidity ^0.5.0;

contract Decentragram {
  string public name = 'Decentragram';

  // store Image
  uint public imageCount = 0;
  mapping(uint => Image) public images;

  struct Image{
    uint id;
    string hash;
    string description;
    uint tipAmount;
    address payable author;
  }
  event ImageCreated(
    uint id,
    string hash,
    string description,
    uint tipAmount,
    address payable author
  );

  // Create Image
  function uploadImage(string memory _imgHash,string memory _description) public{
   // Make sure image hash exists
    require(bytes(_imgHash).length > 0);
    // Make sure image description exists
    require(bytes(_description).length > 0);
    // Make sure uploader address exists
    require(msg.sender!=address(0x0));
    // Increment image id
    imageCount ++;
    // Add image to contract
    images[imageCount] = Image(imageCount,_imgHash,_description,0,msg.sender);
    // Trigger an event
    emit ImageCreated(imageCount,_imgHash,_description,0,msg.sender);
  }
  // Tip Image
}