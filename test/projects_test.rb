require './test/test_helper'
require './lib/projects'
require 'pry'

class ProjectsTest < Minitest::Test
  def setup
    @p = Project.new({  :project_id => '123',
                        :name => 'Widget Maker',
                        :start_date => '2015-01-01',
                        :end_date => '2018-01-01',
                      })
  end

  def test_instantiation
    assert_instance_of Project, @p
  end

  def test_attributes
    assert_equal '123', @p.project_id
    assert_equal 'Widget Maker', @p.name
    assert_instance_of Date, @p.start_date
    assert_instance_of Date, @p.end_date
  end
end
