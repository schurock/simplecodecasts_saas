class ProfilesController < ApplicationController
    def new
        @user = User.find( params[:user_id]) #to identify the unique User
        @profile = @user.build_profile
    end
    
    def create
        @user = User.find( params[:user_id])
        @profile = @user.build_profile(profile_params)
        if @profile.save
            flash[:success] = "Profile updated!" 
            redirect_to_user_path( params[:used_id] )
        else
            render action: :new
        end
    end
    
    private #whitelisting of params
    def profile_params
        params.require(:profile).permit(:first_name, :last_name, :job_title, :phone_number, :contact_email, :description)
    end
end