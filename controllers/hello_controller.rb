require_relative "./base"

class HelloController
    class Index < HALO::Action::Base
        def call(env)
            @hoge = "HALO2"
            render(status: 200)
        end
    end
end
