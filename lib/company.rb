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
    thing = CSV.foreach(filename) do |data|
      @employees << Employee.new(data[0], data[1], data[2], data[3], data[4])
    end
    thing
    binding.pry
  end
end
