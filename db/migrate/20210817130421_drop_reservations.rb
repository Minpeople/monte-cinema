# frozen_string_literal: true

class DropReservations < ActiveRecord::Migration[6.1]
  def change
    drop_table :reservations
  end
end
