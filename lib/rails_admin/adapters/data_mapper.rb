require 'dm-rails'
require 'rails_admin/adapters/data_mapper/abstract_object'

module RailsAdmin
  module Adapters
    module DataMapper

      def new(params = {})
        AbstractObject.new(model.new(params))
      end

      def get(id)
        if object = model.get(id)
          AbstractObject.new(object)
        else
          nil
        end
      end
      
      def scoped
        model.all
      end

      def all(options = {}, scope = nil)
        scope ||= self.scoped
        scope = scope.page(options[:page]).per(options[:per]) if options[:page] && options[:per]
        # TODO: Implement rest of options
        scope
      end

      def count(options = {}, scope = nil)
        all(options.merge({:limit => false, :page => false}), scope).count
      end
      
      def primary_key
        # TODO: Handle composite keys (if RailsAdmin supports them that is)
        model.key.first.name.to_sym
      end
      
      def associations
        # TODO: Implement associations
        []
      end
      
      def properties
        
        @ar_types = {
          Integer => :integer,
          String  => :string,
          Float => :float
        } unless @ar_types
        
        properties = model.properties
        properties.map do |property|
          type = @ar_types[property.primitive]
          unless type
            raise "Unmapped property type '#{property.primitive}' for '#{model}.#{property.name}'"
          end
          {
            :name => property.name,
            :pretty_name => property.name.to_s.tr('_', ' ').capitalize,
            :type => type,
            :length => property.options[:length],
            :nullable? => property.allow_nil,
            :serial? => !!property.options[:serial]
          }
        end
      end
      
      def table_name
        model.storage_name
      end
      
      def serialized_attributes
        # TODO: Figure out how to handle any serialized attributes
        []
      end
      
      def embedded?
        # TODO: What is this exactly?
        false
      end
      
    end  
  end
end
