module RegistrationsHelper
    def register_or_sold_out(event)
        if event.sold_out?
            content_tag(:span, "Sold Out!", class: "registration")
        else
            link_to "Register!", new_event_registration_path(event)
        end
    end
end
