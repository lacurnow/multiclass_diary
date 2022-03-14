class DiaryEntry
  def initialize(title, contents) # title, contents are strings
    @title = title
    @contents = contents
    @cursor_begin = 0
    @cursor_end = 0
  end

  def title
    fail "No title provided" if @title.empty?
    return @title
  end

  def contents
    fail "No contents provided" if @contents.empty?
    return @contents
  end

  def count_words
    return @contents.split(" ").count
  end

  def reading_time(wpm) 
    words_to_read = count_words
    time_to_read = words_to_read / wpm
    return time_to_read
  end

  def reading_chunk(wpm, minutes)
    total_words_readable = wpm * minutes
    words_array = @contents.split(" ")
    if @cursor_begin == 0
      @cursor_end = total_words_readable
    elsif @cursor_end == count_words
      @cursor_begin = 0
      @cursor_end = total_words_readable
    else
      @cursor_end = count_words
    end
    reading_chunk_words = words_array[@cursor_begin, @cursor_end]
    reading_chunk = reading_chunk_words.join(" ")
    @cursor_begin = total_words_readable
    return reading_chunk
    
    # If called again, `reading_chunk` should return the next chunk, skipping
    # what has already been read, until the contents is fully read.
    # The next call after that it should restart from the beginning.
  end
end