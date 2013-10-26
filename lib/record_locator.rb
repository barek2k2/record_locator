require File.expand_path(File.dirname(__FILE__) + '/record_locator_util')
require File.expand_path(File.dirname(__FILE__) + '/record_locator_finder')

module RecordLocator
    def has_record_locator(reference_column)
      @@record_locator_by = reference_column
      self.send(:include, RecordLocator::InstanceMethods)
    end

    def get_record_locator_field
      @@record_locator_by
    end

    def record_locator
      Finder.new(self,get_record_locator_field)
    end

  module InstanceMethods
    def record_locator_field
      return self.class.to_s.constantize::get_record_locator_field
    end

    def encoded_record_locator
      locator_value = self.send(record_locator_field)
      Util::Base::encode(locator_value)
    end
  end

end