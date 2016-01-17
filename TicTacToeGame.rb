require 'pry'
class TicTacToe
  # initialize
  def initialize
    continue?
  end 
  #---------------------------------------------------------------------------------------------------------#
  def intro
    #印出開場畫面，告訴玩家遊戲規則
    puts "兩個玩家，一個打圈(O)，一個打叉(X)，輪流在3乘3的格上打自己的符號，最先以橫、直、斜連成一線則為勝"
    puts "Input 1 ~ 9"
    puts "  |  |   "
    puts "--------"
    puts "  |  |  "
    puts "--------"
    puts "  |  |   "
  end
#---------------------------------------------------------------------------------------------------------#
  def decide
    #邏輯判斷式
    array = [" "," "," "," "," "," "," "," "," "] 
    @@user_count = 0
    begin
      user_inputs(array)
      compter_inputs(array)
      #------宣告井字格子------
      puts " #{array[0]}| #{array[1]}| #{array[2]}  "
      puts "--------"
      puts " #{array[3]}| #{array[4]}| #{array[5]}  "
      puts "--------"
      puts " #{array[6]}| #{array[7]}| #{array[8]}  "
      show_message(array)
    end while (connection(array) == " "  &&  @@user_count  <= 4)
  end
#---------------------------------------------------------------------------------------------------------#
  def user_inputs array
    begin    #------user_input 判斷不重複輸入------
      #puts "array[0] :#{array[0]},array[1]:#{array[1]},array[2]: #{array[2]},array[3]: #{array[3]},array[4] : #{array[4]},array[5] : #{array[5]} , array[6] : #{array[6]} , array[7] :#{array[7]} ,array[8] : #{array[8]}"
      user_int = gets.chomp.to_i-1
      puts (@@user_count>=1 && array[user_int] != " ") ? " 重複輸入 , 請在未填寫空格進行填寫 , user input count : #{@@user_count }  " : "user_array_int: #{user_int}  , user input count : #{@@user_count+1 }"
    end while array[user_int] != " "
      array[user_int]="O"
      @@user_count +=1
      #binding.pry
  end
 #---------------------------------------------------------------------------------------------------------#
  def compter_inputs array
    begin    #------computer_input 判斷不重複輸入------
      computer_int = rand(1..9)-1    
      #井字都填滿OX就return (跳出begin....end while)
      if (array[0] != " " &&array[1] != " "&&array[2] != " "&&array[3] != " "&&array[4] != " "&&array[5] != " "&&array[6] != " "&&array[7] != " "&&array[8] != " ")  then  return    end
    end while array[computer_int] != " "
        array[computer_int] = "X"
  end
 #---------------------------------------------------------------------------------------------------------#
  def continue?
    #判斷玩家是否要繼續下一輪
    begin
      intro
      decide
      begin
        puts "Play Again?: Y / N"
        continue = gets.chomp.upcase
      end while !["Y", "N"].include?(continue)
    end while continue != "N"
    # 若使用者回答 "N"，印出離開的訊息，不是就回到迴圈的上層繼續玩
    puts "Good Bye! Thanks for playing!"
  end
#---------------------------------------------------------------------------------------------------------#
  def show_message array
    #印出結果
    #------user_input 輸入3 次以上 , 才開始判斷是否有連線成功？
    if (@@user_count >=3 ? true : false)
      if (connection(array) == "O") then   puts "win"
      elsif  (connection(array) == "X") then   puts "lose"
      elsif  (connection(array) == " " &&  @@user_count  >= 5 ) then   puts "tie"
      end
    end
  end
#---------------------------------------------------------------------------------------------------------#
 #判斷是否有連線成功
  def connection  array    
    i = 0
    while i < 3
      #判斷橫 :  0 1 2  , 3 4 5 , 6 7 8     (是否有連成一線)
      if  (array[3*i]=="O" && array[3*i+1]=="O" && array[3*i+2]=="O")  then   return  "O"
      elsif  (array[3*i]=="X" && array[3*i+1]=="X" && array[3*i+2]=="X")  then  return "X"
      end
      #判斷直 : 0 3 6, 1 4 7 , 2 5 8       (是否有連成一線)
      if  (array[i]=="O" &&array[i+3]=="O" &&array[i+6]=="O")  then  return  "O"
      elsif (array[i]=="X" &&array[i+3]=="X" &&array[i+6]=="X" ) then  return "X"
      end
    i +=1
  end
    #判斷斜 : 0 4 8 , 2 4 6    (是否有連成一線)  , 最後都沒連線成功就回傳" "
    if  (array[0]=="O" &&array[4]=="O" &&array[8]=="O") then return  "O"
    elsif  (array[2]=="O" &&array[4]=="O" &&array[6]=="O") then return  "O"
    elsif  (array[2]=="X" &&array[4]=="X" &&array[6]=="X") then return "X"
    elsif  (array[2]=="X" &&array[4]=="X" &&array[6]=="X") then return "X"
    else return " "
    end
  end
#---------------------------------------------------------------------------------------------------------#
end
# ------------Main Program Starts Here ---------------------
# 主程式只要一行即可
TicTacToe.new