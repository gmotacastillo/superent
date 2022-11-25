require "date"

class DashboardController < ApplicationController
  def show
    @my_cars = current_user.cars
    @my_bookings = current_user.bookings
    @my_received_bookings = current_user.received_bookings
    @my_requested_bookings = current_user.bookings.order("start_date")
    @my_old_bookings = @my_requested_bookings.reject { |booking| booking.end_date.after?(Date.today)}
    @my_current_bookings = @my_requested_bookings.pending.reject{ |booking| booking.start_date.before?(Date.today)}
  end
end
