class UnreadMigration < ActiveRecord::Migration
  def self.up
    create_table :read_marks, :force => true do |t|
      t.integer  :readable_id
      t.integer  :member_id,     :null => false
      t.string   :readable_type, :null => false, :limit => 20
      t.datetime :timestamp
    end

    add_index :read_marks, [:member_id, :readable_type, :readable_id], 
              name: 'index_read_marks_on_member_id_and_readable'
  end

  def self.down
    drop_table :read_marks
  end
end
