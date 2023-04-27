module ApplicationHelper

	def button_text
	    if controller.action_name == "new"
	       return "Sign up"
	    elsif controller.action_name == "edit"
	       return "Update Account"
	    else
	       return "Submit"
	    end
	end

end
