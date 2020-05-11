# require "rails_helper"

RSpec.describe MessagesController, type: :routing do
  describe 'routing' do
    it 'routes to #create' do
      expect(post: '/messages').to route_to('messages#create')
    end
  end
end
