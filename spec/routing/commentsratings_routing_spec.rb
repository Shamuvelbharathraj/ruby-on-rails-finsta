require "rails_helper"

RSpec.describe CommentsratingsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/commentsratings").to route_to("commentsratings#index")
    end

    it "routes to #new" do
      expect(get: "/commentsratings/new").to route_to("commentsratings#new")
    end

    it "routes to #show" do
      expect(get: "/commentsratings/1").to route_to("commentsratings#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/commentsratings/1/edit").to route_to("commentsratings#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/commentsratings").to route_to("commentsratings#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/commentsratings/1").to route_to("commentsratings#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/commentsratings/1").to route_to("commentsratings#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/commentsratings/1").to route_to("commentsratings#destroy", id: "1")
    end
  end
end
