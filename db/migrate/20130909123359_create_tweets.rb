class CreateTweets < ActiveRecord::Migration
  def change
      create_table :tweets do |t|
        t.references :twitter_user
        t.text :text

        t.timestamps
      end
  end
end
