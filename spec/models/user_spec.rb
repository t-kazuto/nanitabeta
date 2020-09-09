require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
   before do
    @user = FactoryBot.build(:user)
   end

   it "username、email、password、password_confirmationが存在すれば登録できる" do
    expect(@user).to be_valid
   end

   it 'nicknameが空では登録できない' do
    @user.username = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Username can't be blank")
   end

   it 'emailが空では登録できない' do
    @user.email = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Email can't be blank")
   end

   it 'passwordが空では登録できない' do
    @user.password = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Password can't be blank")
   end

   it 'passwordが存在してもpassword_confirmationが空では登録できない' do
    @user.password_confirmation = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
   end
  end
end
