class SessionsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    client = Client.find_by_email(client_params[:email])

      if client && client.authenticate(client_params[:password])
        session[:user_id] = client.id 
        if params[:optionsRadios] == "option1"
          session[:login_type] = "option1"
          redirect_to clients_path
        else
          session[:login_type] = "option2"
          redirect_to contractors_path
        end
      else 
        flash[:errors] = ["Invalid combination"]
        redirect_to :back
      end
  end

  def update
  end

  def edit
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private
    def client_params
      params.require(:client).permit(:email, :password)
    end 
end
