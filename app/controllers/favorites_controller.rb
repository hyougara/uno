class FavoritesController < ApplicationController
  # before_action :authenticate_user! 
  
  def create
    favorite = current_user.favorites.build(post_id: params[:post_id])
    favorite.save
    redirect_to posts_path
    
  end

  def destroy
    Favorite.find_by(post_id: params[:post_id], user_id: current_user.id).destroy
    redirect_to posts_path
  end

  private
    # def favorite_params
    #   params.require(:favorite).permit(:user_id, :post_id)
    # end

end
