class InvitationsController < ApplicationController
  before_action :authenticate_user!
  def index
  end
  
  def new
    
  end
  
  def create
    @join_request = Invitation.new(invitations_params)
    @join_request.user_id = current_user.id
    game_owner = Game.find_by_id(params[:game_id])
    @join_request.pending!
    if @join_request.save
      flash[:notice] ="waiting for #{game_owner.user.name} response"
      redirect_to root_path
    else
        flash[:error] = "Please retry"
        render root_path
    end
    
  end
  private
  
  def invitations_params
    params.require(:invitation).permit(:user_id , :game_id , :game_owner_response_status , :game_player_response_status)
  end
end
