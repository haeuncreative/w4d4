require 'rspec'
require_relative '../lib/TDD_exer.rb'

    # before(:each) do 
    #     arr { [1, 1, 2, 2, 3, 1, 4] }
    #     arr_none { [1, 2, 3, 4] }
    # end

describe 'my_uniq' do
    let(:arr) { [1, 1, 2, 2, 3, 1, 4] }
    let(:arr_none) { [1, 2, 3, 4] }
    it 'is called on an array' do
        expect(arr).to be_a(Array)
    end

    it 'removes duplicates from an array' do
        expect(my_uniq(arr)).to eq([1, 2, 3, 4])
    end

    it 'will return a new array' do
        expect(my_uniq(arr).object_id).to_not eq(arr.object_id)
    end

    it 'will return them in the order that they appeared' do
        expect(my_uniq(arr)).to eq([1, 2, 3, 4])
        expect(my_uniq(arr)).to_not eq([2, 3, 1, 4])
    end
    
    it 'will not use the built-in #uniq method' do
        expect(my_uniq(arr)).to_not include(arr.uniq)
    end

    it 'will return the same array, if no duplicates' do
        expect(my_uniq(arr_none)).to eq(arr_none)
    end

end
 
describe "Array#two_sum" do
    let(:arr) { [-1, 0, 2, -2, 1] }

    it 'is called on an Array' do
        expect(arr).to be_a(Array)
    end

    it 'will return a two-dimensional array' do
        expect(arr.two_sum).to eq([[0, 4], [2, 3]])
    end


    it 'will return a zero sum pair' do
        expect(arr.two_sum).to eq([[0, 4], [2, 3]])
    end


    # context 'when it has only pairs' do
    #     it 'will have pairs that are sorted "dictionary-wise"' do
    #         expect(arr.two_sum).to eq(arr.two_sum.sort )
    #     end
    # end
end

describe "#my_transpose" do
    let(:rows) {
    [[0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]]
    }

    let(:cols) {
    [[0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]]
    }

    it 'is called on an array' do
        expect(rows).to be_a(Array)
    end
        
    it "will transpose rows and columns" do
        expect(my_transpose(rows)).to eq(cols)
    end

    it 'will not use the built-in #transpose method' do
        expect(my_transpose(rows)).to_not include(rows.transpose)
    end

    # it 'will return a new array' do
    #     expect(my_uniq(rows).object_id).to_not eq(col.object_id)
    # end

end

describe "stock_picker" do
    let(:stocks) { [1000, 3000, 200, 4500, 20, 240, 1900, 6000, 10] }

    it "will accept an array as an argument" do 
        expect(stocks).to be_a(Array)
    end

    it "will return an array" do
        expect(stock_picker(stocks)).to be_a(Array)
    end

    it "will output an array that has two elements" do
        expect(stock_picker(stocks).length).to eq(2)
    end

    it "will have the two elements of that array create the greatest difference" do
        expect(stock_picker(stocks)).to eq([20, 6000])
    end

    it "will have the preceding element be less than its following" do
        expect(stock_picker(stocks)).to_not be([6000, 10])
    end
end




