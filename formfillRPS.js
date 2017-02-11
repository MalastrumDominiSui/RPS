function formFillRps(){
	rpsAry = ["Rock","Paper","Scissors"]
	min = Math.ceil(0);
  	max = Math.floor(3);
  	rndNum = Math.floor(Math.random() * (max - min)) + min
  	//console.log(rpsAry[rndNum]);
  	return rpsAry[rndNum];
}
//formFillRps();

function runFormFillX(number) {
	rockCount = 0;
	paperCount = 0;
	scissorsCount = 0;
	for (i=1; i <= number; i++){
		switch(formFillRps()){
			case "Rock":
				rockCount++;
				break;
			case "Scissors":
				scissorsCount++;
				break;
			case "Paper":
				paperCount++;
				break;
		}
	}
	console.log(rockCount);
	console.log(paperCount);
	console.log(scissorsCount);
}

runFormFillX(1000000)

