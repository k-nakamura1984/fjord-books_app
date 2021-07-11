# frozen_string_literal: true

class ChangeDatatypePostcodeOfUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :postcode, :string
  end
end
