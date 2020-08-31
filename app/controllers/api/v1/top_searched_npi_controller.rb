module Api
  module V1
    class TopSearchedNpiController < Api::V1::BaseController

      def index
        people = Person.where('search_count >?', params[:npi_count])
        if people.blank?
          render json: {
            result_count: 0, results: {}
          }, status: :ok
        else
          render json: { result_count: people.count, results: people.all.pluck(:response)  }, status: :ok
        end
      end

      def npi_params
        params.permit(:search_count)
      end
    end
  end
end
