require "test_helper"

class JournalEntryImageTest < ActiveSupport::TestCase
  setup do
    @entry = JournalEntry.create!(
      title: "Trip",
      content: "Content"
    )
  end

  test "can attach image" do
    @entry.images.attach(
      io: File.open(Rails.root.join("test/fixtures/files/test_image.jpg")),
      filename: "test_image.jpg",
      content_type: "image/jpg"
    )

    assert @entry.images.attached?
  end
end
