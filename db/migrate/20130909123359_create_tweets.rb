class CreateTweets < ActiveRecord::Migration
  def change
      create_table :tweets do |t|
        t.references :twitteruser
        t.string :text
      end
  end
end