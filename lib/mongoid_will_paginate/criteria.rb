require 'will_paginate/collection'

module MongoidWillPaginate
  module Criteria
    extend ActiveSupport::Concern

    included do
      def paginate(options = {})
        page     = options[:page] || 1
        per_page = options[:per_page] || WillPaginate.per_page
        total    = options[:total_entries] || self.count

        WillPaginate::Collection.create(page, per_page, total) do |pager|
          pager.replace self.skip(pager.offset).limit(pager.per_page).to_a
        end
      end
    end
  end
end
