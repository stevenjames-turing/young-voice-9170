require 'rails_helper'

RSpec.describe 'student index page' do 
    it 'displays list of students with how many professors each has' do 
        snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
        hagarid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
        lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")
        harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
        malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
        longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )
        ProfessorStudent.create(student_id: harry.id, professor_id: snape.id)
        ProfessorStudent.create(student_id: harry.id, professor_id: hagarid.id)
        ProfessorStudent.create(student_id: harry.id, professor_id: lupin.id)
        ProfessorStudent.create(student_id: malfoy.id, professor_id: hagarid.id)
        ProfessorStudent.create(student_id: malfoy.id, professor_id: lupin.id)
        ProfessorStudent.create(student_id: longbottom.id, professor_id: snape.id)

        visit '/students' 
        
        expect(page).to have_content(harry.name)
        expect(page).to have_content(malfoy.name)
        expect(page).to have_content(longbottom.name)
        expect(page).to have_content("Harry Potter: 3")
        expect(page).to have_content("Draco Malfoy: 2")
        expect(page).to have_content("Neville Longbottom: 1")

        expect(page).to_not have_content(snape.name)
        expect(page).to_not have_content(harry.age)
    end
    
    it 'sorts students alphabetically' do 
        snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
        hagarid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
        lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")
        harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
        malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
        longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )
        ProfessorStudent.create(student_id: harry.id, professor_id: snape.id)
        ProfessorStudent.create(student_id: harry.id, professor_id: hagarid.id)
        ProfessorStudent.create(student_id: harry.id, professor_id: lupin.id)
        ProfessorStudent.create(student_id: malfoy.id, professor_id: hagarid.id)
        ProfessorStudent.create(student_id: malfoy.id, professor_id: lupin.id)
        ProfessorStudent.create(student_id: longbottom.id, professor_id: snape.id)
    
        visit '/students' 

        expect(malfoy.name).to appear_before(harry.name)
        expect(malfoy.name).to appear_before(longbottom.name)
        expect(harry.name).to appear_before(longbottom.name)
    end
end