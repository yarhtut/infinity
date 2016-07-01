class AddProjectIdToJob < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :project_id, :integer
  end
end
