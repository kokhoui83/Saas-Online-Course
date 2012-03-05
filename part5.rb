class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s
    attr_reader attr_name
    attr_reader attr_name+"_history"

    class_eval %Q{
      def initialize
        @history = Array.new(1, nil)
      end
      attr_accessor :history
	  def #{attr_name}= (value)
        history.push(value)
      end

      def #{attr_name+"_history"}
        return history
      end
    }

  end
end

class Foo
  attr_accessor_with_history :bar
end

f = Foo.new
f.bar = 1
f.bar = 2
puts f.bar_history

f = Foo.new
f.bar = [3,6]
f.bar = "Amando Fell"
puts f.bar_history
