require 'bundler'
Bundler.require

require_relative 'lib/player'
require_relative 'lib/game'

#player1 = Player.new("Josianne")
#player2 = Player.new("josé")

#puts "========== Voici l'état de chaque joueur =========="
#puts "> #{player1.show_state}"
#puts "> #{player2.show_state}"
#puts " "

#puts "========== Passons à la phase d'attaque ! =========="
#puts " "

#while player1.life_points > 0 && player2.life_points > 0 do 
#    player1.attacks(player2)
#    puts player2.show_state
#
#        break if player2.life_points <= 0 && player1.life_points <= 0  
#
#    player2.attacks(player1)
#    puts player1.show_state
#end

binding.pry