class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.text :content, null: false
      t.references :users, index: true
      t.timestamps
    end
  end
end
