class Term
  @@all_terms = []

  def Term.all_terms
    @@all_terms
  end

  def Term.search(input)
    @@all_terms.each do |term|
      if term.word == input
         return term
      end
    end
  end

  def initialize(word, definition)
    @word = [word]
    @definition = [definition]
  end

  def word
    @word
  end

  def change_definition(new_def)
    @definition = [new_def]
  end

  def add_definition(input)
    @definition << input
  end

  def definition
    @definition
  end

  def add_term
    @@all_terms << self
  end
end
