class MeetingsController < ApplicationController
  def index
    if params[:tag]
      @meetings = Tag.find_by(name: params[:tag]).meetings
    else
      @meetings = Meeting.all
    end
    render 'index.html.erb'
  end

  def show
    @meeting = Meeting.find_by(id: params[:id])
    render 'show.html.erb'
  end

  def new
    @meeting = Meeting.new
    render 'new.html.erb'
  end

  def create
    # make the new meeting
    @meeting = Meeting.new(
      notes: params[:notes] ,
      address: params[:address] ,
      name: params[:name] ,
      start_time: params[:start_time] ,
      end_time: params[:end_time]
    )
    if @meeting.save
      if params[:tag_ids]
         params[:tag_ids].each do |tag_id|
          MeetingTag.create(
            meeting_id: @meeting.id,
            tag_id: tag_id
          )
        end
      end
      flash[:success] = "You totally just made a new meeting"
      redirect_to "/meetings/#{@meeting.id}"
    else
      render 'new.html.erb'
    end

  end

  def edit
    @meeting = Meeting.find_by(id: params[:id])
    render 'edit.html.erb'
  end

  def update
    @meeting = Meeting.find_by(id: params[:id])
    if @meeting.update(
      name: params[:name],
      address: params[:address],
      start_time: params[:start_time],
      end_time: params[:end_time],
      notes: params[:notes]
    )
      flash[:success] = "Meeting successfully updated!"
      redirect_to "/meetings/#{@meeting.id}"
    else
      render 'edit.html.erb'
    end
  end

end
