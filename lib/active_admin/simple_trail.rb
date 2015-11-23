require "active_admin"
require "active_admin/simple_trail/version"
require "active_admin/simple_trail/core_ext/resource_dsl"
require "active_admin/simple_trail/core_ext/application"

module ActiveAdmin
  module SimpleTrail
    def self.write_log(action, target, user)
      logger.send(config.simple_trail_log_level,
        config.simple_trail_log_format.gsub('#<action>', action.to_s).
        gsub('#<model>', target.class.name.downcase).
        gsub('#<model_id>', target.id.to_s).
        gsub('#<user>', user.to_s).
        gsub('#<changes>', target.changes.to_s))
    end

    private
    def self.logger
      @@logger ||= Logger.new(config.simple_trail_log_path)
    end

    def self.config
      ActiveAdmin.application
    end
  end
end
