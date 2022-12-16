require 'rails_helper'
require 'capybara'
require_relative '../config/environment'

RSpec.describe 'show all users', type: :feature do
  let!(:users) do
    User.all
  end

  context 'visit /users' do
    before(:example) do
      visit users_path
    end

    it 'I can see the profile picture for each user.' do
      users.each do |user|
        expect(page).to have_css("img[src*='#{user.photo}']")
      end
    end

    it 'I can see the number of posts each user has written.' do
      users.each do |user|
        expect(page.find("#user_id_#{user.id}")).to have_content "Number of posts: #{user.posts_counter}"
      end
    end

    describe 'GET #index' do
      it 'I can see the username of all other users'
      expect(page).to have_content('user.name')
    end

    describre 'GET #index' do
      it 'I can see the profile picture for each user.'
      expect(page).to have_content('user.photo')
    end

    describe 'GET #index' do
      it 'I can see the number of posts each user has written.'
      expect(page).to have_content('user.posts_counter')
    end

    describe 'GET #index' do
      it 'I can see the title of each post.'
      expect(page).to have_content('post.title')
    end

    describe 'GET #index' do
      it 'that redirects to the users show page when you click on a user'
      expect(page).to have_content('user_path')
    end
  end
end
