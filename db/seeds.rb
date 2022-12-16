# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
# Uncomment the following to create an Admin user for Production in Jumpstart Pro
# User.create name: "name", email: "email", password: "password", password_confirmation: "password", admin: true, terms_of_service: true
User.create(name: 'Ron Mac', email: 'smartcraft@pm.me', password: 'online', password_confirmation: 'online',
            admin: true, terms_of_service: true)
User.create(name: 'Mike Koala', email: '55577@pm.me', password: '557712', password_confirmation: '557712',
            admin: true, terms_of_service: true)

Subject.create!(name: 'Chemistry', id: 1)
Subject.create!(name: 'Physics', id: 2)
Subject.create!(name: 'Biology', id: 3)

Question.create!(body: 'A solution or liquid with pH value less than 7?', answer: 'Acid', subject_id: 1)
Question.create!(body: 'A solution or liquid with pH value greater than 7?', answer: 'Base', subject_id: 1)
Question.create!(body: 'A solution or liquid with pH value equal to 7?', answer: 'Neutral', subject_id: 1)
Question.create!(body: 'A neutral particle, everything is made of these.', answer: 'Atom', subject_id: 1)
Question.create!(body: 'A substance that cannot be broken down into other substances.',
                 answer: 'Element', subject_id: 1)