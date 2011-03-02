require 'test/unit'
require File.join(File.dirname(__FILE__), '..', '..', 'lib', 'backwards_methods')

class MainTest < Test::Unit::TestCase

  def test_find_methods
    assert self.class.instance_methods.include?('object_id')
    assert self.class.instance_methods.include?(:object_id)
  
    assert methods.include?('object_id')
    assert methods.include?(:object_id)
  end

  def test_do_not_find_missing_methods
    assert !self.class.instance_methods.include?('stuff_object_id')
    assert !self.class.instance_methods.include?(:stuff_object_id)
  
    assert !methods.include?('stuff_object_id')
    assert !methods.include?(:stuff_object_id)
  end 
end
