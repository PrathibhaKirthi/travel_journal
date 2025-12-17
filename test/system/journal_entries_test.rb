require "application_system_test_case"

class JournalEntriesTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "user creates a journal entry" do
    sign_in @user
    visit journal_entries_url
    click_on "New Entry"
    fill_in "Title", with: "Trip to Rome"
    fill_in "Content", with: "Amazing vacation!"
    click_on "Create Journal entry"
    assert_text "Trip to Rome"
  end

  test "user searches for an entry" do
    sign_in @user
    visit journal_entries_url
    fill_in "query", with: "Paris"
    click_on "Search"
    assert_text "Trip to Paris"
  end
end
