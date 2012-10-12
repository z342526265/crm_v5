# Load the rails application
require File.expand_path('../application', __FILE__)

require "pp"
require "array"
require "custom_association_method"
require "set_created_user"
require "string"

# Initialize the rails application
CrmV5::Application.initialize!
