def snake_eyes
  
  random_number_generator = Random.new
  count = 0
  
  100.times do |i|
    num1 = random_number_generator.rand(1..6)
    num2 = random_number_generator.rand(1..6)
    
    if num1 == 1 && num2 == 1
      count += 1
    end
  end
  
  p count
end



snake_eyes