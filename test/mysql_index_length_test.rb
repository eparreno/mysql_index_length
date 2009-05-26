require 'test_helper'

class MysqlIndexLengthTest < ActiveSupport::TestCase
  load_schema  
  
  class Person < ActiveRecord::Base
  end

  def test_schema_has_loaded_correctly
    assert_equal [], Person.all
  end
    
  def test_add_index
    assert_nothing_raised { Person.connection.add_index("people", "last_name") }
    assert_nothing_raised { Person.connection.remove_index("people", "last_name") }
    assert_nothing_raised { Person.connection.add_index("people", ["last_name", "first_name"]) }
    assert_nothing_raised { Person.connection.remove_index("people", :column => ["last_name", "first_name"]) }
    assert_nothing_raised { Person.connection.add_index("people", ["last_name", "first_name"]) }
    assert_nothing_raised { Person.connection.remove_index("people", :name => "index_people_on_last_name_and_first_name") }
    assert_nothing_raised { Person.connection.add_index("people", ["last_name", "first_name"]) }
    assert_nothing_raised { Person.connection.remove_index("people", "last_name_and_first_name") }
    assert_nothing_raised { Person.connection.add_index("people", ["last_name", "first_name"]) }
    assert_nothing_raised { Person.connection.remove_index("people", ["last_name", "first_name"]) }
    assert_nothing_raised { Person.connection.add_index("people", ["last_name"], :limit => 10) }
    assert_nothing_raised { Person.connection.remove_index("people", "last_name") }
    assert_nothing_raised { Person.connection.add_index("people", ["last_name"], :limit => {:last_name => 10}) }
    assert_nothing_raised { Person.connection.remove_index("people", ["last_name"]) }
    assert_nothing_raised { Person.connection.add_index("people", ["last_name", "first_name"], :limit => 10) }
    assert_nothing_raised { Person.connection.remove_index("people", ["last_name", "first_name"]) }
    assert_nothing_raised { Person.connection.add_index("people", ["last_name", "first_name"], :limit => {:last_name => 10, :first_name => 20}) }
    assert_nothing_raised { Person.connection.remove_index("people", ["last_name", "first_name"]) }
  end  
end
