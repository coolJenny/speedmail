class KeywordgroupsController < ApplicationController
  before_action :set_keywordgroup, only: [:show, :edit, :update, :destroy]

  # GET /keywordgroups
  # GET /keywordgroups.json
  def index
    @keywordgroups = Keywordgroup.all
  end

  # GET /keywordgroups/1
  # GET /keywordgroups/1.json
  def show
  end

  # GET /keywordgroups/new
  def new
    @keywordgroup = Keywordgroup.create!(user_id: current_user.id)
    render 'create'
  end

  # GET /keywordgroups/1/edit
  def edit
    @keywordgroup = Keywordgroup.create!(user_id: current_user.id)
  end

  # POST /keywordgroups
  # POST /keywordgroups.json
  def create
    # @keywordgroup = Keywordgroup.new(keywordgroup_params)

    # respond_to do |format|
    #   if @keywordgroup.save
    #     format.html { redirect_to @keywordgroup, notice: 'Keywordgroup was successfully created.' }
    #     format.json { render :show, status: :created, location: @keywordgroup }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @keywordgroup.errors, status: :unprocessable_entity }
    #   end
    # end

    if params[:action_info] == 'keyword'
      @keyword = Keyword.new(keywordgroup_params)
      @keyword.keyword_name = params[:keyword_val]
      # @keyword.user_id = current_user.id
      @keyword.keywordgroup_id = @keywordgroup.id
      
      if @keyword.save
        flash[:notice] = "Keyword was successfully created!"
        redirect_back(fallback_location: root_path)
      else
        flash[:error] = "Failed creating keyword."
        redirect_back(fallback_location: root_path)
      end
    end

    if params[:action_info] == 'recipient'
      @greeting = Greeting.new(keywordgroup_params)
      @greeting.recipient_name = params[:name]
      @greeting.email = params[:email]
      @greeting.cc_state = params[:cc_state]
      # @greeting.user_id = current_user.id
      @greeting.keywordgroup_id = @keywordgroup.id
      
      if @greeting.save
        flash[:notice] = "Recipient was successfully created!"
        redirect_back(fallback_location: root_path)
      else
        flash[:error] = "Failed creating recipient."
        redirect_back(fallback_location: root_path)
      end
    end
  end

  # PATCH/PUT /keywordgroups/1
  # PATCH/PUT /keywordgroups/1.json
  def update
    respond_to do |format|
      if @keywordgroup.update(keywordgroup_params)
        format.html { redirect_to @keywordgroup, notice: 'Keywordgroup was successfully updated.' }
        format.json { render :show, status: :ok, location: @keywordgroup }
      else
        format.html { render :edit }
        format.json { render json: @keywordgroup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /keywordgroups/1
  # DELETE /keywordgroups/1.json
  def destroy
    @keywordgroup.destroy
    respond_to do |format|
      format.html { redirect_to keywordgroups_url, notice: 'Keywordgroup was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_keywordgroup
      @keywordgroup = Keywordgroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def keywordgroup_params
      params.fetch(:keywordgroup, {})
    end
end
