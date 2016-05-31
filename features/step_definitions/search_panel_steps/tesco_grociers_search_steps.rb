Given(/^I am on the tesco groceries page$/) do
  visit TescoGroceriesSearchPage
end

And(/^I click on search button$/) do
  (on TescoGroceriesSearchPage).click_on_search
end

When(/^I enter required product in search field eg "([^"]*)"$/) do |search_term|
  @product = search_term
  (on TescoGroceriesSearchPage).enter_product_wish_to_buy(search_term)
end

Then(/^I should see the required product in search results$/) do
  (on TescoGroceriesSearchPage).is_match_displayed?(@product).should be_true
end

When(/^I enter an incorrect product in search field eg "([^"]*)"$/) do |somexyz|
  (on TescoGroceriesSearchPage).enter_free_text_in_search_field(somexyz)
end

Then(/^I should see the error validation message as "([^"]*)"$/) do |error_message|
  (on TescoGroceriesSearchPage).is_no_match_error_message_displayed?(error_message).should be_true
end

Then(/^I should see message as "([^"]*)"$/) do |err_msg|
  (on TescoGroceriesSearchPage).is_warning_message_displayed?(err_msg).should be_true
end

And(/^I click a filter from area filter section$/) do
  (on TescoGroceriesSearchPage).click_on_area_filter
end

Then(/^I should see for the selected product only in search results$/) do
  (on TescoGroceriesSearchPage).is_specific_results_displayed?.should be_true
end

And(/^I click on new products filter from popular filter section$/) do
  (on TescoGroceriesSearchPage).click_on_new_products_filter
end

Then(/^I should see new products only in search results$/) do
  (on TescoGroceriesSearchPage).are_new_products_displayed?.should be_true
end