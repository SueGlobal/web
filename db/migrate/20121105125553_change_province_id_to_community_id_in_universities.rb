class ChangeProvinceIdToCommunityIdInUniversities < ActiveRecord::Migration
  def up
    rename_column :universities, :province_id, :community_id
  end

  def down
    rename_column :universities, :community_id, :province_id
  end
end
