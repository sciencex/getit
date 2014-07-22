require 'rails_helper'
describe 'articles/_search_form' do
  let(:current_primary_institution) { Institutions.institutions[:NYU] }
  before do
    allow(view).to receive(:current_primary_institution).and_return(current_primary_institution)
    render '/articles/search_form'
  end
  subject { rendered }
  it { should match /<div id="article-search"/ }
  it { should match /<h2>Search for Articles<\/h2>/ }
  it { should match /What Am I Searching?/ }
  it { should match /<input class="btn" name="commit" type="submit" value="Search" \/>/ }
end
