require 'fastlane/action'
require_relative '../helper/github_actions_helper'
require 'octokit'

module Fastlane
  module Actions
    class GithubActionsAction < Action
      def self.run(params)
        client = Octokit::Client.new(:access_token => params[:access_token])
        client.ActionsWorkflows.workflow_dispatch(
          params[:repo],
          params[:id],
          params[:params]
        )
      end

      def self.description
        "Plugin to trigger GitHub Actions workflow"
      end

      def self.authors
        ["KeisukeYamashita"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "This plugin triggers the GitHub Actions workflow via workflow dispatch event"
      end

      def self.available_options
        [
          # FastlaneCore::ConfigItem.new(key: :your_option,
          #                         env_name: "GITHUB_ACTIONS_YOUR_OPTION",
          #                      description: "A description of your option",
          #                         optional: false,
          #                             type: String)
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
