require 'rails_helper'

RSpec.describe Animal, type: :model do
    it { should validate_presence_of(:name) }

    it { should validate_presence_of(:breed) }

    it { should validate_presence_of(:age) }

    it { should validate_presence_of(:additional_info) }
end