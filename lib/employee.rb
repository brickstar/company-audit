class Employee
  attr_reader :id,
              :name,
              :role,
              :start_date,
              :end_date

  def initialize(data)
    @id = data[:id].to_i
    @name = data[:name]
    @role = data[:role]
    @start_date = Date.parse(data[:start_date])
    @end_date = Date.parse(data[:end_date])
  end
end
