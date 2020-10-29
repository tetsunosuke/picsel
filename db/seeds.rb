# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(
    last_name: "太郎",
     first_name: "田中",
     last_name_kana: "タロウ",
     first_name_kana: "タナカ",
     email: "taro@xxx.com",
     password: "asasasas",
     postal_code: "333-4444",
     address:"長野県太平",
     rate: "4.5",
     is_deleted: true,
     telephone_number: "090-000-0000",
 )
