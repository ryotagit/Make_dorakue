class Brave
    
  # nameのセッター
  def name=(name)
    @name = name
  end

  # nameのゲッター
  def name
    @name
  end

  def hp=(hp)
    @hp = hp
  end

  # hpのゲッター
  def hp
    @hp
  end

  def offense=(offense)
    @offense = offense
  end

  # offenseのゲッター
  def offense
    @offense
  end

  def defense=(defense)
    @defense = defense
  end

  # defenseのゲッター
  def defense
    @defense
  end
  
end

brave = Brave.new

brave.name = "テリー"
brave.hp = 500
brave.offense = 150
brave.defense = 100

puts <<~TEXT
NAME：#{brave.name}
HP：#{brave.hp}
OFFENSE：#{brave.offense}
DEFENSE：#{brave.defense}
TEXT