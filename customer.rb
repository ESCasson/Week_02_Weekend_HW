class Customer

attr_reader :name
attr_accessor :money

def initialize(input_name, input_money)
  @name = input_name
  @money = input_money
end

def remove_money(amount)
  @money -= amount
end

end
