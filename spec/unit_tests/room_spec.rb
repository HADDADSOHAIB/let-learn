require 'rails_helper'

RSpec.describe 'Room' do
  let(:room) { create(:room) }

  it 'should be valid' do
    assert room.valid?
  end
end
