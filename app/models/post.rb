class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, presence: true, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :test

  def test
    if title == nil
      errors.add(:title)
    else
      valid_titles = ["Won't Believe", "Secret", "Top [number]", "Guess"]
      valid_titles.each do |test_title|
        if title.include?(test_title)
          return true
        end
      end
      errors.add(:title)
    end
  end

  # def test
  #   if title.count < 5
  #     errors.add(:title, "can't be less than 5 letters")
  #   end
  # end

end
