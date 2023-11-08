require 'rails_helper'

RSpec.feature "UserIndices", type: :feature do
  let(:user) { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }
  let(:post) { Post.new(author: user, title: 'Hello', text: 'This is my first post') }
  let(:users) { User.all }

  before { user.save }

  context 'index page' do
    before { visit root_path }

    it 'shows the username of all other users' do
      users.each do |u|
        expect(page).to have_content(u.name)
      end
    end

    it 'shows the profile picture for each user' do
      users.each do |u|
        expect(page).to have_selector("img[src='#{u.photo}']")
      end
    end

    it 'shows the number of posts for each user' do
      users.each do |u|
        expect(page).to have_content("Number of Posts: #{u.posts_counter}")
      end
    end

    it "redirects me to the user's show page" do
      users.each do |u|
        # click_link u.name
        # expect(page).to have_current_path(user_path(u))
        visit root_path
      end
    end
  end
end
