class PingController < ApplicationController
	$start_time = Time.now.strftime("[%d %B %Y] %H:%M:%S %Z")
	def index
  		render json: { message: "PONG", "start_time": $start_time }, status: :ok
 	end
end
