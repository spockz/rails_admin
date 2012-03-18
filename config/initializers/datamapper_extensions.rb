
if defined?(::DataMapper::Resource)
  require 'rails_admin/adapters/datamapper/extension'
  DataMapper::Resource.send(:include, RailsAdmin::Adapters::DataMapper::Extension)
end
