require "sinatra"
require "./rpsRuby.rb"
require "pry"

enable :sessions

get '/' do
	session["tie"] = false  ## flips the tie switch back off
	erb :home
end

get '/home' do
	player1 = Player.new
	player1.initializePlayer
	player1.setWepAndNameAndHash_fromPost(params['player1name'],params['weapon'])
	session["player1"] = player1


	erb :player1got
end

get '/get_player1_info' do
	player2 = Player.new
	player2.initializePlayer
	player2.setWepAndNameAndHash_fromPost(params['player2name'],params['weapon'])
	session["player2"] = player2
	if roShamBo(session["player1"],session["player2"]) != nil 
		roShamBo(session["player1"],session["player2"]).addWin
		erb :player2got
	else
		session["tie"] = true #give player2got a variable to work with
		erb :home  # or not home, because we want to use same names?
	end
end

get '/get_player2_info' do
	roShamBo(session["player1"],session["player2"]).addWin
	if isScoreAboveThree(session["player1"],session["player2"]) == false
		@scoreAboveThree = false
	else
		@scoreAboveThree = true
	end
	erb :player2got
end

get '/roShamBo' do


end

