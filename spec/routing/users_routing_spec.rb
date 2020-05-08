# require "rails_helper"

RSpec.describe UsersController, type: :routing do
  describe 'routing' do
    it 'routes to #show' do
      expect(get: '/users/1').to route_to('users#show', id: '1')
    end

    it 'routes to #followings' do
      expect(get: '/users/1/followings').to route_to('users#followings', user_id: '1')
    end

    it 'routes to #followers' do
      expect(get: '/users/1/followers').to route_to('users#followers', user_id: '1')
    end

    it 'routes to #me' do
      expect(get: '/me').to route_to('users#me')
    end
  end
end
