require './config/autoload'

Thin::Server.start('0.0.0.0', 3000) do
  use Rack::CommonLogger
  map '/test' do
    run HelloController::Index.new
  end

  map '/halo' do
    run HaloController::Index.new
  end

  map '/assets' do
    run Rack::File.new('./assets')
  end
end
