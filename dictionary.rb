require ('./lib/term')

def dictionary
  loop do
    puts "Press 'w' to add a new word"
    puts "Press 'd' to add another definition to a word"
    puts "Press 'l' to list all the words"
    puts "Press 's' to show the definition"
    puts "Press 'e' to edit a definition"
    puts "Press 'd' to delete a definition"
    puts "Press 'f' to find a word"
    puts "Press 'u' to add a definition"
    puts "Press 'x' to exit"
    main_choice = gets.chomp
    if main_choice == 'w'
      new_term
    elsif main_choice == 'l'
      list_words
    elsif main_choice == 's'
      show_def
    elsif main_choice == 'e'
      edit_def
    elsif main_choice == 'd'
      delete_term
    elsif main_choice == 'f'
      search_term
    elsif main_choice == 'u'
      add_def
    elsif main_choice == 'x'
      exit
    end
  end
end

def new_term
  puts "enter the word"
  input_word = gets.chomp
  puts "enter the definition"
  input_definition = gets.chomp
  new_word = Term.new(input_word, input_definition)
  new_word.add_term
end

def list_words
  Term.all_terms.each_with_index do |term,index|
    puts term.word.join + '   ' + index.to_s
  end
end

def show_def
  list_words
  puts "Enter the number of the word to see its definition"
  user_input = gets.chomp.to_i
  puts Term.all_terms[user_input].definition.join(' ')
end

def edit_def
  list_words
  puts "Enter the number of the word to edit the definition"
  user_input = gets.chomp.to_i
  puts "Enter the new definition"
  change_def = gets.chomp
  puts Term.all_terms[user_input].definition
  Term.all_terms[user_input].change_definition(change_def)
end

def delete_term
  list_words
  puts "Enter the number of the word to delete it"
  user_input = gets.chomp.to_i
  Term.all_terms.delete_at(user_input)
  puts "word deleted"
end

def search_term
  puts "Enter the word you would like to search for"
  input = gets.chomp
  puts Term.search(input)
end

def add_def
  termvar = search_term
  puts "What is another definition you would like to add?"
  input = gets.chomp
  termvar.add_definition(input)
  puts "definition added!"
end

dictionary
