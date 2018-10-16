pragma solidity ^0.4.25;
pragma experimental ABIEncoderV2;

contract OnlineExam {
//structre for questions
    struct question{
        uint qnum;
        string question_name;
        string[4] options;
    }
 //structure for students
    struct student {
        address idaddress;
        uint scored;
    }
    uint public studentcount;
    uint public questioncount;
    mapping(uint => student) public students;
    mapping(uint => question) public questions;
//quetions for exam
    function OnlineExam() public{
        string[4] option;
        option[0] = "2";
        option[1] = "3";
        option[2] = "4";
        option[3] = "9";
        addQuestion("2*2?",option);
        option[0] = "2";
        option[1] = "6";
        option[2] = "4";
        option[3] = "9";
        addQuestion("3*2?",option);
        option[0] = "2";
        option[1] = "-3";
        option[2] = "4";
        option[3] = "-2";
        addQuestion("3-5?",option);
    }
//add questions to online test
    function addQuestion(string _question,string[4] _options) private{
        questioncount ++;
        questions[questioncount] = question(questioncount,_question,_options);
    }
//caliculate the scroces
    function caliculateScore(string[3] _answers) public {
        uint i;
        uint score;
        //answers for questions
        string[3] organswers;
        organswers[0] = "4";
        organswers[1] = "6";
        organswers[2] = "-2";
        string a;
        string b;
        for(i=0;i<=3;i++) 
        {
            if(_answers *[i] == organswers[i]) 
            {
                score = score ++;
            }
        }
        //require(!students[msg.sender]);
        if(score >=0) {
            studentcount ++;
            students[studentcount] = student(msg.sender,score);
        }
    }
//Admin function to get list of students
    function Admin() public returns(address[],uint[]){
        uint i;
        address[4] _address;
        uint[4] _score;
        for(i=1;i<=studentcount;i++){
            _address[i-1] = students[i].idaddress;
            _score[i-1] = students[i].scored;
        }
        return (_address,_score);
    }
}
