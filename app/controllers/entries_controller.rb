class EntriesController < ApplicationController
  # GET /entries
  # GET /entries.json
  before_filter :authorize
  
  def index
    # raise params.inspect
    @entries = current_user.entries

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @entries }
    end
  end

  def from_today
    # raise params.inspect
    @entries = current_user.entries.find(:all, :conditions => [" created_at between ? AND ?", Time.zone.now.beginning_of_day, Time.zone.now.end_of_day])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @entries }
    end
  end


  # GET /entries/1
  # GET /entries/1.json
  def show
    @entry = Entry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @entry }
    end
  end

  # GET /entries/new
  # GET /entries/new.json
  def new
    # raise params.inspect

    @commitment = current_user.next_commitment
    @entry = current_user.entries.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @entry }
    end
  end

  # GET /entries/1/edit
  def edit
    @entry = Entry.find(params[:id])
  end

  # POST /entries
  # POST /entries.json
  def create
    # raise params.inspect
    @entry = current_user.entries.new(params[:entry])

    respond_to do |format|
      if @entry.save
        format.html { redirect_to from_today_entries_path, notice: 'Entry was successfully created.' }
        format.json { render json: @entry, status: :created, location: @entry }
      else
        format.html { render action: "new" }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /entries/1
  # PUT /entries/1.json
  def update
    @entry = Entry.find(params[:id])

    respond_to do |format|
      if @entry.update_attributes(params[:entry])
        format.html { redirect_to @entry, notice: 'Entry was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1
  # DELETE /entries/1.json
  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy

    respond_to do |format|
      format.html { redirect_to entries_url }
      format.json { head :no_content }
    end
  end
end
