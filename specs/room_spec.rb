require('minitest/autorun')
require('minitest/reporters')
require_relative('../room.rb')
require_relative('../song.rb')
require_relative('../customer.rb')


Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class RoomTest < MiniTest::Test

  def setup
    @room = Room.new("One")
    @CustomerBob = Customer.new("Bob",10)
    @CustomerBill = Customer.new("Bill",10)
    @CustomerSteve = Customer.new("Steve",10)
    @CustomerKaren = Customer.new("Karen",10)
    @CustomerSally = Customer.new("Sally",10)
    @CustomerSarah = Customer.new("Sarah",10)
    @CustomerEllie = Customer.new("Ellie",3)

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

  def test_customer_can_enter_room__there_is_capacity
    @room.customer_enters_room(@CustomerBob)
    assert_equal(1,@room.customers.length())
    assert_equal(6, @CustomerBob.money)
  end

  def test_customer_can_enter_room__there_is_not_capacity
    @room.customer_enters_room(@CustomerBob)
    @room.customer_enters_room(@CustomerBill)
    @room.customer_enters_room(@CustomerSteve)
    @room.customer_enters_room(@CustomerKaren)
    @room.customer_enters_room(@CustomerSally)
    @room.customer_enters_room(@CustomerSarah)
    assert_equal("Full, Ellie can't enter", @room.customer_enters_room(@CustomerEllie))
  end

  def test_customer_can_enter_room__there_is_capacity_customer_lacks_money
    @room.customer_enters_room(@CustomerEllie)
    assert_equal(0,@room.customers.length())
    assert_equal(3, @CustomerEllie.money)
    assert_equal("Ellie does not have enough money so can't enter.", @room.customer_enters_room(@CustomerEllie))
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
