# http://www.bitelm.com/2014/03/your-development-log-files-in-rails-is.html

# This snippet simply clears your logs when they are too large.
# Large logs for development are usually something you don't want.
# Every time you run rails server or rails console it checks the size
# of your development logfile and truncates it.
 
if Rails.env.development?
  MAX_LOG_SIZE = 1.megabytes
  DEV_LOG_FILE = File.join(Rails.root, 'log', 'development.log')
 
  if File.size?(DEV_LOG_FILE).to_i > MAX_LOG_SIZE
    $stdout.puts "-------------------------------------------------"
    $stdout.puts "Truncating development.log...."
    $stdout.puts "-------------------------------------------------"
    File.truncate(DEV_LOG_FILE, 0)
  end
end