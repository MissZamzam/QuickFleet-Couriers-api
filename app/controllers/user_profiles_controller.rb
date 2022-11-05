class UserProfilesController < ApplicationController
        rescue_from ActiveRecord::RecordNotFound, with: :user_not_found
        rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity
    
        # GET /rprofiles
        def index
            profiles = UserProfile.all
            render json: profiles
        end
    
        # GET /profiles/:id
        def show
            userprofile = UserProfile.find_by(id: params[:id])
            render json: UserProfile, status: :ok
        end
    
        # POST/profiles
        def create
            userprofile = UserProfile.create!(user_params)
            render json: userprofile, status: :created
        end
    
        # PATCH /profiles/:id
        def update
            userprofile = UserProfile.find(id: params[:id])
            userprofile.update!(user_params)
            render json: userprofile, status: :ok
        end
    
        # DELETE /profiles/:id
        def destroy
            userprofile = UserProfile.find(id: params[:id])
            UserProfile.destroy
            head :no_content
        end
    
        private
    
        def user_params
            params.permit(:firstName, :lastName, :location, :telephone)
        end
    
        def unprocessable_entity(invalid)
            render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
        end
    
        def user_not_found
            render json: { error: "user not found" }, status: :not_found
        end
    
end
