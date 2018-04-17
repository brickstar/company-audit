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
  end

end
# project_id = '123'
# name = 'Widget Maker'
# start_date = '2015-01-01'
# end_date = '2018-01-01'
# project = Project.new('123', 'Widget Maker', '2015-01-01', '2018-01-01')
# => #<Project...>
#
# # make sure to convert all ID values to integers
# project.id.class
# => Integer
# project.name
# => "Widget Maker"
# project.start_date
# => #<Date: 2015-01-01 ((2457024j,0s,0n),+0s,2299161j)>
# project.end_date
=> #<Date: 2018-01-01 ((2458120j,0s,0n),+0s,2299161j)>
