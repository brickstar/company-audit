class Employee
  attr_reader :id,
              :name,
              :role,
              :start_date,
              :end_date

  def initialize(data)
    @id = data[:id]
    @name = data[:name]
    @role = data[:role]
    @start_date = data[:start_date]
    @end_date = data[:end_date]
  end
end
