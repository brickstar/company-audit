require './test/test_helper'
require './lib/project'
require 'pry'

class ProjectsTest < Minitest::Test
  def setup
    @p = Project.new('123', 'Widget Maker', '2015-01-01', '2018-01-01')
  end

  def test_instantiation
    assert_instance_of Project, @p
  end

  def test_attributes
    assert_equal 123, @p.project_id
    assert_equal Integer, @p.project_id.class
    assert_equal 'Widget Maker', @p.name
    assert_instance_of Date, @p.start_date
    assert_instance_of Date, @p.end_date
  end
end
