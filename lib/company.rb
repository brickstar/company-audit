require 'csv'
require './lib/employee'
require './lib/project'
require './lib/timesheet'

class Company
  attr_reader :employees, :projects, :timesheets

  def initialize
    @employees  = []
    @projects   = []
    @timesheets = []
  end
end
