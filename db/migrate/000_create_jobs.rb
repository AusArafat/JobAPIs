class CreateJobs < ActiveRecord::Migration[7.1]

  def up
    create_table :jobs do |t|
      #t.column :id, :integer, :null => false
      t.column :JobName, :string
      t.string :JobDescription
    end



  end

  def self.down
    drop_table :jobs
  end

end
