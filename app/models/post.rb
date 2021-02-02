class Post < ApplicationRecord

  belongs_to :user
  has_many :responses
  validates :title, :body, presence: true

  def created_at_formatted
    self.created_at.strftime('%d %b %Y %I:%M%P')
  end

end
