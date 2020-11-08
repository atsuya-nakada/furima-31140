require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  before do
    @order = FactoryBot.build(:user_order)
  end

  it "全ての項目の入力が存在すれば登録できること" do
    @order
    expect(@order).to be_valid
  end

  it "postal_codeが空だと登録できない" do
    @order.postal_code = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid")
  end

  it "cityが空だと登録できない" do
    @order.city = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("City can't be blank", "City is invalid")
  end

  it "house_numberが空だと登録できない" do
    @order.house_number = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("House number can't be blank")
  end

  it "phone_numberが空だと登録できない" do
    @order.phone_number = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
  end

  it "prefecture_idが空だと登録できない" do
    @order.prefecture_id = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Prefecture can't be blank", "Prefecture is not a number")
  end

  it "tokenが空だと登録できない" do
    @order.token = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Token can't be blank")
  end

  it "prefecture_idが1の値だと登録できない" do
    @order.prefecture_id = 1
    @order.valid?
    expect(@order.errors.full_messages).to include("Prefecture must be other than 1")
  end

  it "postal_codeがハイフンがないと登録できない" do
    @order.postal_code = "2730044"
    @order.valid?
    expect(@order.errors.full_messages).to include("Postal code is invalid")
  end

  it "cityが全角入力でないと登録できない" do
    @order.city = "lll"
    @order.valid?
    expect(@order.errors.full_messages).to include("City is invalid")
  end

  it "phone_numberが半角英数字でないと登録できない" do
    @order.phone_number = "０９０４４３３６９０７"
    @order.valid?
    expect(@order.errors.full_messages).to include("Phone number is invalid")
  end

  it "phone_numberが11桁以内でないと登録できない" do
    @order.phone_number = "０９０４４３３６９０７34"
    @order.valid?
    expect(@order.errors.full_messages).to include("Phone number is invalid")
  end

  it "phone_numberが11桁以内でないと登録できない" do
    @order.phone_number = "090-4433-6079"
    @order.valid?
    expect(@order.errors.full_messages).to include("Phone number is invalid")
  end
end
