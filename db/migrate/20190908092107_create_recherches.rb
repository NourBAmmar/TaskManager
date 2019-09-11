class CreateRecherches < ActiveRecord::Migration[6.0]
  def change
    create_table :recherches do |t|
      t.string :keywords
      t.string :category

      t.timestamps
    end
  end
end
