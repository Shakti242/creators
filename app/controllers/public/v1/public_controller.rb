module Public
  module V1
    class PublicController < ApplicationController
      def hello
        render json: { message: "Hello, world!" }, status: :ok
      end
    end
  end
end
