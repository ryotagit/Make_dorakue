class Brave
    
 # attr_readerの記述でゲッターを省略することができる
  attr_reader :name, :offense, :defense
#   ↑は下に同じ
#   def name
#       @name
#   end

 # セッターゲッターを一括定義
  attr_accessor :hp

  def initialize(**params)
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
  end
  
  def attack(monster)
   puts "テスト：#{monster.name}のHPを表示 -> #{monster.hp}"
  end

end

class Monster
 attr_reader :name, :offense, :defense
 attr_accessor :hp

  def initialize(**params)
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
  end
 
end

monster = Monster.new(name: "スライム", hp: 250, offense: 200, defense: 100)

brave = Brave.new(name: "テリー", hp: 500, offense: 150, defense: 100)

# initializeメソッドにより簡略化↓
# brave.name = "テリー"
# brave.hp = 500
# brave.offense = 150
# brave.defense = 100

# puts <<~TEXT
# NAME：#{brave.name}
# HP：#{brave.hp}
# OFFENSE：#{brave.offense}
# DEFENSE：#{brave.defense}
# TEXT

brave.hp -= 30

puts "#{brave.name}はダメージを受けた!　残りHPは#{brave.hp}だ"