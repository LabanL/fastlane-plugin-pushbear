require 'fastlane/action'
require_relative '../helper/pushbear_helper'
require_relative 'runner'

module Fastlane
  module Actions
    class PushbearAction < Action
      def self.run(params)
        # UI.message("The pushbear plugin is working!")
        ::Pushbear::Runner.new().run(params)
      end

      def self.description
        "基于微信模板的一对多消息送达服务"
      end

      def self.authors
        ["LabanL"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "基于微信模板的一对多消息送达服务"
      end

      def self.available_options
        [
          # FastlaneCore::ConfigItem.new(key: :your_option,
          #                         env_name: "PUSHBEAR_YOUR_OPTION",
          #                      description: "A description of your option",
          #                         optional: false,
          #                             type: String)
          FastlaneCore::ConfigItem.new(key: :sendkey,
                                  optional: false,
                               description: "SendKey"),

          FastlaneCore::ConfigItem.new(key: :text,
                                  optional: false,
                               description: "Message title"),
          
          FastlaneCore::ConfigItem.new(key: :desp,
                                  optional: true,
                               description: "Description")
        ]
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://docs.fastlane.tools/advanced/#control-configuration-by-lane-and-by-platform
        #
        # [:ios, :mac, :android].include?(platform)
        true
      end
    end
  end
end
