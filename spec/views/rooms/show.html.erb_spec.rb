require 'rails_helper'

RSpec.describe "rooms/show", type: :view do
  before(:each) do
    @room = assign(:room, Room.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
