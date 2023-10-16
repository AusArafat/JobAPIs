class CreateJobApplications < ActiveRecord::Migration[7.1]
  def up
    create_table :job_applications do |t|
      t.string :status, default: 'Not_Seen'
      t.belongs_to :job, foreign_key: true
      t.belongs_to :user, foreign_key: true
    end
  end

  def self.down
    drop_table :job_applications
  end
end
