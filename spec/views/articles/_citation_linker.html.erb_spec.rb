require 'rails_helper'
describe 'articles/_citation_linker' do
  let(:current_primary_institution) { Institutions.institutions[:NYU] }
  before do
    allow(view).to receive(:current_primary_institution).and_return(current_primary_institution)
    render '/articles/citation_linker'
  end
  subject { rendered }
  it { should match /<div id="citation-linker"/ }
  it { should match /<h2>Find a Specific Article<\/h2>/ }
  it { should match /Having trouble finding your article?/ }
  it { should match /Journal Title/ }
  it { should match /<h3>Optional Information \(enter as much as you know\)<\/h3>/ }
  it { should match /ISSN/ }
  it { should match /Article Title/ }
  it { should match /Author Last Name/ }
  it { should match /Author First Name/ }
  it { should match /Date/ }
  it { should match /Volume/ }
  it { should match /Issue/ }
  it { should match /Start page/ }
  it { should match /End page/ }
  it { should match /<input class="btn" name="commit" type="submit" value="Find" \/>/ }
end
