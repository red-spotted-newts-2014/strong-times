require 'bcrypt'

class User < ActiveRecord::Base
  #has_secure_password
  validates :email, presence: true
  validates :email, :uniqueness => true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  has_many :workouts
  has_many :exercises
  has_many :workout_histories, through: :workouts
  has_many :exercise_histories

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
