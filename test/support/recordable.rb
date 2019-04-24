module Liza
  module Support
    module Recordable
      def self.included(base)
        base.extend ClassMethods
      end

      module ClassMethods
        def use_vcr_fixture(name)
          define_method :setup do
            VCR.insert_cassette(name)
          end

          define_method :teardown do
            VCR.eject_cassette(name)
          end
        end
      end
    end
  end
end
