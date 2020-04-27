require 'csv'

# acts as a database for journal entries
class Repository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @results = []
    parse_csv if File.exist?(@csv_file_path)
  end

  def all
    @results
  end

  def add_entry(new_entry)
    @results << new_entry
    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
    CSV.open(@csv_file_path, 'wb', csv_options) do |csv|
      access_iclass(csv)
    end
  end

  def remove_entry(entry_index)
    @results.delete_at(entry_index)
    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
    CSV.open(@csv_file_path, 'wb', csv_options) do |csv|
      access_iclass(csv)
    end
  end

  def update_entry
    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
    CSV.open(@csv_file_path, 'wb', csv_options) do |csv|
      access_iclass(csv)
    end
  end

  def delete_csv
    File.delete(@csv_file_path)
  end

  private

  def parse_csv
    csv_options = { col_sep: ',', quote_char: '"' }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      @results << Diary.new(row[0], row[1])
    end
  end

  def access_iclass(csv)
    @results.each do |iclass|
      array = []
      array << iclass.date_input
      array << iclass.entry
      csv << array
    end
  end
end
