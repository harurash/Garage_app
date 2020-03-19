class AddIndexToTweets < ActiveRecord::Migration[5.2]
  def change
    add_index :tweets, :body, length: 32
  end
end
