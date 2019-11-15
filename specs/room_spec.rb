require('minitest/autorun')
require('minitest/reporters')
require_relative('../room.rb')
require_relative('../song.rb')
require_relative('../customer.rb')


Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class RoomTest < MiniTest::Test

  def setup
    @room = Room.new("One")
    @CustomerBob = Customer.new("Bob")
    @songRun = Song.new("Run", "Foo Fighters")
  end

  def test_room_exists_with_name
    assert_equal("One", @room.name)
  end

  def test_room_customer_array_starts_empty
    assert_equal(0, @room.customers.length())
  end

  def test_room_playlist_array_starts_empty
    assert(0, @room.playlist.length())
  end

  def test_customer_can_enter_room
    @room.customer_enters_room(@CustomerBob)
    assert_equal(1,@room.customers.length())
  end

  def test_customer_can_leave_room
    @room.customer_enters_room(@CustomerBob)
    @room.customer_leaves_room(@CustomerBob)
    assert_equal(0, @room.customers.length())
  end

  def test_add_song_to_playlist
    @room.add_song_to_playlist(@songRun)
    assert_equal(1, @room.playlist.length())
  end


end
