require 'csv'
require './lib/employee'
require './lib/project'
require './lib/timesheet'
require 'pry'

class Company
  attr_reader :employees, :projects, :timesheets

  def initialize
    @employees  = []
    @projects   = []
    @timesheets = []
  end

  def load_employees(filename)
    CSV.foreach(filename) do |data|
      binding.pry
      @employees << Employee.new(data)
    end
  end
end
