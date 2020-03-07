require 'rails_helper'
require 'pry'

RSpec.describe Product, type: :model do
  it 'should have valid Factory' do
    expect(create(:product)).to be_valid
  end

  describe 'Database table' do
    it { is_expected.to have_db_column :category }
    it { is_expected.to have_db_column :name }
    it { is_expected.to have_db_column :description }
    it { is_expected.to have_db_column :price }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :category}
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :description }
    it { is_expected.to validate_presence_of :price }  
  end

  describe "Check if new dish is created" do
    before do
    @product1 = Product.new(name:"pasta" , description:"best pasta you can eat", price: 45,)
    end  

    it "expects to contain the dish name" do
    expect(@product1.name).to eq("pasta")
    end

    it "expects to contain the description" do      
      expect(@product1.description).to eq("best pasta you can eat")
    end
  end

  describe "Check if product has a Category" do
    before do
    @product2 = Product.new(category:"Pizza", name:"Janko Special" , description:"best pizza from the east", price: 400,)
    end  

    it "expects to contain the dish name" do
    expect(@product2.category).to eq("Pizza")
    end

    it "expects to contain the description" do      
      expect(@product2.description).to eq("best pizza from the east")
    end
  end
end