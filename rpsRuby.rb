## Ruby RPS, a convoluted experiment in defining classes
## and a non- if-then based method to compare rock, paper and scissors
require 'pry'
$rock = {:beatsR => 0,:beatsP => 0,:beatsS => 1,:name => "rock"}
$paper = {:beatsR => 1,:beatsP => 0,:beatsS => 0,:name => "paper"}
$scissors = {:beatsR => 0,:beatsP => 1,:beatsS => 0,:name => "scissors"}

$weaponHashCollection = [$rock, $paper, $scissors]

class Player
		@name = ""
		@weapon = ""
		@weaponHsh = {} 
		@score = 0
	
	def initializePlayer
		@name = ""
		@weapon = ""
		@weaponHsh = {}
		@score = 0
	end

	def resetPlayerWeapon
		@weapon = ""
		@weaponHsh = {}
	end

	def name
		return @name
	end

	def weapon
		return @weapon
	end

	def score
		return @score
	end

	def weaponHsh
		return @weaponHsh
	end

	def addWin(aplayer)
		@score += 1
	end

	def playerWepArray  # defining this helps us do the roShamBo(comparing) later
		return [@weaponHsh[:beatsR], @weaponHsh[:beatsP], @weaponHsh[:beatsS]]
	end

	def getName()
		print "What is your name? : "
		@name = gets.chomp().capitalize
	end

	def getWeapon()
		print @name+ ", Choose your weapon: (Rock, Paper, or Scissors) : "
		userStr = gets.chomp()
		if ["rock","paper","scissors"].include?(userStr)
			@weapon = userStr
			return @weapon
		elsif ["gun","brick","dragon","chainsaw","garbage truck", "knife", "hammer"].include?(userStr)
			puts "Creative.. but no.. try again"
			getWeapon()
		else 
			puts "not a valid input for RPS. Try Again."
			getWeapon()
		end

	end

	def checkWeaponHash
		if @weapon == "rock"
			@weaponHsh = $rock
		elsif @weapon == "paper"
			@weaponHsh = $paper
		elsif @weapon == "scissors"
			@weaponHsh = $scissors

 		else
     		puts "This is not a valid option for Ro-Sham-Bo.  Try Again"
     	end
	end
end

def playAgain(xPlayer, yPlayer)
	puts "Well then... #{xPlayer.name} and #{yPlayer.name} Would you like to play again? Y/N"  # I could use same names if functions were well seperated, then get new names if they wanted friends to play
	userYorN = gets.chomp
 	if (userYorN == "yes"||userYorN == "y")
 		puts "LETS DO IT!"
     		##insert code to start program over, perhaps a new game method?
   	else
     	puts"Bye!"
    end
end

def isWinner(xPlayer, yPlayer, int)
	if xPlayer.weapon == yPlayer.weapon
		puts "The same weapons were chosen, the result is a tie!"
		bestOfFive(xPlayer,yPlayer)
	elsif xPlayer.weaponHsh == $weaponHashCollection[int]
		puts "Player #{xPlayer.name} wins with the magnificent #{xPlayer.weapon}!!"
		xPlayer.addWin(xPlayer)
	else
		puts "Player #{yPlayer.name} wins with the magnificent #{yPlayer.weapon}!!"
		yPlayer.addWin(yPlayer)
	end
end


def roShamBo(xPlayer, yPlayer)  ## taking player class objects
	wepArr = weaponsClash(xPlayer, yPlayer)

	if wepArr.index(0) == 0
		isWinner(xPlayer, yPlayer, 0)
	elsif wepArr.index(0) == 1
		isWinner(xPlayer, yPlayer, 1)
	else
		isWinner(xPlayer, yPlayer, 2)
	end

 end

def weaponsClash(xPlayer, yPlayer)
	i = 0
	compareWepArr = [0,0,0]
	while i<2 do
		compareWepArr[i] = xPlayer.playerWepArray[i] + yPlayer.playerWepArray[i]
		i+=1
	end
	return compareWepArr
end

def getPlayerWeaponInput(player)
	player.getWeapon
	player.checkWeaponHash
	puts player.name + " has chosen the " + player.weapon
end

def wonSet(player1, player2)
	if player1.score > 2
		puts "#{player1.name} is triumphant, with a total #{player1.score} wins!"
		return (true)
	elsif player2.score > 2
		puts "#{player2.name} is triumphant, with a total #{player2.score} wins!"
		return(true)
	else
		return(false)
	end
end

def declareWinner(player1,player2)
	wonSet(player1,player2)
	if player1.score > player2.score
		"#{player1.name} is winning!"
	else
		"#{player2.name} is winning"
	end
end

def bestOfFive(player1,player2)
	if player1.score < 3 && player2.score < 3
		puts "Best 3 out of 5?"
		puts "#{player1.name} has #{player1.score} wins, and #{player2.name} has #{player2.score} wins!"
		newGameSamePlayers(player1,player2)
	else
		declareWinner(player1,player2)
	end
end

def newGameSamePlayers(player1,player2)
	player1.resetPlayerWeapon
	player2.resetPlayerWeapon
	getPlayerWeaponInput(player1)
	getPlayerWeaponInput(player2)
	roShamBo(player1,player2)
	bestOfFive(player1,player2)
end

def newGame
	player1 = Player.new
	player2 = Player.new

	player1.initializePlayer
	player2.initializePlayer

	print "HARK! Player number one! "
	player1.getName
	print "EGADS! Player number two... "
	player2.getName

	getPlayerWeaponInput(player1)
	getPlayerWeaponInput(player2)

	roShamBo(player1,player2)

	bestOfFive(player1,player2)
end

newGame



## TEST FOR Player.getName  seems trivial to test, but what the heck
# def getNameTEST(string)
# 	#puts "What is your name? : "
# 	name = string
# 	return (name)
# end

# puts "Test for Player.getName is " + "#{getNameTEST("Brian") == "Brian"}"
# puts "Test for Player.getName is " + "#{getNameTEST("Conquessha") == "Conquessha"}"
# puts "Test for Player.getName is " + "#{getNameTEST("12") == "12"}"
# puts "Test for Player.getName is " + "#{getNameTEST("AOFIJASEOIflkjnffoiauw") == "AOFIJASEOIflkjnffoiauw"}"




