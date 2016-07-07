class Employee

  attr_accessor :name
  attr_accessor :email
  attr_accessor :phone
  attr_accessor :salary
  attr_accessor :reviews

  def initialize(name, email, phone, salary)
    @name = name
    @email = email
    @phone = phone
    @salary = salary
    @reviews = []
    @is_satisfactory = true
  end

  def add_review(new_review)
    @reviews.push(new_review)
  end

  def satisfactory
    @is_satisfactory = true
  end

  def unsatisfactory
    @is_satisfactory = false
  end

  def satisfactory?
    @is_satisfactory
  end

  def give_raise(amount)
    @salary += amount
  end

end
