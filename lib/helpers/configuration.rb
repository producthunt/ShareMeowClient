# Configuration Helper: https://viget.com/extend/easy-gem-configuration-variables-with-defaults
#
# Usage Example:
#
#   require 'helpers/configuration'
#   module MyGem
#     extend Configuration
#
#     define_setting :access_token
#     define_setting :favorite_liquid, 'apple juice'
#   end
#
#   # config/initializers/my_gem.rb
#   MyGem.configuration do |config|
#     config.access_token = 'token'
#     config.favorite_liquid = 'gluten free apple juice'
#   end
module Configuration
  def configuration
    yield self
  end

  def define_setting(name, default = nil)
    class_variable_set("@@#{name}", default)

    define_class_method "#{name}=" do |value|
      class_variable_set("@@#{name}", value)
    end

    define_class_method name do
      class_variable_get("@@#{name}")
    end
  end

  private

  def define_class_method(name, &block)
    (class << self; self; end).instance_eval do
      define_method name, &block
    end
  end
end
