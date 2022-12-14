require 'rails_helper'

RSpec.describe Category, type: :model do
  subject { Category.new(name: 'Manchester', icon: 'martinez.png') }

  before { subject.save }
  after { Category.destroy_all }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = 'Manchester'
    expect(subject).to be_valid
  end

  it 'is not valid without an icon' do
    subject.icon = 'martinez.png'
    expect(subject).to be_valid
  end
end
