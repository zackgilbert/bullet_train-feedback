# Api::V1::ApplicationController is in the starter repository and isn't
# needed for this package's unit tests, but our CI tests will try to load this
# class because eager loading is set to `true` when CI=true.
# We wrap this class in an `if` statement to circumvent this issue.
if defined?(Api::V1::ApplicationController)
  class Api::V1::FeedbackController < Api::V1::ApplicationController
    account_load_and_authorize_resource :feedback, through: :team, through_association: :feedback

    # GET /api/v1/teams/:team_id/feedback
    def index
    end

    # GET /api/v1/feedback/:id
    def show
    end

    # POST /api/v1/teams/:team_id/feedback
    def create
      if @feedback.save
        render :show, status: :created, location: [:api, :v1, @feedback]
      else
        render json: @feedback.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /api/v1/feedback/:id
    def update
      if @feedback.update(feedback_params)
        render :show
      else
        render json: @feedback.errors, status: :unprocessable_entity
      end
    end

    # DELETE /api/v1/feedback/:id
    def destroy
      @feedback.destroy
    end

    private

    module StrongParameters
      # Only allow a list of trusted parameters through.
      def feedback_params
        strong_params = params.require(:feedback).permit(
          *permitted_fields,
          :giver_id,
          :url,
          :user_feedback,
          :request_uuid,
          :request_method,
          :request_params,
          :user_agent,
          :remote_ip,
          # 🚅 super scaffolding will insert new fields above this line.
          *permitted_arrays,
          # 🚅 super scaffolding will insert new arrays above this line.
        )

        process_params(strong_params)

        strong_params
      end
    end

    include StrongParameters
  end
else
  class Api::V1::FeedbackController
  end
end
