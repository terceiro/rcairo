class Test::Unit::TestCase
  def assert_true(check)
    assert_equal true, check
  end
  def assert_predicate(object, predicate)
    assert object.send(predicate)
  end
  def assert_not_predicate(object, predicate)
    assert !object.send(predicate)
  end
end
