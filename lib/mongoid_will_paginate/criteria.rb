require 'will_paginate/collection'

module MongoidWillPaginate
  module Criteria
    def self.extended(base)
      base.include InstanceMethods
    end

    module InstanceMethods
      # Paginates criteria depending on the options given
      #
      # @param [Hash] options pagination options
      # @option options [Fixnum] :page page number
      # @option options [Fixnum] :per_page number of entries per page
      # @option options [Fixnum] :total_entries total number of entries
      # @return [WillPaginate::Collection] paginated collection of entries
      def paginate(options = {})
        page = options[:page] || 1
        per_page = options[:per_page] || WillPaginate.per_page
        total = options[:total_entries] || count

        WillPaginate::Collection.create(page, per_page, total) do |pager|
          col = skip(pager.offset).limit(pager.per_page).to_a
          pager.replace(col)
        end
      end
    end
  end
end
