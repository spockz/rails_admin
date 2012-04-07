require 'rails_admin/adapters/active_record/abstract_object'

module RailsAdmin
  module Adapters
    module DataMapper
      class AbstractObject < RailsAdmin::Adapters::ActiveRecord::AbstractObject

        def initialize(object)
          super
        end

        def set_attributes(attributes, role = nil)
          object.attributes=(attributes)
        end
        
        def new_record?
           object.new?
        end
        
        def save
          object.save
        end
        
        def destroy
          object.destroy
          object
        end
        
      end
    end
  end
end
