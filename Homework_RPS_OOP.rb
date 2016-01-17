class Player
  attr_accessor :name
  def initialize (name= "Ian")
    @name = name
  end 
end
#---------------------------------------------------------------------------------------------------------#
# 人類玩家的類別
class Human < Player
  def get_gesture
    input = gets.chomp.upcase
  end
end
#---------------------------------------------------------------------------------------------------------#
# 電腦的類別
class Computer < Player
  def get_gesture
    input = ['R', 'P', 'S'].shuffle!.last
  end
end
#---------------------------------------------------------------------------------------------------------#
class RPS
  # initialize
  def initialize
      continue?
  end 
  #---------------------------------------------------------------------------------------------------------#
  def intro
    #印出開場畫面，告訴玩家遊戲規則
    puts "|===============================================|" 
    puts "|Welcome to Rock Paper Scissors!!!              |"
    puts "|===============================================|"
  end
  #---------------------------------------------------------------------------------------------------------#
  def decide(human_input,computer_input)
    #邏輯判斷式
     begin 
      puts "please choose one of the following: R / P / S"
      human_input_rps = human_input.get_gesture
    end while !["R", "P", "S"].include?(human_input_rps) 
    case human_input_rps
      when "R" then  user_int =  1 
      when "P" then  user_int =  2   
      when "S" then  user_int =  3 
    end
    puts "Hello , Human is name : #{human_input.name} ,  #{human_input_rps}"
    computer_input_rps = computer_input.get_gesture
    case computer_input_rps
      when "R" then  computer_int =  1  
      when "P" then  computer_int =  2  
      when "S" then  computer_int =  3  
    end
    puts "Hello , Computer is name : #{computer_input.name} ,  #{computer_input_rps}"
    result = user_int.to_i - computer_int.to_i
    show_message(result,user_int,computer_int)
  end
  #---------------------------------------------------------------------------------------------------------#
  def get_player_gestures
    #取得玩家和電腦兩個物件的
      human_input =  Human.new()
      computer_input =  Computer.new("Ruby")
      decide(human_input , computer_input)
  end
  #---------------------------------------------------------------------------------------------------------#
  def continue?
    #判斷玩家是否要繼續下一輪
    begin
      intro
      get_player_gestures
      begin
        puts "Play Again?: Y / N"
        continue = gets.chomp.upcase
      end while !["Y", "N"].include?(continue)
    end while continue != "N"
    # 若使用者回答 "N"，印出離開的訊息，不是就回到迴圈的上層繼續玩
    puts "Good Bye! Thanks for playing!"
  end
  #---------------------------------------------------------------------------------------------------------#
  def show_message(result,user_int,computer_input)
    #印出結果
      if computer_input == user_int then  puts "Rock Paper Scissors  :  end in a draw"
      elsif  result == 1 || result == -2  then  puts "Rock Paper Scissors  :   win"
      elsif  result == -1 || result == 2  then  puts "Rock Paper Scissors  :   lose"
      end
  end
end
  # ------------Main Program Starts Here ---------------------
# 主程式只要一行即可
game = RPS.new

