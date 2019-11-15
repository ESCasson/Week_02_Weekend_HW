require('pry')
class Room

attr_reader :name, :customers, :playlist

def initialize(input_name)
  @name = input_name
  @customers = []
  @playlist = []
end

def customer_enters_room(customer)
  @customers.push(customer)
end

def customer_leaves_room(customer)
  @customers.delete(customer)
end

def add_song_to_playlist(song)
  @playlist.push(song)
end

end
