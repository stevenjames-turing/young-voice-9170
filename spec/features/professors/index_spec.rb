require 'rails_helper'

RSpec.describe 'professor index page' do 
   
    it 'displays all professors and attributes for each' do 
        snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
        lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

        visit "/professors"

        expect(page).to have_content(snape.name)
        expect(page).to have_content(snape.age)
        expect(page).to have_content(snape.specialty)
        expect(page).to have_content(lupin.name)
        expect(page).to have_content(lupin.age)
        expect(page).to have_content(lupin.specialty)
    end

    it 'sorts professors alphabetically' do 
        snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
        lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")
        hagarid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")

        visit "/professors"

        expect(page).to have_content(snape.name)
        expect(page).to have_content(lupin.name)
        expect(page).to have_content(hagarid.name)

        expect(lupin.name).to appear_before(hagarid.name)
        expect(lupin.name).to appear_before(snape.name)
        expect(hagarid.name).to appear_before(snape.name)
    end
end 