# frozen_string_literal: true

class CreateScreenings < ActiveRecord::Migration[6.1]
  def change
    create_table :screenings do |t|
      t.datetime :date, null: false
      t.references :cinema_hall, null: false

      t.timestamps
    end
  end
end
