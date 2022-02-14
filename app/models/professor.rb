class Professor <ApplicationRecord
    validates :name, presence: true
    validates :age, presence: true
    validates :specialty, presence: true

    has_many :professor_students
    has_many :students, :through => :professor_students 

    def self.sort_alphabetically
        order(name: :asc)
    end

    def students_avg_age
        total_age = 0
        students.each do |student|
            total_age += student.age 
        end
        total_age / students.count
    end

end
