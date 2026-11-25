# frozen_string_literal: true

module SolidusAvataxCertified
  class Engine < Rails::Engine
    isolate_namespace Spree
    engine_name 'solidus_avatax_certified'

    include SolidusSupport::EngineExtensions

    # SolidusSupport `load`s each decorator that Zeitwerk also autoloads, so every body ran twice.
    # Resolving the constant lets Zeitwerk execute each file once per boot and once per reload.
    def self.load_solidus_decorators_from(path)
      path.glob('**/*.rb') do |decorator_path|
        Rails.autoloaders.main.cpath_expected_at(decorator_path).constantize
      end
    end

    config.autoload_paths += %W(#{config.root}/lib)

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    def self.frontend_available?
      const_defined?('::Spree::Frontend::Engine')
    end
  end
end
