require './test/test_helper'

class CustomerTest < Minitest::Test
  attr_reader :customer
  
  def setup
    engine = SalesEngine.new('./test/fixtures')
    @customer = engine.customer_repository.customers[0]
  end

  def test_customer_attributes
    assert_equal 1, @customer.id
    assert_equal "Joey", @customer.first_name
    assert_equal "Ondricka", @customer.last_name
  end
  
  def test_it_retrieves_invoices_for_a_customer
    assert customer.respond_to? :invoices
    assert customer.invoices
    assert customer.invoices.length >= 8
  end
end
