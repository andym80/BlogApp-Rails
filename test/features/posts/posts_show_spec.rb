require_relative '../config/environment'

RSpec.describe UsersController, type: :request do
  describe 'GET #index' do
    it 'returns http success' do
      get users_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      get users_path(1)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #posts' do
    it 'returns http success' do
      get users_path(1)
      expect(response).to have_http_status(:success)
    end
  end
end

describe 'show first post complete', type: :feature do
  describe 'GET #index' do
    it 'returns http success' do
      get users_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      get users_path(1)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #posts' do
    it 'returns http success' do
      get users_path(1)
      expect(response).to have_http_status(:success)
    end
  end
  context 'visit /users/user_id/posts/post_id' do
    let(:post) do
      Post.first
    end

    before(:example) { visit "/users/#{post.user.id}/posts/#{post.id}" }

    it 'can see the posts title.' do
      expect(page).to have_content(post.title)
    end

    it 'can see who wrote the post.' do
      expect(page).to have_content(post.user.name)
    end

    it 'can see how many comments it has.' do
      expect(page).to have_content("Comments: #{post.CommentsCounter}")
    end

    it 'can see how many likes it has.' do
      expect(page).to have_content("Likes: #{post.LikesCounter}")
    end

    it 'can see the post body.' do
      expect(page).to have_content(post.text.slice(0, 50))
    end

    it 'can see the username of each commentor.' do
      post.comments.each do |comment|
        expect(page).to have_content(comment.user.name)
      end
    end

    it 'can see the comment each commentor left.' do
      post.comments.each do |comment|
        expect(page).to have_content(comment.text)
      end
    end

    describe 'GET #index' do
      it 'returns http success' do
        get users_path
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET #show' do
      it 'returns http success' do
        get users_path(1)
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET #posts' do
      it 'returns http success' do
        get users_path(1)
        expect(response).to have_http_status(:success)
      end
    end
  end
end
