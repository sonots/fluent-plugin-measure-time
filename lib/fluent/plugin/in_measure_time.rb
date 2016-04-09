require 'fluent/plugin/measure_timable'

module Fluent
  class MeasureTimeInput < Input
    Plugin.register_input('measure_time', self)

    unless method_defined?(:router)
      define_method(:router) { ::Fluent::Engine }
    end

    def configure(conf)
      ::Fluent::Input.__send__(:include, MeasureTimable)
      ::Fluent::Output.__send__(:include, MeasureTimable)
    end
  end
end
