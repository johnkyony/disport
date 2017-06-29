class InvitationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_invitation, only: [:show, :edit, :update, :destroy, :game_owner_accept_invitation, :player_accept_invitation]
  def index
    @invitations = Invitation.where(game_id: params[:game_id])
    @game = Game.find_by_id(params[:game_id])
  end
  
  def new
    
  end
  
  def create
    @join_request = Invitation.new
    @join_request.game_id = params[:game_id]
    @join_request.user_id = current_user.id
    game_owner = Game.find_by_id(params[:game_id])
    @join_request.pending!
    if @join_request.save
      flash[:notice] = "waiting for #{game_owner.user.name} response"
      redirect_to games_path
    else
        flash[:error] = "Please retry"
        render games_path
    end
  end
  
  def game_owner_accept_invitation
    @invitation.accepted!
    if @invitation.save
      flash[:success] = " #{@invitation.user.name} has been acceptted "
      redirect_back(fallback_location: root_path)
    else
      flash[:notice] = "An error has occurred please try again"
      redirect_back(fallback_location: root_path)
    end
  end
  
  def player_accept_invitation
    @invitation.accept!
    if @invitation.save 
      flash[:success] = "Ready to go to location"
      redirect_to game_path(:id => @invitation.game.id)
    else
       flash[:notice] = "An error has occurred please try again"
      redirect_back(fallback_location: root_path)
    end
  end
  private
  
  def invitations_params
    params.require(:invitation).permit(:user_id , :game_id , :game_owner_response_status , :game_player_response_status)
  end
  def set_invitation
    @invitation = Invitation.find(params[:id])
  end
end
