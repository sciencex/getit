Then(/^I should see "(.*?)" in the article search section$/) do |content|
  within "#article-search" do
    expect(page).to have_content content
  end
end

Then(/^I should see a search box that searches NYU's web\-scale discovery tool$/) do
  within "#article-search" do
    article_search_form = find(:css, 'form.form-search')
  end
end

Then(/^I should see a tip which explains what I am searching$/) do
  within "#article-search" do
    help_link = find(:css, '.nyu-tip a')
    expect(help_link).to have_text "What Am I Searching?"
    expect(help_link[:href]).to eq 'http://nyu.libguides.com/webscaletrials'
  end
end
