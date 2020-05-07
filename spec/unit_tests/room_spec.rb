require 'rails_helper'

RSpec.describe 'Room' do
  before(:each) do
    @room = Room.create
  end

  it 'should be valid' do
    assert @room.valid?
  end
end