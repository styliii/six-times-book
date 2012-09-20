# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

yamas_and_niyamas = Commitment.create([
  {sanskrit: 'ahinsa', description: 'not harming'},
  {sanskrit: 'satya', description: 'to tell the truth'},
  {sanskrit: 'asteya', description: 'do not steal'},
  {sanskrit: 'brahmacharya', description: 'be sexually pure'},
  {sanskrit: 'aparigraha', description: 'non grabbing'},
  {sanskrit: 'shaucha', description: 'cleanliness'},
  {sanskrit: 'santosha', description: 'be content'},
  {sanskrit: 'tapah', description: 'joyful effort'},
  {sanskrit: 'svadhyaye', description: 'study on your own'},
  {sanskrit: 'eshvara pranidhanani', description: 'find a teacher'}])