class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validates :clickbait_title, on: :title

  def clickbait_title
    if title.include?("Won't Believe", "Secret", "Top[number]", "Guess")
      true
    else
      false
    end
  end
end
