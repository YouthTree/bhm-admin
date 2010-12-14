module BHM
  module Admin
    module AttrAccessibleScoping
      UnassignableAttribute = Class.new(StandardError)

      class << self
        
        def verbose?
          !Thread.current[:attr_accessible_silent]
        end

        def silent!
          Thread.current[:attr_accessible_silent] = true
        end

        def verbose!
          Thread.current[:attr_accessible_silent] = nil
        end

        def disabled?
          !enabled?
        end

        def enabled?
          !Thread.current[:attr_accessible_disabled]
        end

        def disable!
          Thread.current[:attr_accessible_disabled] = true
        end

        def enable!
          Thread.current[:attr_accessible_disabled] = nil
        end

        def disable
          enabled = !disabled?
          enable! if enabled
          yield if block_given?
        ensure
          enable! if enabled
        end
        
        def silence
          verbose = verbose?
          silent! if verbose
          yield if block_given?
        ensure
          verbose! if verbose
        end

      end

      class Sanitizer < ActiveModel::MassAssignmentSecurity::WhiteList

        def deny?(attribute)
          return false if AttrAccessibleScoping.disabled? || self.include?("all")
          super
        end

        protected

        def warn!(attrs)
          super
          if AttrAccessibleScoping.verbose?
            raise UnassignableAttribute.new("Unable to assign attributes: #{attrs.join(", ")}")
          end
        end

      end

      module ARMixin

        def accessible_attributes
          if _accessible_attributes.blank? || !_accessible_attributes.is_a?(BHM::Admin::AttrAccessibleScoping::Sanitizer)
            existing = _accessible_attributes
            self._accessible_attributes = BHM::Admin::AttrAccessibleScoping::Sanitizer.new.tap do |w|
              w.logger = self.logger if self.respond_to?(:logger)
            end
            self._accessible_attributes += existing if existing.present?
          end
          _accessible_attributes
        end

      end
    end
  end
end