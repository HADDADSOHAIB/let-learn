# require "rails_helper"

RSpec.describe RoomsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/rooms').to route_to('rooms#index')
    end

    it 'routes to #show' do
      expect(get: '/rooms/1').to route_to('rooms#show', id: '1')
    end
  end
end
