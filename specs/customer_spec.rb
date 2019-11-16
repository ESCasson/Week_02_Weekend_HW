require('minitest/autorun')
require('minitest/reporters')
require_relative('../customer.rb')


Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class CustomerTest < MiniTest::Test

  def setup
    @customerBob =Customer.new("Bob",10)
  end

  def test_customer_exists_with_name
    assert_equal("Bob", @customerBob.name)
  end

  def test_customer_exists_with_money
    assert_equal(10, @customerBob.money)
  end

  def test_remove_money
    @customerBob.remove_money(4)
    assert_equal(6, @customerBob.money)
  end

end
