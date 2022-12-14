require 'rails_helper'

RSpec.describe Budget, type: :model do
  subject { Budget.new(name: 'Mid-fielder player', amount: 2.00) }

  before { subject.save }
  after { Budget.destroy_all }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = 'Mid-fielder player'
    expect(subject).to be_valid
  end

  it 'is not valid without an amount' do
    subject.amount = 2.00
    expect(subject).to be_valid
  end
end
