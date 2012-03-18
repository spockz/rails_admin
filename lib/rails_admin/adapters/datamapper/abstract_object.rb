require 'rails_admin/adapters/active_record/abstract_object'

module RailsAdmin
  module Adapters
    module DataMapper
      class AbstractObject < RailsAdmin::Adapters::ActiveRecord::AbstractObject

        def initialize(object)
          super
        end
        
        def new_record?
           object.new?
        end
        
      end
    end
  end
end
