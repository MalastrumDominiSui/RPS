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

	var player1 = [result.playerOneWeapon,0, pOneName];
	var player2 = [result.playerTwoWeapon, 0, pTwoName];
    
    for (var i=0; i<3; i++){       //checks to see if player One chose a weapon from weaponCollection and sets that value for them
    	if (result.playerOneWeapon == weaponCollection[i][3]){
    		player1[0] = weaponCollection[i];
    	}
    }

    for (var i=0; i<3; i++){  // checks for player two what weapon from collection, sets it in their collection
    	if (result.playerTwoWeapon == weaponCollection[i][3]){
    		player2[0] = weaponCollection[i];
    	}

    }

    console.log(" Aww snap! " +pOneName+ " picked up the " + player1[0][3] )
    console.log(" Oh HECK NAW.. "+ pTwoName+ " picked up the " + player2[0][3] )

    if (pOneName == pTwoName){
    	console.log("WHY ARE YOU FIGHTING YOURSELF??")
    }


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
				displayWinner(xPlayer, weaponCollection[i][3]);
				return(xPlayer[0])
			}
			else {
				displayWinner(yPlayer, weaponCollection[i][3]);
				return(yPlayer[0])
			}
		}
	}

}

roShamBo(player1,player2);


}); // weapon get prompt