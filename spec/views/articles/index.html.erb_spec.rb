require 'rails_helper'
describe 'articles/index' do
  let(:current_primary_institution) { Institutions.institutions[:NYU] }
  before do
    allow(view).to receive(:current_primary_institution).and_return(current_primary_institution)
    render
  end
  subject { rendered }
  it { should match /<div class="articles search with-tabs">/ }
  it { should render_template 'articles/_search_form' }
  it { should render_template 'articles/_citation_linker' }
end
