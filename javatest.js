///TODO: break down into some tests
var prompt = require('prompt');

prompt.start();


prompt.get(['playerOneName','playerTwoName','playerOneWeapon', 'playerTwoWeapon'], function (err, result)  {
	var rock = [0,0,1,"rock"];
	var paper = [1,0,0,"paper"];
	var scissors = [0,1,0,"scissors"];

	var weaponCollection = [rock , paper, scissors];

	var pOneName = result.playerOneName;
	var pTwoName = result.playerTwoName;

	var player1 = [0,0, pOneName];
	var player2 = [0, 0, pTwoName];

	
	var snarkyResponses = ["RUH ROH!... ", "AW HeEEEilllzzz no! ", "WUT? You cray? Zee? ", "Awwwwwww SNAP! ", "Croiky! " ];

	function generateRandomSnakr(snarkArr){  // generates random response from array above
	min = Math.ceil(0);
  	max = Math.floor(snarkArr.length);
  	rndSnarkStr = Math.floor(Math.random() * (max - min)) + min
  	return snarkArr[rndSnarkStr];
	}

	function isInWeaponCollection(playerWep, aWeaponStr){
		return(playerWep == aWeaponStr);
	}

	function setWeapon(aPlayerArr, aWeaponStr) {
		for (var i=0; i<3; i++){       //checks to see if player One chose a weapon from weaponCollection and sets that value for them
     		if (isInWeaponCollection(aWeaponStr, weaponCollection[i][3])){
     			aPlayerArr[0] = weaponCollection[i];
     		}
     	}
	}
   
    setWeapon(player1, result.playerOneWeapon);
    setWeapon(player2, result.playerTwoWeapon);

    function sillyCommentChoices(player){
    	 console.log(generateRandomSnakr(snarkyResponses) +player[2]+ " picked up the " + player[0][3] )
    }

    sillyCommentChoices(player1);
    sillyCommentChoices(player2);

   
    //console.log(" Oh HECK NAW.. "+ pTwoName+ " picked up the " + player2[0][3] )

function playAgain(){   // allows us to play again if we want to based on yes or no answer from user
	prompt.start();

  	prompt.get(["yesOrNo"], function (err, result) {
    	console.log('Well then...');
     	if (result.yesOrNo == "yes"){
     		console.log("LETS DO IT!");
     		//insert code to start program over
     	}
     	else
     		console.log("Bye, you cowards!");
  	}); // end prompt
	console.log("Would you like to play again? (type yes or no)");
}


//DISPLAY WINNER no need to test, this is just console.log

displayWinner = function(playerArr, weaponArrElement){
	console.log(playerArr[2] + " wins with a "+ weaponArrElement +"!");
}

// This function takes two players and compares their weapons, adds their wep values, and determines who wins.
roShamBo = function(xPlayer, yPlayer){
	var compareWep = [0,0,0];

	if (xPlayer[0] == yPlayer[0]){
		console.log("Tie");
		playAgain();
		return;
	}

	for(var i=0; i <compareWep.length;i++) {
		compareWep[i] = xPlayer[0][i] + yPlayer[0][i];
	}
 	for(var i=0; i<3; i++) {
 		if (compareWep[i] == 0) {
			if (xPlayer[i] == weaponCollection[i[3]]) {
				displayWinner(yPlayer, weaponCollection[i][3]);
				return(xPlayer[0])
			}
			else {
				displayWinner(xPlayer, weaponCollection[i][3]);
				return(yPlayer[0])
			}
		}
	}

}

roShamBo(player1,player2);

	//Test Setup
	function didTestWork(testFunStr,num,bool){
		console.log("Test for " +testFunStr+ " number " + num+ " was " + bool)
	}	

	//setWeaponTEST
	var currentTestStr = "setWeapon"
	var player3 = [rock, 0,"Edward"];
	var player4 = [paper, 0,"Finstinkle"];
	var player5 = [scissors, 0,"Snickerdoodle"]; //catch all the weapon cases
	setWeapon(player3);
	didTestWork(currentTestStr, 1, player3[0] == rock);
	setWeapon(player4);
	didTestWork(currentTestStr, 2, player4[0] == paper);
	setWeapon(player5);
	didTestWork(currentTestStr, 3, player5[0] == scissors);
	// end setWeaponTEST


}); // weapon get prompt



