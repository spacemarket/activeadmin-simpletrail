module ActiveAdmin
  class Application
    inheritable_setting :simple_trail_log_path, 'log/simple_trail.log'
    inheritable_setting :simple_trail_log_format, "#<action> #<model>(ID:#<model_id>) by #<user>\t#<changes>"
    inheritable_setting :simple_trail_log_level, :info
  end
end
