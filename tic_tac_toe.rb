board = 1,2,3,4,5,6,7,8,9

def display board
  print board[0], board[1], board[2]
  puts
  print board[3], board[4], board[5]
  puts
  print board[6], board[7], board[8]
  puts
end

def check_winner loc1, loc2, loc3
  if loc1 == loc2 && loc2 == loc3
    true
  else
    false
  end
end

def game_over? board
  return true if check_winner board[0], board[1], board[2]
  return true if check_winner board[3], board[4], board[5]
  return true if check_winner board[6], board[7], board[8]
  return true if check_winner board[0], board[3], board[6]
  return true if check_winner board[1], board[4], board[7]
  return true if check_winner board[2], board[5], board[8]
  return true if check_winner board[0], board[4], board[8]
  return true if check_winner board[2], board[4], board[6]
  false
end

def board_full? board
  full = true
  board.each {|loc| full = false if loc.is_a? Integer}
  full
end

whos_turn = 1
location = nil

loop do
  loop do
    display board
    puts "player #{whos_turn}, choose a loction"
    location = gets.chomp.to_i
    puts "you chose location #{location}"
    if !location.between? 1, 9
      puts "invalid location! choose 1-9"
    else
      if board[location-1] == 'x' || board[location-1] == 'o'
        puts "invalid location! someone already went there"
      else
        break
      end
    end
  end
  mark = 'x' if whos_turn == 1
  mark = 'o' if whos_turn == 2
  board[location-1] = mark
  if game_over? board
    puts "player #{whos_turn} wins!"
    display board
    break
  else
    if board_full? board
      puts "The game is a tie!"
      display board
      break
    else
      if whos_turn == 1
        whos_turn = 2
      else
        whos_turn = 1
      end
    end
  end
end
