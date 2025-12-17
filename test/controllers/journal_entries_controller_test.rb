require "test_helper"

class JournalEntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @entry = journal_entries(:one) # Fixture
    @user = users(:one)
    sign_in @user
  end

  test "should get index" do
    get journal_entries_url
    assert_response :success
  end

  test "should create journal entry" do
    assert_difference('JournalEntry.count') do
      post journal_entries_url, params: { journal_entry: { title: "Test", content: "Testing content" } }
    end
    assert_redirected_to journal_entry_url(JournalEntry.last)
  end

  test "should update journal entry" do
    patch journal_entry_url(@entry), params: { journal_entry: { title: "Updated Title" } }
    assert_redirected_to journal_entry_url(@entry)
    @entry.reload
    assert_equal "Updated Title", @entry.title
  end

  test "should destroy journal entry" do
    assert_difference('JournalEntry.count', -1) do
      delete journal_entry_url(@entry)
    end
    assert_redirected_to journal_entries_url
  end
end
