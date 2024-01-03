class Account::FeedbackController < Account::ApplicationController
  account_load_and_authorize_resource :feedback, through: :team, through_association: :feedback

  # GET /account/teams/:team_id/feedback
  # GET /account/teams/:team_id/feedback.json
  def index
    delegate_json_to_api
  end

  # GET /account/feedback/:id
  # GET /account/feedback/:id.json
  def show
    delegate_json_to_api
  end

  # GET /account/teams/:team_id/feedback/new
  def new
    render layout: false
  end

  # GET /account/feedback/:id/edit
  def edit
  end

  # POST /account/teams/:team_id/feedback
  # POST /account/teams/:team_id/feedback.json
  def create
    respond_to do |format|
      if @feedback.save
        format.html { redirect_to [:account, @feedback], notice: I18n.t("feedback.notifications.created") }
        format.json { render :show, status: :created, location: [:account, @feedback] }
        format.turbo_stream { flash.now[:notice] = I18n.t("feedback.notifications.created") }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /account/feedback/:id
  # PATCH/PUT /account/feedback/:id.json
  def update
    respond_to do |format|
      if @feedback.update(feedback_params)
        format.html { redirect_to [:account, @feedback], notice: I18n.t("feedback.notifications.updated") }
        format.json { render :show, status: :ok, location: [:account, @feedback] }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /account/feedback/:id
  # DELETE /account/feedback/:id.json
  def destroy
    @feedback.destroy
    respond_to do |format|
      format.html { redirect_to [:account, @team, :feedback], notice: I18n.t("feedback.notifications.destroyed") }
      format.json { head :no_content }
    end
  end

  private

  if defined?(Api::V1::ApplicationController)
    include strong_parameters_from_api
  end

  def process_params(strong_params)
    # 🚅 super scaffolding will insert processing for new fields above this line.
  end
end
