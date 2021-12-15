class Triangle

  def create_tri
    count = 11
    center = (count/ 2.0).ceil

    for i in 1..count do
      new_i = i
      new_i = center - (i - center) if i > center
      star = (new_i-1) + new_i

      for j in 1..(count - star) do
        print " "
      end

      for k in 1..star do
        print "* "
      end

      puts ""
    end
  end

end

Triangle = Triangle.new
Triangle.create_tri