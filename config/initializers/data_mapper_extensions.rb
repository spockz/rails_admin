
if defined?(::DataMapper::Resource)
  require 'rails_admin/adapters/data_mapper/extension'
  DataMapper::Resource.send(:include, RailsAdmin::Adapters::DataMapper::Extension)
end
