# frozen_string_literal: true

class AddPolymorphicToComments < ActiveRecord::Migration[6.1]
  def change
    remove_index :comments, :report_id
    remove_column :comments, :report_id, integer
    add_reference :comments, :commentable, polymorphic: true
  end
end
