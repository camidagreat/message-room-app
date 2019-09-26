class MessageRoomsController < ApplicationController
  before_action :set_message_room, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /message_rooms
  # GET /message_rooms.json
  def index
    @my_rooms = current_user.message_rooms.index_by(&:id)
    @all_message_rooms = MessageRoom.all
  end

  # GET /message_rooms/1
  # GET /message_rooms/1.json
  def show
    @messages = @message_room.messages.order(:created_at)
    @subscribers = @message_room.users
  end

  # GET /message_rooms/new
  def new
    @message_room = MessageRoom.new
  end

  # GET /message_rooms/1/edit
  def edit
  end

  # POST /message_rooms
  # POST /message_rooms.json
  def create
    @message_room = MessageRoom.new(message_room_params)

    respond_to do |format|
      if @message_room.save
        format.html { redirect_to @message_room, notice: 'Message room was successfully created.' }
        format.json { render :show, status: :created, location: @message_room }
      else
        format.html { render :new }
        format.json { render json: @message_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /message_rooms/1
  # PATCH/PUT /message_rooms/1.json
  def update
    respond_to do |format|
      if @message_room.update(message_room_params)
        format.html { redirect_to @message_room, notice: 'Message room was successfully updated.' }
        format.json { render :show, status: :ok, location: @message_room }
      else
        format.html { render :edit }
        format.json { render json: @message_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /message_rooms/1
  # DELETE /message_rooms/1.json
  def destroy
    @message_room.destroy
    respond_to do |format|
      format.html { redirect_to message_rooms_url, notice: 'Message room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def ajax_message
    @message = Message.new( body: params[:body],
                            user_id: params[:user_id],
                            message_room_id: params[:id])
    if @message.save
      ActionCable.server.broadcast 'messages',
        message: render_message(@message),
        room_id: @message.message_room_id
    end
  end

  def subscribe
    @subscription = Subscription.where(user_id: params[:user_id], message_room_id: params[:message_room_id])[0]

    # delete if subscription exists and create if it doesn't
    if @subscription
      @subscription.delete
    else
      Subscription.create(user_id: params[:user_id], message_room_id: params[:message_room_id])
    end

    # If the user subscribes on the page, redirect to page
    if params[:redirect_to_page]
      redirect_to "/message_rooms/#{params[:message_room_id]}"
      flash[:notice] = "you subscribed to this page!"
    else
      @my_rooms = current_user.message_rooms.index_by(&:id)
      respond_to :js
    end
  end

  private

    def set_message_room
      @message_room = MessageRoom.find(params[:id])
    end

    def message_room_params
      params.require(:message_room).permit(:title, :blurb, :creator_id)
    end

    # render comment for action cable function in #ajax_message
    def render_message(message)
        ApplicationController.render(partial: 'message_rooms/message',
                                     locals: { message: message, user: message.user })
    end

end
