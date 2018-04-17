require_relative 'test_helper'
require './lib/company'

class CompanyTest < Minitest::Test
  def setup
    @c = Company.new
  end

  def test_instantiation
    assert_instance_of Company, @c
  end

  def test_it_has_employees_but_starts_empty
    assert_equal [], @c.employees
  end

  def test_it_has_projects_but_starts_empty
    assert_equal [], @c.projects
  end

  def test_it_has_timesheets_but_starts_empty
    assert_equal [], @c.timesheets
  end

  def test_it_can_load_employees
    @c.load_employees('./data/employees.csv')

    assert_instance_of Employee, @c.employees.first
  end

  def test_good_employee_data_returns_proper_hash
    actual = @c.load_employees('./data/employees.csv')
    expected = {success: true, error: nil}
binding.pry
    assert_equal expected, actual
    assert_equal Hash, actual.class
  end

  def test_bad_employee_data_returns_proper_hash
    actual = @c.load_employees('./data/bad_employees.csv')
    expected = {success: false, error: 'bad data'}

    assert_equal expected, actual
    assert_equal Hash, actual.class
  end

  def test_it_can_load_projects
    @c.load_projects('./data/projects.csv')

    assert_instance_of Project, @c.projects.first
  end

  def test_good_projects_data_returns_proper_hash
    actual = @c.load_projects('./data/projects.csv')
    expected = {success: true, error: nil}

    assert_equal expected, actual
  end

  def test_bad_projects_data_returns_proper_hash
    actual = @c.load_projects('./data/bad_projects.csv')
    expected = {success: false, error: 'bad data'}

    assert_equal expected, actual
    assert_equal Hash, actual.class
  end

  def test_it_can_load_timesheets
    @c.load_timesheets('./data/timesheets.csv')

    assert_instance_of Timesheet, @c.timesheets.first
  end

  def test_good_timesheets_data_returns_proper_hash
    actual = @c.load_timesheets('./data/timesheets.csv')
    expected = {success: true, error: nil}

    assert_equal expected, actual
  end

  def test_bad_timesheets_data_returns_proper_hash
    skip
    actual = @c.load_timesheets('./data/bad_timesheets.csv')
    expected = {success: false, error: 'bad data'}

    assert_equal expected, actual
    assert_equal Hash, actual.class
  end

  def test_it_can_find_employee_by_employee_id
    acutal = @c.find_by_employee_id(1)

    assert_equal Employee, actual.class
    assert_equal "Susan Smith", actual.name
    assert_equal "Manager", actual.role
  end
#   company.find_employee_by_id(employee_id)
# Parameters: Integer
# Returns: Employee object, or nil
# This method should return a matching Employee object for
# the employee_id passed to the method. Return a nil if
# there is no match.
#
# company.find_project_by_id(project_id)
# Parameters: Integer
# Returns: Project object, or nil
# This method should return a matching Project object for
# the project_id passed to the method. Return a nil if
# there is no match.
end
