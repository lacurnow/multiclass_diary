require_relative "diary_entry.rb"

class Diary
  def initialize
    @entries = []
  end

  def add(entry) # entry is an instance of DiaryEntry
    @entries << entry
  end

  def entries
    return @entries
  end

  def read_all_entries
    all_entries_formatted = "My Diary\n" 
    @entries.each { |entry|
      all_entries_formatted += "Title: #{entry.title}. Entry: #{entry.contents}.\n"
    }
    return all_entries_formatted
  end

  def count_words
    total_word_count = 0
    @entries.each { |entry| 
    total_word_count += entry.count_words
  }
    return total_word_count
  end

  def reading_time(wpm)
    total_reading_time = 0
    @entries.each { |entry|
    total_reading_time += entry.reading_time(wpm)
  }
  return total_reading_time
  end

  def find_best_entry_for_reading_time(wpm, minutes)
    longest_entry_length = 0
    longest_entry = nil
    total_words_readable = wpm * minutes
    @entries.each { |entry|
      time_to_read = entry.reading_time(wpm)
      if (time_to_read > longest_entry_length) && ( time_to_read <= total_words_readable)
        longest_entry_length = time_to_read
        longest_entry = entry
      end
    }
    return longest_entry
  end
end
