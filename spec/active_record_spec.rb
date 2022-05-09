# frozen_string_literal: true

require_relative "../lib/active_record"
require_relative "../test/blog/app/models/application_record"
require_relative "../test/blog/app/models/post"

RSpec.describe "ActiveRecord" do
  before(:all) do 
    Post.establish_connection(database: "../test/blog/db/development.sqlite3")
  end

  it "can initialize an object from the database" do
    post = Post.new(id: 1, title: "This is a test", body: "This is the body")

    expect(post.id).to eq(1)
    expect(post.title).to eq("This is a test")
    expect(post.body).to eq("This is the body")
  end

  xit "can save object to database" do
    post = Post.new(id: 1, title: "This is a test", body: "This is the body")

    post.save

    expect(post.new_record?).to be_falsy
  end

  it "can return records from database" do
    post = Post.find(1)

    expect(post.id).to eq(1)
    expect(post.title).to eq("This is a test title")
    expect(post.body).to eq("This is the body of the post")
  end

  it "can execute query using connection" do
    posts = Post.connection.execute("SELECT * FROM posts")

    expect(posts.count).to eq(1)
    expect(posts.class).to eq(Array)
  end

  it "returns all entries in database when Table.all is called" do
    post = Post.all.first

    expect(post.id).to eq(1)
    expect(post.title).to eq("This is a test title")
    expect(post.body).to eq("This is the body of the post")
  end
end
