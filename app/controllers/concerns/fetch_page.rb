# frozen_string_literal: true

module FetchPage
  extend ActiveSupport::Concern

  module ClassMethods
    def fetch_page(params)
      page = params.fetch(:page, 1)
      per_page = params.fetch(:per_page, 20)

      page(page).per(per_page)
    end
  end
end
