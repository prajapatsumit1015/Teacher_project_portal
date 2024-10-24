class Student < ApplicationRecord
  belongs_to :user

  # Validations
  validates :name, presence: true
  validates :subject, presence: true
  validates :marks, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }

  # Scope to find students by a unique combination of name and subject for a given teacher (user)
  scope :find_by_name_and_subject, ->(name, subject, user) { where(name: name, subject: subject, user: user) }

  # Method to add marks to an existing student record
  def add_marks(new_marks)
    self.marks += new_marks.to_i
    save
  end
end
