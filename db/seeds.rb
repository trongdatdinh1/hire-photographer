Photographer.create! name: "Photographer 1",
    phone: "123456789",
    location: "Hanoi",
    email: "photographer@email.com",
    password: "123123",
    password_confirmation: "123123"

Customer.create! name: "Customer 1",
    email: "customer@email.com",
    password: "123123",
    password_confirmation: "123123"

99.times do |n|
  name = FFaker::Name.name
  phone = FFaker::PhoneNumberDA.phone_number
  location = FFaker::AddressUS.city
  email = FFaker::Internet.email
  password = "123123"
  Photographer.create! name: name,
    phone: phone,
    location: location,
    email: email,
    password: password,
    password_confirmation: password

end

10.times do |n|
  name = FFaker::Name.name
  email = FFaker::Internet.email
  password = "123123"
  Customer.create! name: name,
    email: email,
    password: password,
    password_confirmation: password
end
