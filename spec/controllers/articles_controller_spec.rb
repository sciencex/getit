require 'rails_helper'
describe ArticlesController do
  describe 'GET index' do
    before do
      allow(controller).to receive(:current_user).and_return(nil)
      get :index
    end
    subject { response }
    it { should be_success }
    it { should render_template('index') }
    it { should render_template('layouts/bobcat') }
  end
end
