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
    assert_equal Hash, actual.class
  end

  def test_bad_timesheets_data_returns_proper_hash
    skip
    actual = @c.load_timesheets('./data/bad_timesheets.csv')
    expected = {success: false, error: 'bad data'}

    assert_equal expected, actual
    assert_equal Hash, actual.class
  end

  def test_it_can_find_employee_by_employee_id
    @c.load_employees('./data/employees.csv')

    actual = @c.find_employee_by_id(1)
    actual_2 = @c.find_employee_by_id(777)

    assert_equal Employee, actual.class
    assert_equal "Susan Smith", actual.name
    assert_equal "Manager", actual.role
    assert_equal 1, actual.id
    assert_nil actual_2
  end

  def test_it_can_find_project_by_project_id
    @c.load_projects('./data/projects.csv')

    actual = @c.find_project_by_id(1)
    actual_2 = @c.find_project_by_id(777)

    assert_equal Project, actual.class
    assert_equal "Widgets", actual.name
    assert_equal 1, actual.project_id
    assert_nil actual_2
  end
end
