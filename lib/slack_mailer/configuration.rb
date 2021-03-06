module Slack
  class Mailer
    class Configuration

      attr_accessor :templates_path, :templates_type, :erb_in_templates, :slack_hook_urls

      def initialize
        @templates_path = nil
        @templates_type = nil
        @erb_in_templates = false
        @slack_hook_urls = nil
      end

      class << self
        def config
          @configuration ||= Slack::Mailer::Configuration.new
        end

        def reset
          @configuration = Slack::Mailer::Configuration.new
        end

        def configure
          yield(config)
        end

        def slack_hook_url
          @slack_hook_urls_size ||= config.slack_hook_urls.size
          config.slack_hook_urls[Time.now.to_i % @slack_hook_urls_size]
        end
      end

    end
  end
end
