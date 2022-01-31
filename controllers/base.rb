require "erb"

class HALO
  class Action
    class Base
      attr_accessor :controller_name, :action_name

      def initialize
        @controller_name = get_controller_name()
        @action_name = get_action_name()
      end

      def render(status: 200, content_type: "text/html")
        body = get_action_template()
        [
        status,
        { 'Content-Type' => content_type },
        [body.result(binding)]
        ]
      end

      private

      def get_controller_name
        self.class.name.sub(/Controller::.+/, '').downcase
      end

      def get_action_name
        self.class.name.sub(/.+::/, '').downcase
      end

      def get_action_template
        ERB.new(File.read("./views/#{controller_name}/#{action_name}.erb"))
      end
    end
  end
end
