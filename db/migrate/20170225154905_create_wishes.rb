class CreateWishes < ActiveRecord::Migration[5.0]
  def change
    create_table :wishes do |t|
      t.string :toy
      t.integer :user_id
      t.integer :elf_id
      t.integer :build_time
      t.string :status
      t.date :due_date
    end
  end
end
