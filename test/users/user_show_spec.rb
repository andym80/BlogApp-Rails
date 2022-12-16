require 'rails_helper'
require 'capybara'

RSpec.describe Post, type: :feature do
  before(:each) do
    @user = User.create(name: 'Tom', bio: 'Lorem ipsum', photo: 'https://picsum.photos/200/300', posts_counter: 0)
    @user2 = User.create(name: 'Lily', bio: 'Lorem ipsum', photo: 'https://picsum.photos/200/250', posts_counter: 2)
    @post = Post.create(title: 'Hello', text: 'Lorem ipsum', author_id: @user.id, comments_counter: 0,
                        likes_counter: 0)
    @post2 = Post.create(title: 'Post2', text: 'ipsum  ipsum ipsum', author_id: @user.id, comments_counter: 0,
                         likes_counter: 0)
    @post3 = Post.create(title: 'Post3', text: 'Lorem ipsum Lorem ipsum Lorem ipsum', author_id: @user.id,
                         comments_counter: 0, likes_counter: 0)
    @post4 = Post.create(title: 'Post4', text: 'Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum', author_id: @user.id,
                         comments_counter: 0, likes_counter: 0)
  end

  describe 'testing show' do
    it 'display user name' do
      visit user_path(@user)
      expect(page).to have_content('Tom')
      expect(page).to_not have_content('Lily')
    end

    it 'can see the post title' do
      visit user_path(@user)
      expect(page).to have_content(@post.title)
    end

    it 'can see the post content' do
      visit user_path(@user)
      expect(page).to have_content(@post.text)
    end

    before(:example) { visit post_path(post) }

    it 'can see the post content' do
      expect(page).to have_content(post.text)
    end

    it 'can see the post comments counter' do
      expect(page).to have_content(post.comments.count)
    end

    it 'can see the post likes counter' do
      expect(page).to have_content(post.likes.count)
    end

    it 'can see the post user name' do
      expect(page).to have_content(post.author.name)
    end

    it 'can see the post user profile picture' do
      expect(page).to have_scss("img[src*='#{post.user.profile_picture}']")
    end

    it 'can see the post user posts counter' do
      expect(page).to have_content(user.post.posts.count)
    end

    it 'can see the post user comments counter' do
      expect(page).to have_content(post.user.comments.count)
    end

    it 'can see the post user likes counter' do
      expect(page).to have_content(post.user.likes.count)
    end
  end
end
