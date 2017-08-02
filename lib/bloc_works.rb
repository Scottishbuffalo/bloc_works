require "bloc_works/version"
require "bloc_works/controller"
require "bloc_works/utility"
require "bloc_works/router"
require "bloc_works/dependencies"

module BlocWorks
  class Application
    def call(env)
      response = self.root(env)

      if controller.has_response?
        status, header, response = controller.get_response
        [status, header, [response.body].flatten]
      else
        [200, {'Content-Type' => 'text/html'}, [text]]
      end
    end
  end
end
