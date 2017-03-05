class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
    	t.string :image
    	t.datetime :datetime
    	t.timestamps
    end

    reversible do |dir|
      dir.up do
        Event.create_translation_table! :title => :string, :text => :text
      end

      dir.down do 
        Event.drop_translation_table!
      end
    end
  end
end
