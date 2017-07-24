class PagesController < ApplicationController
    def show_contact
        render "contact"
    end

    def show_about
        render "about"
    end
    
    def show_forms
        render "forms"
    end
    
end
