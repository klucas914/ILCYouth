class CreateCheckIns < ActiveRecord::Migration[5.0]
  def change
    create_table :check_ins do |t|
    	t.belongs_to :student, foreign_key: true, null: false
    	t.belongs_to :event,   foreign_key: true, null: false
    	t.timestamps
    end

    create_table :events_students do |t|
    	t.belongs_to :student, foreign_key: true, null: false
    	t.belongs_to :event,   foreign_key: true, null: false
    end
  end
end
