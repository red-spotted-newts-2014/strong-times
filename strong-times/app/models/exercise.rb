class Exercise < ActiveRecord::Base
  belongs_to :user, :workout
end
