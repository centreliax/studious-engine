class Unit
  attr_accessor :name, :hp, :position

  def initialize(name, hp, position)
    @name = name
    @hp = hp
    @position = position
  end

  def move(new_pos)
    @position = new_pos
  end

  def attack(target)
    target.hp -= 10
    puts "#{@name} attacks #{target.name} for 10 damage!"
  end
end

class Game
  attr_accessor :units, :turn

  def initialize
    @units = []
    @turn = 0
  end

  def add_unit(name, hp, position)
    @units << Unit.new(name, hp, position)
  end

  def play_turn
    attacker, defender = @units
    attacker.attack(defender)
    @turn += 1
    puts "Turn #{@turn} completed."
    @units.rotate!
  end

  def show_status
    @units.each { |u| puts "#{u.name}: HP #{u.hp} Position #{u.position}" }
  end
end

game = Game.new
game.add_unit("Knight", 50, [0, 0])
game.add_unit("Archer", 40, [1, 1])

5.times do
  game.show_status
  game.play_turn
end

puts "Game Over."