require 'rspec'
require 'tower'

describe Game do
    
    describe '#initialize' do 
        subject(:game) { Game.new }
        let(:game) {
            [[], [], []]
        }

        it 'initializes as an array with three nested arrays' do
            expect(Game.new).to eq([[], [], []])
        end
    end

    describe 'populate_tower' do
        let(:game) {
            [[], [], []]
        }
        it 'will take the first element of the array and populate it with more arrays' do
            expect(game[0]).to eq(
            [_],
            [_, _],
            [_, _, _],
            [_, _, _, _] 
        )
        end

        it 'will not have arrays of greater length precede arrays that are shorter'
            expect(game[0]).to_not eq( [_, _], [_], [_, _, _], [_, _, _, _])
            expect(game[0]).to_not eq(
            [_, _, _, _],
            [_, _, _],
            [_, _]
            [_])
            end


    end
        
end


