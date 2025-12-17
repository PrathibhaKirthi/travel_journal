require "test_helper"

class JournalEntrySearchTest < ActiveSupport::TestCase
  setup do
    @entry = JournalEntry.create!(
      title: "Trip to Paris",
      content: "Fun times"
    )
  end

  test "search returns matching entries" do
    results = JournalEntry.search("Paris")
    assert_includes results, @entry
  end
end
