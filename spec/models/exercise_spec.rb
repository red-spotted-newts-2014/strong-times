require 'rails_helper'



describe Exercise do
  context "validations" do
    it {should validate_presence_of :name}
    it {should allow_value('weights').for (:workout_type) }
    it {should allow_value('long distance running').for (:workout_type) }
    it {should allow_value('sprints').for (:workout_type) }
    it {should allow_value('calisthenics').for (:workout_type) }
    it {should_not allow_value('yoga').for (:workout_type) }
  end

end

