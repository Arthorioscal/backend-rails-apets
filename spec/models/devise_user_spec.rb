require 'rails_helper'

RSpec.describe DeviseUser, type: :model do
  it 'should validate presence of name' do
    user = DeviseUser.new(name: nil)
    expect(user.valid?).to be_falsey
    expect(user.errors[:name]).to include(I18n.t('activerecord.errors.messages.blank'))
  end

  it 'should validate presence of email' do
    user = DeviseUser.new(email: nil)
    expect(user.valid?).to be_falsey
    expect(user.errors[:email]).to include(I18n.t('activerecord.errors.messages.blank'))
  end

  it 'should validate presence of password' do
    user = DeviseUser.new(password: nil)
    expect(user.valid?).to be_falsey
    expect(user.errors[:password]).to include(I18n.t('activerecord.errors.messages.blank'))
  end

  it 'should validate presence of cpf' do
    user = DeviseUser.new(cpf: nil)
    expect(user.valid?).to be_falsey
    expect(user.errors[:cpf]).to include(I18n.t('activerecord.errors.messages.blank'))
  end

  it 'should validate presence of date_of_birth' do
    user = DeviseUser.new(date_of_birth: nil)
    expect(user.valid?).to be_falsey
    expect(user.errors[:date_of_birth]).to include(I18n.t('activerecord.errors.messages.blank'))
  end

  it 'should validate presence of phone' do
    user = DeviseUser.new(phone: nil)
    expect(user.valid?).to be_falsey
    expect(user.errors[:phone]).to include(I18n.t('activerecord.errors.messages.blank'))
  end

  it 'should validate format of email' do
    user = DeviseUser.new(email: 'invalid_email')
    expect(user.valid?).to be_falsey
    expect(user.errors[:email]).to include(I18n.t('activerecord.errors.messages.invalid'))
  end

  it { should validate_uniqueness_of(:email).case_insensitive } 

  it { should validate_uniqueness_of(:cpf).case_insensitive }

  it { should validate_uniqueness_of(:phone).case_insensitive }

  it { should validate_length_of(:password).is_at_least(6) }
end
