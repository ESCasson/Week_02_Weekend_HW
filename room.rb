require('pry')
class Room

attr_reader :name, :customers, :playlist

def initialize(input_name)
  @name = input_name
  @customers = []
  @playlist = []
  @capacity = 6
  @fee = 4
end

def customer_enters_room(customer)
  if @customers.length() >= @capacity
    p "Full, #{customer.name} can't enter"
  elsif
    customer.money < @fee
   p "#{customer.name} does not have enough money so can't enter."
 else
    @customers.push(customer)
    customer.remove_money(@fee)
  end
  end


def customer_leaves_room(customer)
  @customers.delete(customer)
end

def add_song_to_playlist(song)
  @playlist.push(song)
end


end
