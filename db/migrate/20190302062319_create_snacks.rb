class CreateSnacks < ActiveRecord::Migration[5.2]
  def change
    create_table :snacks do |t|
      t.string :url
      t.string :title
      t.string :pdf_version
      t.integer :page_count

      t.timestamps
    end
  end
end
