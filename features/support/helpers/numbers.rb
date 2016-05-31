class Numbers

  def self.random_number_not_in_range_1_to_15
    x = 1
    while x.between?(1, 15)
      x = rand(1..100)
    end
    x
  end

end
