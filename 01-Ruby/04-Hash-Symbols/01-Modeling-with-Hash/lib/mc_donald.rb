FOODLIST = [{"Name"  => "Cheese Burger","Calorie" => 290},{"Name"  => "Big Mac","Calorie" => 300},{"Name"  => "Mc Bacon","Calorie" => 400},{"Name"  => "Royal Cheese","Calorie" => 130},{"Name"  => "French fries","Calorie" => 130},{"Name"  => "Potatoes","Calorie" => 130},{"Name"  => "Coca","Calorie" => 160},{"Name"  => "Sprite","Calorie" => 170}]

def extra_poor_calories_counter (food)
  total_calories = 0
  FOODLIST.each do |choice|
  if choice["Name"] == food
      total_calories = total_calories + choice["Calorie"]
  end
  end
return total_calories
end

def poor_calories_counter(burger, side, beverage)
  #TODO: return number of calories for this mcDonald order
total_calories = extra_poor_calories_counter(burger) + extra_poor_calories_counter(side) + extra_poor_calories_counter(beverage)
return total_calories
end

def calories_counter(*orders)
  #TODO: return number of calories for a less constrained order
  total_calories = 0
  orders.each do |choice|
    if (choice == "Happy Meal")
      total_calories += poor_calories_counter("Cheese Burger","French fries","Coca")
    elsif (choice == "Best Of Big Mac")
      total_calories += poor_calories_counter("Big Mac", "French fries", "Coca")
    elsif (choice == "Best Of Royal Cheese")
      total_calories += poor_calories_counter("Royal Cheese", "Potatoes", "Sprite")
    else
      total_calories += extra_poor_calories_counter(choice)
    end
  end
  return total_calories
end
