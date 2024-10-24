require "test_helper"

class StudentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "should get index" do
    sign_in users(:teacher)
    get students_url
    assert :success
  end

  test "should create new student" do
    user = users(:teacher)
    sign_in user
    student_params = { name: 'Sumit', subject: 'Maths', marks: 99.0 }

    assert_difference('Student.count', 1) do
      post students_url, params: student_params
    end

    student = Student.find_by(student_params[:student])

    assert_equal user.id, student.user_id
    assert :redirect
  end

  test "should not create when name and subject are same new student" do
    user = users(:teacher)
    sign_in user
    student = students(:one)

    student_params = { name: student.name, subject: student.subject, marks: 67.0 }
    assert_equal 'test_1', student.name
    assert_equal 'Bio', student.subject
    assert_equal '89', student.marks
    assert_equal user.id, student.user_id

    assert_no_difference('Student.count') do
      post students_url, params: student_params
    end

    student.reload

    assert_equal 'test_1', student.name
    assert_equal 'Bio', student.subject
    assert_equal '67', student.marks
    assert_equal user.id, student.user_id
    assert :redirect
  end
end
