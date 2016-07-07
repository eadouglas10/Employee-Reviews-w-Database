require 'minitest/autorun'
require 'minitest/pride'
require_relative 'employee'
require_relative 'department'
require 'pry'

class Test < Minitest::Test

  @@things ||= Department.new("good name")

  @@bob ||= Employee.new("Robert", "abc@123.com", 703, 50000)
  @@sue ||= Employee.new("Susan", "xyz@321.com", 202, 60000)
  @@steph ||= Employee.new("Stephanie", "steph@steph.com", 301, 70000)
  @@steph.unsatisfactory

  @@things.add(@@bob)
  @@things.add(@@sue)
  @@things.add(@@steph)

  def test_can_create_department
    assert_equal @@things.name, "good name"
  end

  def test_can_create_employee
    assert_equal @@bob.email, "abc@123.com"
  end

  def test_add_emp_to_dept
    assert @@things.has(@@bob)
  end

  def test_get_salary
    assert_equal @@bob.salary, 50000
  end

  def test_get_total_salary
    assert_equal @@things.total_sal, (@@bob.salary + @@sue.salary + @@steph.salary)
  end

  def test_emp_review
    @@bob.add_review("Keep it up")
    @@bob.add_review("Not as good today")
    assert_equal @@bob.reviews, ["Keep it up", "Not as good today"]
  end

  def test_if_satisfactory
    @@sue.unsatisfactory
    assert @@bob.satisfactory? && !@@sue.satisfactory?
  end

  def test_give_raise
    @@bob.give_raise(30000)
    assert @@bob.salary == 80000
    @@bob.give_raise(-30000)
  end

  def test_distribute_raise
    @@things.distribute_raise(20000)
    assert_equal @@bob.salary, 60000
    assert_equal @@sue.salary, 70000
    assert_equal @@steph.salary, 70000
    @@things.distribute_raise(-20000)
  end


end
