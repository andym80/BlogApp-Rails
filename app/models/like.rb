class Like < ApplicationRecord
  belongs_to :author, class_name: 'Users'
  belongs_to :post

  after_save :update_likess_counter

  def update_likess_counter
    post.increment!(:likes_counter)
  end
end
