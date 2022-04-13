require_relative "./base"

class HaloController
    class Index < HALO::Action::Base
        set_layouts 'layouts/test'

        def call(env)
            render(status: 200)
        end
    end
end
