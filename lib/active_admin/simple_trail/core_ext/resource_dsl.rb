module ActiveAdmin
  class ResourceDSL
    def simple_trail(options = {}, &block)
      actions = options[:actions] || [:update]
      children = options[:children] || []

      actions.each do |act|
        hook_name = "before_#{act.to_s}".to_sym
        next unless self.respond_to? hook_name
        self.send(hook_name, -> target do
          ActiveAdmin::SimpleTrail.write_log(act, target, current_admin_user.email) if target.changed?
          children.each do |child|
            next unless target.respond_to? child
            next unless target.send(child)
            child_targets = target.send(child)
            child_targets = [child_targets] unless child_targets.respond_to? :each
            child_targets.each do |child_target|
              ActiveAdmin::SimpleTrail.write_log(act, child_target, current_admin_user.email) if child_target.changed?
            end
          end
        end)
      end
    end
  end
end
