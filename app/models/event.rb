class Event < ActiveRecord::Base
  belongs_to :client, class_name: 'User'
end
