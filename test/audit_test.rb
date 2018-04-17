require_relative 'test_helper'
require './lib/audit'
require './lib/company'

class AuditTest < Minitest::Test
  def setup
    @a = Audit.new
    @c = Company.new
  end

  def test_instantiation
    assert_instance_of Audit, @a
  end

  def test_it_loads_company
    actual_1 = @c.load_employees('./data/employees.csv')
    actual_2 = @c.load_projects('./data/projects.csv')
    actual_3 = @c.load_timesheets('./data/timesheets.csv')

    @a.load_company(@c)

    expected = {:success=>true, :error=>nil}

    assert_instance_of Company, @a.company
    assert_equal expected, actual_1
    assert_equal expected, actual_2
    assert_equal expected, actual_3
  end
end

# audit = Audit.new
# => #<Audit...>
# company = Company.new
# => #<Company...>
# company.load_employees('./data/employees.csv')
# => {:success=>true, :error=>nil}
# company.load_projects('./data/projects.csv')
# => {:success=>true, :error=>nil}
# company.load_timesheets('./data/timesheets.csv')
# => {:success=>true, :error=>nil}
# audit.load_company(company)
# Parameters: Company object
# Returns: Company object
# This method will give all other audit methods access
#   to the company's details. Since there are no audit methods
#   which allow you to re-load company details, you will need to
#   load all CSV data into the company before you call this method.
