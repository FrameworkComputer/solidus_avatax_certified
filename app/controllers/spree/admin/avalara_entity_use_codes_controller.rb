# frozen_string_literal: true

module Spree
  module Admin
    class AvalaraEntityUseCodesController < Spree::Admin::ResourceController
      def index
        @avalara_entity_use_codes = Spree::AvalaraEntityUseCode.all

        respond_to do |format|
          format.html
          format.json { render json: @avalara_entity_use_codes }
        end
      end

      private

      def permitted_resource_params
        params.require(:avalara_entity_use_code).permit(:use_code, :use_code_description)
      end
    end
  end
end
