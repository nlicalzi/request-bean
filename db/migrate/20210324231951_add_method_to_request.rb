class AddMethodToRequest < ActiveRecord::Migration[6.0]
  def change
    add_column :requests, :http_method, :string
  end
end
