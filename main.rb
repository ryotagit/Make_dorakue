class Brave
    
 # new演算子から渡された引数を受け取る
 # paramsで一括で受け取る
  def initialize(**params)
    # 各パラメータをハッシュで取得
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
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

brave = Brave.new(name: "テリー", hp: 500, offense: 150, defense: 100)

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