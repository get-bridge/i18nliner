require 'i18n'

module I18nliner
  def self.translations
  end

  def self.look_up(key)
    I18n.exists?(I18n.locale, key)
  end

  def self.setting(key, value)
    instance_eval <<-CODE
      def #{key}(value = nil)
        if value && block_given?
          begin
            value_was = @#{key}
            @#{key} = value
            yield
          ensure
            @#{key} = value_was
          end
        else
          @#{key} = #{value.inspect} if @#{key}.nil?
          @#{key}
        end
      end
    CODE
  end

  setting :inferred_key_format,        :underscored_crc32
  setting :infer_interpolation_values, true
end