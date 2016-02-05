module DataAttributeHelper
    def page_data_attr
        controller_array = controller.controller_path.split("/").map(&:camelize).join("_")
        action = controller.action_name.capitalize
        "data-controller='#{controller_array}' data-action='#{action}'".html_safe
    end
end
