def surfaceArea(a)
  surface = 0

  (0...a.length).each do |i|
    (0...a[0].length).each do |j|
      surface += 2
      if i != 0 && a[i][j] > a[i-1][j]
        surface += a[i][j] - a[i-1][j]
      elsif i == 0
        surface += a[i][j]
      end

      if i != a.length - 1 && a[i][j] > a[i+1][j]
        surface += a[i][j] - a[i+1][j]
      elsif i == a.length - 1
        surface += a[i][j]
      end

      if j != 0 && a[i][j] > a[i][j-1]
        surface += a[i][j] - a[i][j-1]
      elsif j == 0
        surface += a[i][j]
      end

      if j != a[0].length - 1 && a[i][j] > a[i][j+1]
        surface += a[i][j] - a[i][j+1]
      elsif j == a[0].length - 1
        surface += a[i][j]
      end

    end
  end
  surface
end