class Api::V1::EventsController < ApplicationController
      before_action :set_event, only: [:show, :destroy] 

      def index
        render json: Event.all
      end 

      def create
        @event= Event.create(event_params)
        if @event.save
          render json: @event, status: 201
        else
          render json: { errors: @event.errors.full_messages }, status: 422
        end
      end 

      def show
        render json: @event = Event.find(params[:id]) 
      end 

      def destroy
        @event.destroy
        render :show, status: :ok
      end 

      private
      def set_event
        @event = Event.find(params[:id])
      end 

      def event_params
        params.permit(:title, :description)
      end   
end