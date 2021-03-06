# frozen_string_literal: true

class CreateEntities < ActiveRecord::Migration[6.0]
  def change
    create_table :entities do |t|
      t.string :name

      t.timestamps
    end
    add_index :entities, 'lower(name)', name: 'index_entities_on_lower_name', unique: true
  end
end
