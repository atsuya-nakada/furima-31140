require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it "全ての項目の入力が存在すれば登録できること" do
      @item
      expect(@item).to be_valid
    end

    it "nameが空だと登録できない" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "descriptionが空だと登録できない" do
      @item.description = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it "category_idが空だと登録できない" do
      @item.category_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
    end

    it "condition_idが空だと登録できない" do
      @item.condition_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank", "Condition is not a number")
    end

    it "handleng_time_idが空だと登録できない" do
      @item.handleng_time_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Handleng time can't be blank", "Handleng time is not a number")
    end

    it "postage_payer_idが空だと登録できない" do
      @item.postage_payer_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Postage payer can't be blank", "Postage payer is not a number")
    end

    it "prefecture_idが空だと登録できない" do
      @item.prefecture_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank", "Prefecture is not a number")
    end

    it "priceが空だと登録できない" do
      @item.price = ""
      @item.valid?
      binding.pry
      expect(@item.errors.full_messages).to include("Price can't be blank", "Price is not a number")
    end

    it "imageが空だと登録できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it "category_idが1の値だと登録できない" do
      @item.category_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end

    it "condition_idが1の値だと登録できない" do
      @item.condition_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition must be other than 1")
    end

    it "handleng_time_idが1の値だと登録できない" do
      @item.handleng_time_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Handleng time must be other than 1")
    end

    it "postage_payer_idが1の値だと登録できない" do
      @item.postage_payer_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Postage payer must be other than 1")
    end

    it "prefecture_idが1の値だと登録できない" do
      @item.prefecture_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
    end

    it "priceが半角数字以外だと登録できない" do
      @item.price = "７００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
  end
end
