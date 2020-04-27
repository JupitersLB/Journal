# displays options to the user
class View
  def display(entries)
    entries.each_with_index do |entry, idx|
      puts "#{idx + 1} - #{entry.date_input} - #{entry.entry}"
      puts ''
    end
  end

  def ask_for_date
    puts ''
    puts 'Which date is your entry for? (Press enter for today)'
    print '> '
    gets.chomp == '' ? Time.new.strftime('%B %d, %Y') : gets.chomp
  end

  def ask_for_entry
    puts ''
    puts 'What happened?'
    print '> '
    gets.chomp
  end

  def ask_for_index
    puts ''
    puts 'Please input a number:'
    print '> '
    gets.chomp.to_i - 1
  end
end
