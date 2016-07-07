require_relative "employee"

class Department

  attr_accessor :name

  def initialize(name)
    @name = name
    @employees = []
  end

  def add(employee)
    @employees.push(employee) unless @employees.include?(employee)
  end

  def has(employee)
    @employees.include?(employee)
  end

  def total_sal
    sal = 0
    @employees.each do |x|
      sal += x.salary
    end
    sal
  end

  def distribute_raise(amount)
    good_employees = []
    @employees.each do |x|
      good_employees.push(x) if x.satisfactory?
    end
    each_raise = amount / good_employees.size
    good_employees.each do |x|
      x.give_raise(each_raise)
    end
  end

end
