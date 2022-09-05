require 'rails_helper'

RSpec.describe User, type: :model do
    subject { User.new(name: "Example User")}

    before {subject.save}
    after {User.destroy_all}

    it { should respond_to(:name) }
end

