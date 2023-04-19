class SessionsController < ApplicationController
    def click
        byebug 
        cookies[:click] ||= 0 
        cookies[:click] = cookies[:click].to_i + 1 
        session[:click] ||= 0 
        session[:click] += 1 
    end 

    def page_views
        cookies[:page_views] ||= 0
        cookies[:page_views] = cookies[:page_views].to_i + 1
        session[:page_views] ||= 0
        session[:page_views] += 1 
    end 

end
