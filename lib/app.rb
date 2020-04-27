require_relative 'repository' # You need to create this file!
require_relative 'controller' # You need to create this file!
require_relative 'router'

puts 'Hello, what is your name?'
print '> '
name = gets.chomp.downcase.strip

csv_file = File.join(__dir__, "#{name}_entries.csv")
repository = Repository.new(csv_file)
controller = Controller.new(repository)

router = Router.new(controller)

# Start the app

router.run
