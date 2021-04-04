class Brave
    
  def initialize
    @name = "テリー"
    @hp = 500
    @offense = 150
    @defense = 100
  end

  # nameのゲッター
  def name
    @name
  end

  # hpのゲッター
  def hp
    @hp
  end

  # offenseのゲッター
  def offense
    @offense
  end

  # defenseのゲッター
  def defense
    @defense
  end
  
end

brave = Brave.new

# initializeメソッドにより簡略化↓
# brave.name = "テリー"
# brave.hp = 500
# brave.offense = 150
# brave.defense = 100

puts <<~TEXT
NAME：#{brave.name}
HP：#{brave.hp}
OFFENSE：#{brave.offense}
DEFENSE：#{brave.defense}
TEXT