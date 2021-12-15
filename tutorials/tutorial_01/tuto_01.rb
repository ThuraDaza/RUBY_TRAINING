class Chess

  def create_chess
    for i in 1..8 do
      # print 8 numbers for a row
      8.times { |j| (j+i) %2 == 0? print("1\t") : print("0\t") }
      # line beak
      puts ""
    end
  end

end

Chess = Chess.new
Chess.create_chess