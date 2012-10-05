module CanCan
  class ControllerResource

    protected

    def assign_attributes(resource)
      initial_attributes.each do |attr_name, value|
        resource.send("#{attr_name}=", value)
      end
      resource.send("#{parent_name}=", parent_resource) if @options[:singleton] && parent_resource
      resource
    end
  end
end
