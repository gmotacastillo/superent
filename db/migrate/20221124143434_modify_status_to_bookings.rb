class ModifyStatusToBookings < ActiveRecord::Migration[7.0]
  def change
    change_column_default :bookings, :status, from: nil, to: false
  end
end
