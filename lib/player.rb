require 'pry'
require "rubocop"

class Player 
    attr_accessor :name, :life_points

    def initialize(name)
        @name = name 
        @life_points = 10
    end

    def show_state
        return "#{@name} a #{@life_points} points de vie !"
    end

    def gets_domage(domage)
        @domage = domage
        @life_points -= domage 

        if @life_points <= 0 
            puts "Le joueur #{@name} a été tué !"
        else show_state
        end

    end

    def attacks(player)
        puts "Le joueur #{@name} attaque le joueur #{player.name} !"
        domage = compute_damage 
        
        puts " --------------------------------------"
        print " "
        puts "Le joueur #{@name} vient d'infliger #{domage} points de domages à #{player.name} !"
        player.gets_domage(domage)
    end

    def compute_damage
        return rand(1..6)
    end
    
end

class HumanPlayer < Player
    attr_accessor :weapon_level

    def initialize(name)
        @name = name
        @weapon_level = 1
        @life_points = 100
    end

    def show_state
        puts "#{@name} a #{@life_points} points de vie avec une arme de niveau #{weapon_level}!"
    end

    def compute_damage
        rand(1..6) * @weapon_level
    end

    def search_weapon 
        level_arm = rand(1..6)

        puts "Tu as trouvé une arme de niveau #{level_arm}"
        
        if level_arm > @weapon_level 
            @weapon_level = level_arm
            puts "Youhou !! Tu as trouvée un putin de meilleure arme !!"
        else puts "Non, t'a trouvée une arme de merde, pose là !"
        end

    end

    def search_health_pack
        dice_of_life = rand(1..6)

        if dice_of_life == 1 
            puts "> Ton résultat : #{dice_of_life}"
            puts "Tu n'a rien trouvé putin..."
        elsif dice_of_life == 6
            puts "> Ton résultat : #{dice_of_life}"
            puts "HO PUTINNN !! Tu as trouver un pack de vie de 80 points batard !"
                if @life_points <= 20 
                    @life_points += 80
                    puts "Ta vie est de #{@life_points} points maintenant !"
                else puts "Tu as déjà trop de vie.."
                end
        else puts "Bravo, tu as trouvé un pack de +50 points de vie !"
            puts "> Ton résultat : #{dice_of_life}"
            if @life_points <= 50 
                @life_points += 50
                puts "Ta vie est de #{@life_points} points maintenant !"
            else puts "Tu as déjà trop de vie.."
            end
        end
    end

    
end
