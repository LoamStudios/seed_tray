module DataAttributeHelper
    def page_data_attr
        controller_array = controller.controller_path.split("/").map(&:classify).join("_")
        action = contoller.action_name.classify
        "data-controller='#{controller_array}' data-action='#{action}'".html_safe
    end
end
