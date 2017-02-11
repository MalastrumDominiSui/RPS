var prompt = require('prompt');

function Rps_game (aGame) {
	this.rock = [0,0,1];
	this.paper = [1,0,0];
	this.scissors = [0,1,0];
	this.playOneWep = [];
	this.playTwoWep = [];

		this.get_weapon_values = function(){
			prompt.start();
			prompt.get(['playerOneWeapon', 'playerTwoWeapon'], function (err, result)  {
  			//console.log('Weapons Chosen:');
  			//console.log('  Player1 weapon: ' + result.playerOneWeapon);
 			//console.log('  Player2 weapon: ' + result.playerTwoWeapon);
				playOneWep = result.playerOneWeapon;
				playTwoWep = result.playerTwoWeapon;
			});
		}

		this.roShamBo = function(xPlayer, yPlayer){
			var compare = [0,0,0];
			forEach (i = 0; i < compare.length; i++) {
				compare[i] = xPlayer.wep[i] + yPlayer.wep[i]
 			}
		};
		

}

function aPLayer (aWeapon, currentScore){
	this.set_currentScore_zero = function(playerOne, playerTwo){
		this.wep = aWeapon;
		this.cScore = currentScore;
	};
}





	



function roShamBo(handOneArr,handTwoArr){
		for (i = 0; i < 3; i++) {
			wepOne[i] + wepTwo[i]
 		}
 	//rock + paper = [1,2,1] => paper win
 	//rock + scissor = [2,1,1] => rock win
 	//paper + scissor = [1,1,2] => scissor win
}

//newRps = Rps_game.new;

newRps.promptPlayer1

newRps.promptPlayer2

newRps.displayWinner

//TESTS TESTS TESTS



