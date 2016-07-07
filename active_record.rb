require 'bundler/setup'
require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'db.sqlite3'
)

class EmployeeMigration < ActiveRecord::Migration
  def change
    create_table(:Employees) do |t|
      t.string (:name)
      t.string (:email)
      t.integer (:phone)
      t.integer (:salary)
      t.string (:department)
    end
  end
end

class DepartmentMigration < ActiveRecord::Migration
  def change
    create_table(:Departments) do |t|
      t.string (:name)
    end
  end
end

begin
  EmployeeMigration.migrate(:down)
rescue
end

EmployeeMigration.migrate(:up)


begin
  DepartmentMigration.migrate(:down)
rescue
end
DepartmentMigration.migrate(:up)
