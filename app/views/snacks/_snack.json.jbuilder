json.extract! snack, :id, :url, :title, :pdf_version, :page_count, :created_at, :updated_at
json.url snack_url(snack, format: :json)
