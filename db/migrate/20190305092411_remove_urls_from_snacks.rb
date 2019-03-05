class RemoveUrlsFromSnacks < ActiveRecord::Migration[5.2]
  def change
    remove_column :snacks, :url
    remove_column :snacks, :title
    remove_column :snacks, :pdf_version
    remove_column :snacks, :page_count
  end
end
