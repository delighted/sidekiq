module Sidekiq
  module Middleware
    module Server
      class ActiveRecord
        def call(*args)
          yield
        ensure
          ::ActiveRecord::Base.connection_handler.clear_active_connections! if defined?(::ActiveRecord)
        end
      end
    end
  end
end
