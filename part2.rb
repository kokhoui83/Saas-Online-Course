class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game)
  # check no of players
  raise WrongNumberOfPlayersError unless game.length == 2
  # check strategy
  raise NoSuchStrategyError unless game[0][1].scan(/[prsPRS]/).empty? == false
  raise NoSuchStrategyError unless game[1][1].scan(/[prsPRS]/).empty? == false

  player1 = game[0][1].downcase
  player2 = game[1][1].downcase

  if player1.eql?(player2)
    return game[0]
  elsif player1.eql?("r") and player2.eql?("s")
    return game[0]
  elsif player2.eql?("r") and player1.eql?("s")
    return game[1]
  elsif player1.eql?("s") and player2.eql?("p")
    return game[0]
  elsif player2.eql?("s") and player1.eql?("p")
    return game[1]
  elsif player1.eql?("p") and player2.eql?("r")
    return game[0]
  elsif player2.eql?("p") and player1.eql?("r")
    return game[1]
  else
    return game[0]
  end

end

def rps_tournament_winner(tournament)
  
  if tournament.flatten.count == 4
    return rps_game_winner(tournament)
  else
    result = Array.new(2)

    result[0] = rps_tournament_winner(tournament[0])
    result[1] = rps_tournament_winner(tournament[1])

    return rps_tournament_winner(result)
  end

end

#rps_game_winner [[ "Armando", "r" ], [ "Dave", "s" ]]
#rps_game_winner [[ "Armando", "s" ], [ "Dave", "P" ]]
#rps_game_winner [[ "Armando", "P" ], [ "Dave", "r" ]]

#rps_tournament_winner [[ "Armando", "r" ], [ "Dave", "s" ]]
#rps_tournament_winner [[[["Armando", "P"], ["Dave", "S"]], [["Richard", "R"], ["Michael", "S"]],], [[["Allen", "S"], ["Omer", "P"]], [["David E.", "R"], ["Richard X.", "P"]]]]



