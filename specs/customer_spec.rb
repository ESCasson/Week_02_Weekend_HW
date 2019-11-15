require('minitest/autorun')
require('minitest/reporters')
require_relative('../customer.rb')


Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class CustomerTest < MiniTest::Test

  def test_customer_exists_with_name
    customer = Customer.new("Bob")
    assert_equal("Bob", customer.name)
  end

end
