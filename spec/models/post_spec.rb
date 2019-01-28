require 'rails_helper'

RSpec.describe Post, type: :model do
  it "is valid with title, customer, hourly rate and location" do
    customer = Customer.create(email: "User1", password: "123123")
    post = Post.new(
      title: "This is a valid title",
      hourly_rate: 100,
      location: "Hanoi",
      customer: customer
    )
    expect(post).to be_valid
  end

  it "is invalid without title" do
    customer = Customer.create(email: "User1", password: "123123")
    post = Post.new(
      title: nil,
      hourly_rate: 100,
      location: "Hanoi",
      customer: customer
    )
    post.valid?
    expect(post.errors[:title]).to include("can't be blank")
  end

  it "is invalid with title's length lower than 5" do
    customer = Customer.create(email: "User1", password: "123123")
    post = Post.new(
      title: "Post",
      hourly_rate: 100,
      location: "Hanoi",
      customer: customer
    )
    post.valid?
    expect(post.errors[:title]).to include("is too short (minimum is 5 characters)")
  end

  it "is invalid with title's length greater than 50" do
    customer = Customer.create(email: "User1", password: "123123")
    post = Post.new(
      title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.
        Integer nec odio. Praesent libero. Sed cursus ante dapibus diam.
        Sed nisi. Nulla quis sem at nibh elementum imperdiet.
        Duis sagittis ipsum.
        Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa.
        Vestibulum lacinia arcu eget nulla. Class aptent taciti sociosqu a.",
      hourly_rate: 100,
      location: "Hanoi",
      customer: customer
    )
    post.valid?
    expect(post.errors[:title]).to include("is too long (maximum is 50 characters)")
  end

  it "is invalid without registered customer" do
    post = Post.new(
      title: "This is a valid title",
      hourly_rate: 100,
      location: "Hanoi",
      customer: nil
    )
    post.valid?
    expect(post.errors[:customer]).to include("must exist")
  end

  it "is invalid with hourly rate lower than 0" do
    invalid_rate = -5
    customer = Customer.create(email: "User1", password: "123123")
    post = Post.new(
      title: "This is a valid title",
      location: "Hanoi",
      customer: customer,
      hourly_rate: invalid_rate
    )
    post.valid?
    expect(post.errors[:hourly_rate]).to include("must be greater than 0")
  end

  it "is invalid with hourly rate as a 'not a number'" do
    customer = Customer.create(email: "User1", password: "123123")
    post = Post.new(
      title: "This is a valid title",
      hourly_rate: "One hundred",
      location: "Hanoi",
      customer: customer
    )
    post.valid?
    expect(post.errors[:hourly_rate]).to include("is not a number")
  end

  it "is invalid with hourly rate as a 'not a number'" do
    customer = Customer.create(email: "User1", password: "123123")
    post = Post.new(
      title: "This is a valid title",
      hourly_rate: "One hundred",
      location: "Hanoi",
      customer: customer
    )
    post.valid?
    expect(post.errors[:hourly_rate]).to include("is not a number")
  end

  it "is invalid without location" do
    customer = Customer.create(email: "User1", password: "123123")
    post = Post.new(
      title: "This is a valid post",
      hourly_rate: 100,
      location: nil,
      customer: customer
    )
    post.valid?
    expect(post.errors[:location]).to include("can't be blank")
  end
end
