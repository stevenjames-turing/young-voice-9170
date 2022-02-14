class Professor <ApplicationRecord
    validates :name, presence: true
    validates :age, presence: true
    validates :specialty, presence: true

    has_many :professor_students
    has_many :students, :through => :professor_students 

    def self.sort_alphabetically
        order(name: :asc)
    end

end
