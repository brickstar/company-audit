require './test/test_helper'
require './lib/timesheet'
require 'pry'

class TimesheetsTest < Minitest::Test
  def setup
    @t = Timesheet.new({  :employee_id => 5,
                          :project_id => 7,
                          :date => '2015-01-01',
                          :minutes => 120,
                          :end_date => '2018-01-01'
                       })
  end

  def test_instantiation
    assert_instance_of Timesheet, @t
  end

  def test_attributes
    assert_equal 5, @t.employee_id
    assert_equal Integer, @t.employee_id.class
    assert_equal 7, @t.project_id
    assert_equal Integer, @t.project_id.class
    assert_equal Date, @t.date.class
  end
end
