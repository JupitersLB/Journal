require_relative 'view'
require_relative 'diary'
# Controlls the program
class Controller
  def initialize(repository)
    @repository = repository
    @view = View.new
  end

  def list
    display_entries
  end

  def create
    diary_entry = Diary.new(@view.ask_for_date, @view.ask_for_entry)
    @repository.add_entry(diary_entry)
  end

  def destroy
    display_entries
    index = @view.ask_for_index
    @repository.remove_entry(index)
  end

  def update
    display_entries
    index = @view.ask_for_index
    @repository.all[index] = Diary.new(@view.ask_for_date, @view.ask_for_entry)
    @repository.update_entry
  end

  def delete_all
    @repository.delete_csv
  end

  private

  def display_entries
    entries = @repository.all
    @view.display(entries)
  end
end
