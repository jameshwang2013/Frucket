class EventsController < ApplicationController
	before_action :set_bucket
	before_action :set_event, except: [:create]

	def create
		@event = @bucket.events.create(event_params)
		redirect_to @bucket
	end

	def destroy
		if @event.destroy
			flash[:success] = "Event was deleted."
		else
			flash[:error] = "Event item could not be deleted."
		end
		redirect_to @bucket
	end

	def complete
		@event.update_attribute(:completed_at,Time.now)
		redirect_to @bucket, notice: "Event completed!"
	end

	private

	def set_bucket
		@bucket = Bucket.find(params[:bucket_id])
	end

	def set_event
		@event = @bucket.events.find(params[:id])
	end

	def event_params
		params[:event].permit(:content)
	end

end
