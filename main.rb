class Brave
    
 # attr_readerの記述でゲッターを省略することができる
  attr_reader :name, :offense, :defense
#   ↑は下に同じ
#   def name
#       @name
#   end

 # セッターゲッターを一括定義
  attr_accessor :hp
  
  SPECIAL_ATTACK_CONSTANT = 1.5

  def initialize(**params)
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
  end
  
  def attack(monster)
   # puts "テスト：#{monster.name}のHPを表示 -> #{monster.hp}"
   puts "#{@name}の攻撃"
   
   attack_type = decision_attack_type
   
   damage = calculate_damage(target:monster, attack_type:attack_type)
   
   cause_damage(target:monster, damage:damage)
   
   puts "#{monster.name}の残りHPは#{monster.hp}だ"
  end
  
private
  
  def decision_attack_type
    attack_num = rand(4)

    if attack_num == 0
      puts "必殺攻撃"
      "special_attack"
    else
      puts "通常攻撃"
      "normal_attack"
    end
  end
  
   def calculate_damage(**params)
     
     target = params[:target]
     attack_type = params[:attack_type]
     
    if attack_type == "special_attack"
      calculate_special_attack - target.defense
    else
      @offense - target.defense
    end
  end
  
  def cause_damage(**params)
    damage = params[:damage]
    target = params[:target]
    
    target.hp -= damage
    target.hp = 0 if target.hp < 0
    puts "#{target.name}は#{damage}のダメージを受けた"
  end
  
  def calculate_special_attack
    @offense * SPECIAL_ATTACK_CONSTANT
  end


end

class Monster
 attr_reader :offense, :defense
 attr_accessor :hp, :name
 
 POWER_UP_RATE = 1.5
 CALC_HALF_HP = 0.5

  def initialize(**params)
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
    
    @transform_flag = false
    @trigger_of_transform = params[:hp] * CALC_HALF_HP
  end
  
  def attack(brave)
   # puts "テスト：#{monster.name}のHPを表示 -> #{monster.hp}"
   
    if @hp <= @trigger_of_transform && @transform_flag == false
     
      @transform_flag = true
      transform
      
    end
   puts "#{@name}の攻撃"
   damage = calculate_damage(brave)
   
   cause_damage(target:brave, damage:damage)
   
   puts "#{brave.name}の残りHPは#{brave.hp}だ"
  end
  
  
  private
  
  def calculate_damage(target)
      @offense - target.defense
  end
  
  def cause_damage(**params)
      # 引数で受け取った値を変数に格納
      damage = params[:damage]
      target = params[:target]

      target.hp -= damage
      target.hp = 0 if target.hp < 0
      puts "#{target.name}は#{damage}のダメージを受けた"
  end

  # 変身メソッドの定義
  def transform
    
    # 変身後の名前
      transform_name = "ドラゴン"

      # 変身メッセージ
      puts <<~EOS
      #{@name}は怒っている
      #{@name}は#{transform_name}に変身した
      EOS

      # モンスターの攻撃力を1.5倍にする
      @offense *= POWER_UP_RATE
      # モンスターの名前を変更
      @name = transform_name

  end
 
 
 
end

monster = Monster.new(name: "スライム", hp: 250, offense: 200, defense: 100)

brave = Brave.new(name: "テリー", hp: 500, offense: 150, defense: 100)


loop do
  brave.attack(monster)
  
  if monster.hp <= 0
    exp = (monster.offense + monster.defense) * 2
    gold = (monster.offense + monster.defense) * 3
    puts "#{brave.name}はたたかいに勝った"
    puts "#{exp}の経験値と#{gold}ゴールドを獲得した"
    break
  end
  
  monster.attack(brave)
  
  if brave.hp <= 0
    puts "#{brave.name}はたたかいに負けた"
    puts "目の前が真っ暗になった"
    break
  end
  
end

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

# brave.hp -= 30

# puts "#{brave.name}はダメージを受けた!　残りHPは#{brave.hp}だ"