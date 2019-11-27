class Post < ActiveRecord::Base

  belongs_to :author
  #custom validation
  validate :is_title_case 
  #lifecycle method:
  # This gets called after validation: before_save :make_title_case 
  #If performing actions, use before_save
  #modifying an arribute of the model, use before_validation
  before_validation :make_title_case
  before_save :email_author_about_post

  private

  def is_title_case
    if title.split.any?{|w|w[0].upcase != w[0]}
      errors.add(:title, "Title must be in title case")
    end
  end

  def make_title_case
    #rails provides a string#titlecase method 
    self.title = self.title.titlecase
  end

  def email_author_about_post

  end 
end
