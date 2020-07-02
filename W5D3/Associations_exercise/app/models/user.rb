# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
    validates :name, :enrollments, :enrolled_courses, presence: true

    has_many :enrollments,
        foreign_key: :student_id,
        primary_key: :id,
        class_name: :Enrollment
        
    has_many :enrolled_courses,
        through: :enrollments,
        source: :course

    # has_many :instructors,
    #     through: :enrollments,
    #     source: :course
    
   

end
