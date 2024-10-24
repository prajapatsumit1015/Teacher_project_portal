require "test_helper"

class StudentTest < ActiveSupport::TestCase
  test 'should get error when name not present' do
    user = users(:one)
    student = Student.new(name: '', subject: 'Subject 1', marks: 12, user_id: user.id)
    assert_not student.save
    assert_includes student.errors.full_messages[0], "Name can't be blank"
  end

  test 'should get error when subject not present' do
    user = users(:one)
    student = Student.new(name: 'name', subject: '', marks: 12, user_id: user.id)
    assert_not student.save
    assert_includes student.errors.full_messages[0], "Subject can't be blank"
  end

  test 'should get error when marks is greater than 100' do
    user = users(:one)
    student = Student.new(name: 'name', subject: 'subject', marks: 101, user_id: user.id)
    assert_not student.save
    assert_includes student.errors.full_messages[0], "Marks must be less than or equal to 100"
  end

  test 'should get error when marks is less than 0' do
    user = users(:one)
    student = Student.new(name: 'name', subject: 'subject', marks: -1, user_id: user.id)
    assert_not student.save
    assert_includes student.errors.full_messages[0], "Marks must be greater than or equal to 0"
  end

  test 'should get error when user not present' do
    student = Student.new(name: 'name', subject: 'subject', marks: 1, user_id: nil)
    assert_not student.save
    assert_includes student.errors.full_messages[0], "User must exist"
  end
end
