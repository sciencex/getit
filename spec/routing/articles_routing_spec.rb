require 'rails_helper'
describe "routes for articles" do
  describe "GET /articles" do
    subject { get '/articles' }
    it { should route_to(controller: "articles", action: "index") }
  end
end
