class Dispatcher
  def initialize
    # @callbacks is a Hash
    # Its keys are arbitrary Strings
    # Its values are Procs
    @callbacks = {}
  end

  def register(event, &block)
    @callbacks[event] = block
  end

  # Remember, the value of @callbacks[event] is a Proc
  # We use Proc#call to actually invoke the particular Proc
  def dispatch(event, data)
    @callbacks[event].call(data)
  end
end

dispatcher = Dispatcher.new

dispatcher.register("clicked") do |data|
  puts "Clicked: #{data.inspect}"
end

dispatcher.register("hovered") do |data|
  puts "Hovered: #{data.inspect}"
end

# What the strings are is irrelevant.  For example, this might give you
# an idea of how those get('/users') { ... } calls work in Sinatra.
dispatcher.register("GET /users") do |data|
  puts "GET /users: #{data.inspect}"
end

# Let's randomly "fire" some events.  This simulates something like...
# 1. A user interacting with a user interface
# 2. A web application servicing incoming requests
#
# The thing these have in common is that the program doesn't know beforehand
# when or how it will receive input.  It only knows what to do once it receives
# a particular kind of input (as specified via the "register") calls above.

20.times do
  event = ["clicked", "hovered", "GET /users"].sample
  data  = { :object => "Event #{rand(1000)}" }

  dispatcher.dispatch(event, data)
end
