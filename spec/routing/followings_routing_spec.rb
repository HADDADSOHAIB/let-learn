# require "rails_helper"

RSpec.describe FollowingsController, type: :routing do
  describe 'routing' do
    it 'routes to #create' do
      expect(post: '/followings').to route_to('followings#create')
    end

    it 'routes to #destroy' do
      expect(delete: '/followings/1').to route_to('followings#destroy', id: '1')
    end
  end
end
