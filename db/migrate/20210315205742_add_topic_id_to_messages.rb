class AddTopicIdToMessages < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :topic_id, :integer
  end
end
