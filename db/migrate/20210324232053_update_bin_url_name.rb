class UpdateBinUrlName < ActiveRecord::Migration[6.0]
  def change
    add_column :bins, :webhook_url, :string
  end
end
