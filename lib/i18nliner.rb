require 'i18n'
require 'i18nliner/base'
require 'i18nliner/extensions/core'

I18n.send :extend, I18nliner::Extensions::Core
I18n::RESERVED_KEYS = I18n.send(:remove_const, :RESERVED_KEYS) + [:i18nliner_scope, :i18nliner_inferred_key]

require 'i18nliner/railtie' if defined?(Rails)
