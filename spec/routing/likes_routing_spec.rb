# require "rails_helper"

RSpec.describe LikesController, type: :routing do
  describe "routing" do
   
    it "routes to #create" do
      expect(post: "/thoughts/1/likes").to route_to("likes#create", thought_id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/thoughts/1/likes/2").to route_to("likes#destroy", thought_id: "1", id: "2")
    end
  end
end
