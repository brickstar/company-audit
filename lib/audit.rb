class Audit
  attr_reader :company
  def initialize
    @company = nil
  end

  def load_company(company)
    @company = company
  end

  def validate_employee_id
    employee_ids = @company.employees.map { |employee| employee.id }
    timesheet_ids = @company.timesheets.map { |timesheet| timesheet.employee_id }
    timesheet_ids.find_all do |id|
      !employee_ids.include?(id)
    end
  end

  def validate_project_id
    project_ids = @company.projects.map { |project| project.project_id }
    timesheet_ids = @company.timesheets.map { |timesheet| timesheet.project_id }
    timesheet_ids.find_all do |id|
      !project_ids.include?(id)
    end
  end
end
