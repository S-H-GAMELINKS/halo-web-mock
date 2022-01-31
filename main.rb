require "thin"
require "./controllers/entry"

Thin::Server.start('0.0.0.0', 3000) do
  use Rack::CommonLogger
  map '/test' do
    run HelloController::Index.new
  end
end
