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
      return {success: false, error: 'bad data'} if data.length != 5
      @employees << Employee.new(data[0], data[1], data[2], data[3], data[4])
    end
    {success: true, error: nil}
  end
end
