require './test/test_helper'
require './lib/employee'

class EmployeeTest < Minitest::Test
  def setup
    @e = Employee.new({ :id => 5,
                        :name => 'Sally Jackson',
                        :role => 'Engineer',
                        :start_date => '2015-01-01',
                        :end_date => '2018-01-01'
                       })
  end

  def test_instantiation
    assert_instance_of Employee, @e
  end

  def test_attributes
  end
end
# employee_id = '5'
# name = 'Sally Jackson'
# role = 'Engineer'
# start_date = '2015-01-01'
# end_date = '2018-01-01'
# employee = Employee.new(employee_id, name, role, start_date, end_date)
