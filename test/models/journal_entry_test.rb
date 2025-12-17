require "test_helper"

class JournalEntryTest < ActiveSupport::TestCase
  test "should not save without title" do
    entry = JournalEntry.new(content: "Some content")
    assert_not entry.save
  end

  test "should not save without content" do
    entry = JournalEntry.new(title: "Trip")
    assert_not entry.save
  end

  test "should save valid journal entry" do
    entry = JournalEntry.new(
      title: "Trip to Paris",
      content: "Had a great time!"
    )
    assert entry.save
  end
end
