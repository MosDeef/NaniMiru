class SwipesController < ApplicationController
  def new
    @movie = Movie.find(params[:movie_id])
    @user = User.find(params[:user_id])
    @party = Party.find(params[:party_id])
    @swipe = Swipe.new
    authorize @swipe
  end

  def create
    @party = Party.find(params[:party_id])
    @swipe = Swipe.new(swipe_params)
    @swipe.party = @party
    @swipe.user = current_user
    authorize @swipe
    respond_to do |format|
      if @swipe.save
        format.html { redirect_to party_movies_path(@party) }
        format.json { head :ok }
      else
        format.html { render "swipes/show", status: :unprocessable_entity }
        format.json { head :ok }
      end
    end
  end

  def show
    @swipe = Swipe.find(params[:id])
    @party = Party.find(params[:party_id])
    @movie = @swipe.movie
    authorize @swipe
  end
  private

  def swipe_params
    params.require(:swipe).permit(:movie_id, :status)
  end
end
