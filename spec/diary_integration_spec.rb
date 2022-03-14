require "diary"
require "diary_entry"

RSpec.describe "integration" do
  describe "#add" do
    it "adds an entry to the diary" do
      diary = Diary.new
      diary_entry = DiaryEntry.new("Tuesday", "I went to McDonalds but it was shut")
      diary.add(diary_entry)
      result = diary.read_all_entries
      expect(result).to eq "" +
      "My Diary\n" +
      "Title: Tuesday. Entry: I went to McDonalds but it was shut.\n"
    end
  end

  describe "#read_all_entries" do
    it "returns all the entries in the diary" do
      diary = Diary.new
      tuesday = DiaryEntry.new("Tuesday", "I went to McDonalds but it was shut")
      wednesday = DiaryEntry.new("Wednesday", "I went back to McDonalds and it was open this time")
      diary.add(tuesday)
      diary.add(wednesday)
      expect(diary.read_all_entries).to eq "" +
      "My Diary\n" +
      "Title: Tuesday. Entry: I went to McDonalds but it was shut.\n" +
      "Title: Wednesday. Entry: I went back to McDonalds and it was open this time.\n"
    end
  end


  describe "#count_words" do
    it "counts all the words of all entries in the diary" do
      diary = Diary.new
      diary_entry = DiaryEntry.new("my_title", "my contents")
      diary_entry_2 = DiaryEntry.new("my_title_2", "my contents 2")
      diary.add(diary_entry)
      diary.add(diary_entry_2)
      expect(diary.count_words).to eq 5
    end
  end

  describe "#reading_time" do
    it "returns an integer representing an estimated reading time of the diary based on wpm" do
      diary = Diary.new
      diary_entry = DiaryEntry.new("my_title", "my contents")
      diary_entry_2 = DiaryEntry.new("my_title_2", "my contents 2")
      diary.add(diary_entry)
      diary.add(diary_entry_2)
      expect(diary.reading_time(1)).to eq 5
    end
  end

  describe "#find_best_entry_for_reading_time" do
    it "returns the longest diary entrance readable in the given time based on the user's reading speed" do
      diary = Diary.new
      tuesday = DiaryEntry.new("Tuesday", "I went to McDonalds but it was shut")
      wednesday = DiaryEntry.new("Wednesday", "I went back to McDonalds and it was open this time")
      thursday = DiaryEntry.new("Thursday", "I went to Five Guys")
      diary.add(tuesday)
      diary.add(wednesday)
      diary.add(thursday)
      result = diary.find_best_entry_for_reading_time(1,10)
      expect(result).to eq tuesday
    end
  end
end