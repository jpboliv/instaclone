module ApplicationHelper
    def flash_class(level)
        case level
            when 'notice' then "alert alert-info"
            when 'success' then "alert alert-success"
            when 'danger' then "alert alert-danger"
            when 'danger' then "alert alert-danger"
        end
    end
end