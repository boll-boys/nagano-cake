# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Customer.create!(
    fist_name: '浅野',
    last_name: '優',
    fist_name_kana: 'アサノ',
    last_name_kana: 'ユウ',
    postal_code: '123-4567',
    address: '東京都世田谷区',
    phon_number: '012-3456-7890',
    is_delete: '0',
    email: 'testtest@test.com',
    encrypted_password: 'customer',
    password: 'password'
    )