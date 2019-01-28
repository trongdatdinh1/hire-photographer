require 'rails_helper'

RSpec.describe Photographer, type: :model do
  it "is valid with name, email and password" do
    photographer = Photographer.new(
      name: "Photographer",
      phone: "123456789",
      location: "Hanoi",
      email: "photographer@email.com",
      password: "123123",
      password_confirmation: "123123"
    )
    expect(photographer).to be_valid
  end

  it "is invalid without name" do
    photographer = Photographer.new(name: nil)
    photographer.valid?
    expect(photographer.errors[:name]).to include("can't be blank")
  end

  it "is invalid without email" do
    photographer = Photographer.new(email: nil)
    photographer.valid?
    expect(photographer.errors[:email]).to include("can't be blank")
  end

  it "is invalid without password" do
    photographer = Photographer.new(password: nil)
    photographer.valid?
    expect(photographer.errors[:password]).to include("can't be blank")
  end

  it "is invalid with a duplicate email address" do
    Photographer.create(
      name: "Photographer",
      phone: "123456789",
      location: "Hanoi",
      email: "photographer@email.com",
      password: "123123"
    )
    photographer = Photographer.new(
      name: "Cus 2",
      email: "photographer@email.com",
      password: "123456"
    )
    photographer.valid?
    expect(photographer.errors[:email]).to include("has already been taken")
  end

  it "is invalid without phone number" do
    photographer = Photographer.new(phone: nil)
    photographer.valid?
    expect(photographer.errors[:phone]).to include("can't be blank")
  end

  it "is invalid without location" do
    photographer = Photographer.new(location: nil)
    photographer.valid?
    expect(photographer.errors[:location]).to include("can't be blank")
  end
end
