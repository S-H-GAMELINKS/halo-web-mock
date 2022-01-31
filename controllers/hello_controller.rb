require_relative "./base"

class HelloController
    class Index < HALO::Action::Base

        def call(env)
            set_layouts('layouts/test')
            @hoge = "HALO2"
            render(status: 400)
        end
    end
end
