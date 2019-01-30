require 'rails_helper'

RSpec.describe Customer, type: :model do
  it "is valid with name, email and password" do
    customer = Customer.new(
      name: "shika",
      email: "customer@gmail.com",
      password: "123123",
      password_confirmation: "123123"
    )
    expect(customer).to be_valid
  end
  it "is invalid without name" do
    customer = Customer.new(name: nil)
    customer.valid?
    expect(customer.errors[:name]).to include("can't be blank")
  end

  it "is invalid without email" do
    customer = Customer.new(
      email: nil,
      password: "123123",
      password_confirmation: "123123"
    )
    customer.valid?
    expect(customer.errors[:email]).to include("can't be blank")
  end
  it "is invalid without password" do
    customer = Customer.new(
      email: "customer@gmail.com",
      password: nil,
      password_confirmation: nil
    )
    customer.valid?
    expect(customer.errors[:password]).to include("can't be blank")
  end
  it "is invalid with a duplicate email address" do
    Customer.create(
      name: "Customer",
      email: "customer@email.com",
      password: "123123"
    )
    customer = Customer.new(
      name: "Cus 2",
      email: "customer@email.com",
      password: "123456"
    )
    customer.valid?
    expect(customer.errors[:email]).to include("has already been taken")
  end
end
