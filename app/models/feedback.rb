class Feedback < ApplicationRecord
  # 🚅 add concerns above.

  store_accessor :data, :request_uuid, :request_method, :request_params, :user_agent, :remote_ip
  # 🚅 add attribute accessors above.

  belongs_to :team, inverse_of: :feedback
  belongs_to :giver, class_name: "Membership", inverse_of: :feedback, optional: true
  # 🚅 add belongs_to associations above.

  # 🚅 add has_many associations above.

  has_rich_text :user_feedback
  # 🚅 add has_one associations above.

  # 🚅 add scopes above.

  #validates :giver, scope: true
  # 🚅 add validations above.

  # 🚅 add callbacks above.

  # 🚅 add delegations above.

  def valid_givers
    Membership.all
  end

  def label_string
    giver&.name || "Unknown Member"
  end

  # 🚅 add methods above.
end
