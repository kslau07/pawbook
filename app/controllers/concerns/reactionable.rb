# frozen_string_literal: true

module Reactionable
  extend ActiveSupport::Concern

  included do
    # TODO: Add scopes
    has_many :reactions, as: :reactionable, dependent: :destroy
  end
end
