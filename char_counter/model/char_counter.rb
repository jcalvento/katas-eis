class CharCounter

  def self.count(a_word)
    hash = {}
    return hash if a_word.nil?
    self.count_char_occurrences_into a_word, hash
  end

  protected

  def self.count_char_occurrences_into(a_word, hash)
    a_word.gsub(/\s+/, "").chars.group_by(&:chr).map {
        |k, v| hash[k] = v.size
    }
    hash
  end
end