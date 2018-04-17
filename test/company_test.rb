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
end
