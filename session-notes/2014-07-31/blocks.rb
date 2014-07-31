# def bench(msg = nil, second_string, &block)
#   puts msg if msg
#   t0 = Time.now
#   block.call
#   t1 = Time.now

#   t1 - t0
# end

# time = bench("Sleeping for a bit", "something else") do
#   sleep(3)
# end

# puts "This took #{time} seconds to execute."

class Dispatcher
  def initialize
    @callbacks = {}
  end

  def register(event, &block)
    @callbacks[event] = block
  end

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

dispatcher.register("GET /users") do |data|
  puts "GET /users: #{data.inspect}"
end

20.times do
  event = ["clicked", "hovered", "GET /users"].sample
  data  = { :object => "Event #{rand(1000)}" }

  dispatcher.dispatch(event, data)
end
# fire_callback(callbacks, "clicked", {:object => "Some Button Somewhere"})

# link = Link.create! valid_attributes

# expect {
#   get :show, { :short_name => link.to_param }, logged_out_session
# }.to change { link.reload.clicks_count }.by(1)

# def wrap_with(msg, &block)
#   puts msg
#   block.call("hello")
#   puts msg
# end

# wrap_with("Bubbles") do |arg|
#   puts "We were passed: #{arg.inspect}"
# end
