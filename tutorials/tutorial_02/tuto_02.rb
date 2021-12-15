class Triangle

  def create_tri
    count = 11
    center = (count/ 2.0).ceil

    # print stars row by row
    for i in 1..count do
      # calcalute stars for rows
      new_i = i
      new_i = center - (i - center) if i > center
      star = (new_i-1) + new_i

      # print spaces
      for j in 1..(count - star) do
        print " "
      end

      # print stars
      for k in 1..star do
        print "* "
      end

      # line break
      puts ""
    end
  end

end

Triangle = Triangle.new
Triangle.create_tri