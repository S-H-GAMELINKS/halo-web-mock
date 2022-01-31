require "erb"

class HALO
  class Action
    class Base
      attr_accessor :controller_name, :action_name, :layout, :body

      def initialize
        @controller_name = get_controller_name()
        @action_name = get_action_name()
        @layout = get_layout_template()
        @body = get_action_template()
      end

      def set_layouts(path)
        @layout = ERB.new(File.read("./views/#{path}.erb"))
      end

      def include_stylesheet(path)
        "<link rel='stylesheet' href='/assets/css/#{path}.css'>"
      end

      def include_javascript(path)
        "<script type='text/javascript' src='/assets/js/#{path}.js'></script>"
      end

      def render_with_layouts
        @layout.result(binding)
      end

      def render(status: 200, content_type: "text/html")
        [
        status,
        { 'Content-Type' => content_type },
        [render_with_layouts{@body.result(binding)}]
        ]
      end

      private

      def get_controller_name
        self.class.name.sub(/Controller::.+/, '').downcase
      end

      def get_action_name
        self.class.name.sub(/.+::/, '').downcase
      end

      def get_layout_template
        ERB.new(File.read("./views/layouts/app.erb"))
      end

      def get_action_template
        ERB.new(File.read("./views/#{controller_name}/#{action_name}.erb"))
      end
    end
  end
end
