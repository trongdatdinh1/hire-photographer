require 'rails_helper'

RSpec.describe Message, type: :model do
  it "is created by Customer on specific post" do
    customer = Customer.create(
      email: "customer@email.com",
      password: "123456789",
      name: "Customer"
    )
    post = Post.create(
      title: "This is a valid post",
      hourly_rate: 100,
      location: "Hanoi",
      customer: customer
    )

    #customer.messages << Message.new(content: "This is a valid content", post: post)
    message = Message.new(
      content: "This is a valid content",
      post: post,
      messageable_type: customer.class.name.demodulize,
      messageable_id: customer.id
    )
    expect(message).to be_valid
  end

  it "is created by Photographer on specific post" do
    customer = Customer.create(
      email: "customer@email.com",
      password: "123456789",
      name: "Customer"
    )

    photographer = Photographer.create(
      name: "Photographer",
      phone: "123456789",
      location: "Hanoi",
      email: "photographer@email.com",
      password: "123123",
      password_confirmation: "123123"
    )

    post = Post.create(
      title: "This is a valid post",
      hourly_rate: 100,
      location: "Hanoi",
      customer: customer
    )

    message = Message.new(
      content: "This is a valid content",
      post: post,
      messageable_type: photographer.class.name.demodulize,
      messageable_id: photographer.id
    )
    expect(message).to be_valid
  end

  it "is invalid without conent" do
    message = Message.new(content: nil)
    message.valid?
    expect(message.errors[:content]).to include("can't be blank")
  end

  it "is invalid without post" do
    message = Message.new(post: nil)
    message.valid?
    expect(message.errors[:post]).to include("must exist")
  end
end
