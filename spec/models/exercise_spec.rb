require 'rails_helper'



describe Exercise do
  context "validations" do
    it {should validate_presence_of :name}
    it {should allow_value('weights').for (:type) }
    it {should allow_value('long distance running').for (:type) }
    it {should allow_value('sprints').for (:type) }
    it {should_not allow_value('laziness').for (:type) }
    it {should_not allow_value('yoga').for (:type) }
  end

end

