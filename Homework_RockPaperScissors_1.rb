# homework1
# 剪刀石頭布
# 先要使用者輸入剪刀石頭或布的其中一個選項
# 接下來讓電腦亂數選出一個選項
# 比較兩個選項，決定誰贏誰輸
# 輸出結果
# 問使用者是否再玩一次

begin #可以美化輸出
  puts "|===============================================|" 
  puts "|Welcome to Rock Paper Scissors!!!              |"
  puts "|===============================================|"

 begin 
    puts "please choose one of the following: R / P / S"
    user_input = gets.chomp.upcase
  end while !["R", "P", "S"].include?(user_input) 
  #接下來請把剩下的部份寫出來...

  #-----user input : RPS轉換數字-----
  case user_input  
    when "R" 
     user_int =  1
    when "P"
     user_int =  2
    when "S"
     user_int =  3
  end
  #-----computer input : 隨機1~3數字轉換RPS-----
  computer_input = rand(1..3)
  case computer_input  
    when 1
     computer_str =  "R"
    when 2 
     computer_str =  "P"
    when 3
     computer_str =  "S"
  end

 puts "computer_input : #{computer_str}"
 result = user_int.to_i - computer_input.to_i
 #puts "result : #{result}"
  if computer_input == user_int
    puts "Rock Paper Scissors  :  end in a draw"
  elsif  result == 1 || result == -2
    puts "Rock Paper Scissors  :   win"
  elsif  result == -1 || result == 2
    puts "Rock Paper Scissors  :   lose"
  end

  #問使用者是否還要再玩 
  begin
    puts "Play Again?: Y / N"
    continue = gets.chomp.upcase
  end while !["Y", "N"].include?(continue)
puts "continue : #{continue}"
end while continue == "Y"
# 若使用者回答 "N"，印出離開的訊息，不是就回到迴圈的上層繼續玩
puts "Good Bye! Thanks for playing!"
