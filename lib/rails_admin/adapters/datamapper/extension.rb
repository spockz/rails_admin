
module RailsAdmin
  module Adapters
    module DataMapper
      module Extension
        extend ActiveSupport::Concern
        
        included do
          
          def self.rails_admin(&block)
            RailsAdmin::Config.model(self, &block)
          end
          
        end
        
        def safe_send(value)
          # TODO: Figure out why this method exists (read_attribute vs send in other adapters)
          self.send(value)
        end

      end
    end
  end
end
