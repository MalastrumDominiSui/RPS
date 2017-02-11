require 'pry'
$rock = {:beatsR => 0,:beatsP => 0,:beatsS => 1,:name => "rock"}
$paper = {:beatsR => 1,:beatsP => 0,:beatsS => 0,:name => "paper"}
$scissors = {:beatsR => 0,:beatsP => 1,:beatsS => 0,:name => "scissors"}

$weaponHashCollection = [$rock, $paper, $scissors]
#this should actually be something different

$rock1 = {:rockBeats => [0,0,1], :name => "rock"}
$paper1 = {:paperBeats => [1,0,0], :name => "paper"}
$scissors1 = {:scissorsBeats => [0,1,0], :name => "scissors"}

$weaponHashCollection2 = [$rock1[:rockBeats], $paper1[:paperBeats], $scissors1[:scissorsBeats]]





# Class Player: 
class Player
	#Returns the name, 
	attr_reader :name, :weapon, :score, :weaponHsh
	# sets all the initial values of a Player object to empty
	def initializePlayer
		@name = ""
		@weapon = ""
		@weaponHsh = {}
		@score = 0
	end
	#resets the player weapon string and Hash to null
	def resetPlayerWeapon
		@weapon = ""
		@weaponHsh = {}
	end
	# adds 1 to player score
	def addWin
		@score += 1
	end
	# returns an array of only the player weapon integers. defining this helps us iterate over the array for roShamBo(comparing) later
	def playerWepArray  
		return [@weaponHsh[:beatsR], @weaponHsh[:beatsP], @weaponHsh[:beatsS]]
	end
	# TODO, put this elsewhere, this is a console relate feature
	def getName
		print "What is your name? : "
		@name = gets.chomp().capitalize
	end
	# sets player weapon and names
	# nameQ is a query string passed through framework
	# wepQ will be a query string from a checkbox HTML form
	def setWepAndNameAndHash_fromPost(nameQ,wepQ) #specific to web app
		@name = nameQ.capitalize
		@weapon = wepQ
		setWeaponHash
	end
	 ## TODO refactor this
	 ## this takes input from user, checks to see if the input is actually a weapons
	 ## and has them retry until they get a matching weapon.
	def confirmUserWeaponLegit 
		print @name+ ", Choose your weapon: (Rock, Paper, or Scissors) : "
		userStr = gets.chomp()
		if ["rock","paper","scissors"].include?(userStr)
			@weapon = userStr
			return @weapon
		elsif ["gun","brick","dragon","chainsaw","garbage truck", "knife", "hammer"].include?(userStr)
			puts "Creative.. but no.. try again"
			confirmUserWeaponLegit
		else 
			puts "not a valid input for RPS. Try Again."
			confirmUserWeaponLegit
		end

	end
	#based on the string a player has as their weapon, sets their weapon hash
	def setWeaponHash
		if @weapon == "rock"
			@weaponHsh = $rock
		elsif @weapon == "paper"
			@weaponHsh = $paper
		else @weapon == "scissors"
			@weaponHsh = $scissors
		end
	end
	#TODO, refactor this and puts statements to console
	#this fuction calls to see if user input is legit, and then sets their weapon and hash, and gives
	# console feedback as to what they are so far
	def setAllWepAndConfirm
		confirmUserWeaponLegit
		setWeaponHash
		puts @name + " has chosen the " + @weapon
	end
end  ##end of Player class definition, perhaps this should be a player and a weapon?


#takes two Player class objects, asks them to play again
def playAgain(xPlayer, yPlayer)
	puts "Well then... #{xPlayer.name} and #{yPlayer.name} Would you like to play again? Y/N"  # I could use same names if functions were well seperated, then get new names if they wanted friends to play
	userYorN = gets.chomp
 	if (userYorN == "yes"||userYorN == "y")
 		puts "LETS DO IT!"
     		## need to flesh this out, reset values etc
   	else
     	puts "Bye!"
    end
end

# given two player objects, and the winning index, finds the player who won the game
def whoWon(xPlayer, yPlayer, int)
	if xPlayer.weaponHsh == $weaponHashCollection[int]
		#puts "Player #{xPlayer.name} wins with the magnificent #{xPlayer.weapon}!!"		
		return xPlayer
	elsif yPlayer.weaponHsh == $weaponHashCollection[int]
		#puts "Player #{yPlayer.name} wins with the magnificent #{yPlayer.weapon}!!"
		return yPlayer
	end
end

# returns true if players tie, false if not
def playerTie(xPlayer,yPlayer)
	return xPlayer.weapon == yPlayer.weapon
end

# given two player objects, adds their weapon matrices, finds winner based on
# which index is zero after matrices are added.
# Example weaponsClash adds rock => [0,0,1], and scissors => [0,1,0] = [0,1,1] rock wins [1,0,1] scissors wins etc
def roShamBo(xPlayer, yPlayer)
	wepArr = weaponsClash(xPlayer, yPlayer) 
		if playerTie(xPlayer,yPlayer)
			return nil
		elsif wepArr.index(0) == 0
			return whoWon(xPlayer, yPlayer, 0)
		elsif wepArr.index(0) == 1
			return whoWon(xPlayer, yPlayer, 1)
		else
			return whoWon(xPlayer, yPlayer, 2)
		end
 end
# given 2 player objects, adds their respective win matrices and returns the added result
def weaponsClash(xPlayer, yPlayer)
	i = 0
	compareWepArr = [0,0,0]
	while i<2 do
		compareWepArr[i] = xPlayer.playerWepArray[i] + yPlayer.playerWepArray[i]
		i+=1
	end
	return compareWepArr
end
# TODO : refactor the two below, get rid of putses, and make sure there is no redundancy.
# given 2 player objects, checks to see if either player has 3 wins yet, then prints who won
def whoWonSet(player1, player2)
	if player1.score > 2
		puts "#{player1.name} is triumphant, with a total #{player1.score} wins!"
		return (true)
	elsif player2.score > 2
		puts "#{player2.name} is triumphant, with a total #{player2.score} wins!"
		return(true)
	end
end
# given two player objects, checks to see if both players scores are less than 3, prints who won
# starts a new game with new players if score isn't 3 yet
# otherwise, refers to whoWon Set to say who won the set
def bestOfFive(player1,player2)
	if player1.score < 3 && player2.score < 3
		puts "Best 3 out of 5?"
		puts "#{player1.name} has #{player1.score} wins, and #{player2.name} has #{player2.score} wins!"
		newGameSamePlayers(player1,player2)
	else
		whoWonSet(player1,player2)
	end
end


def isScoreAboveThree(player1,player2)  ## developed for easier web compatibility 
	if player1.score < 3 && player2.score < 3
		return false
	else
		return true
	end
end

def newGameSamePlayers(player1,player2)
	player1.resetPlayerWeapon
	player2.resetPlayerWeapon

	player1.setAllWepAndConfirm
	player2.setAllWepAndConfirm

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

	player1.setAllWepAndConfirm
	player2.setAllWepAndConfirm

	roShamBo(player1,player2).addWin

	bestOfFive(player1,player2) #recursive function that calls newGameSamePlayers which calls bestofFive and exits once 3 wins are had
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




