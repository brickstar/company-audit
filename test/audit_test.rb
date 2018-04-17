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

# audit.were_invalid_days_worked
# Parameters: None
# Returns: String
# This method will analyze all timesheets to determine if they are valid.
# You ARE ALLOWED to extract functionality into helper methods provided
# they are completely unit tested AND that you have an integration test
#  for this method.
# 
# Reasons a timesheet could be declared invalid:
#
# an employee_id is not valid
# a project_id is not valid
# an employee is attempting to bill time before or after the project start/end dates
# an employee was working on a weekend; we value our work-life balance,
#  employees are not allowed to work weekends
# The exact format of the report will look like this:
#
# Invalid Days Worked:
# John Smith worked on Widgets on 2016-02-20, it was a weekend
# Use existing company methods to look up employee names and project names.
#
# If no invalid timesheets are found, your output should look like this instead:
#
# Invalid Days Worked:
# None
