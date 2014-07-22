Then(/^I should see "(.*?)" in the citation linker section$/) do |content|
  within "#citation-linker" do
    expect(page).to have_content content
  end
end

Then(/^I should see a citation linker form$/) do
  within "#citation-linker" do
    citation_linker_form = find(:css, 'form#OpenURL')
  end
end

Then(/^I should see a tip that can help if I'm having trouble finding my article$/) do
  within "#citation-linker" do
    tip = find(:css, '.nyu-tip a')
    expect(tip).to have_text 'Having trouble finding your article?'
    expect(tip[:href]).to eq 'http://library.nyu.edu/info/umlaut/article_finding_tips.html'
  end
end
