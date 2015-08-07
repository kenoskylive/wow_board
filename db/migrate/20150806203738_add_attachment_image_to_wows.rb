class AddAttachmentImageToWows < ActiveRecord::Migration
  def self.up
    change_table :wows do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :wows, :image
  end
end
