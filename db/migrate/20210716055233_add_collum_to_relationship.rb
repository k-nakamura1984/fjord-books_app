# frozen_string_literal: true

class AddCollumToRelationship < ActiveRecord::Migration[6.1]
  def change
    add_index :relationships, :followed_id
    add_index :relationships, %i[follower_id followed_id], unique: true
  end
end
