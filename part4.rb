class Dessert
  def initialize(name, calories)
    @name = name
    @calories = calories
  end

  attr_accessor :name
  attr_accessor :calories

  def healthy?
    if calories < 200
      return true
    else
      return false
    end
  end

  def delicious?
    return true
  end
end

class JellyBean < Dessert
  def initialize(name, calories, flavor)
    super(name, calories)
    @flavor = flavor
  end

  attr_accessor :flavor

  def delicious?
    if flavor == "black licorice"
      return false
    else
      return true
    end
  end
end

a = Dessert.new("a", 200)
puts a.healthy?
puts a.delicious?

b = JellyBean.new("b", 150, "black")
puts b.healthy?
puts b.delicious?
