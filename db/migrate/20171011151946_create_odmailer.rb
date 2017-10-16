class CreateOdmailer < ActiveRecord::Migration[4.2]
  def change
    create_table :spree_odmailers do |t|
      t.string :email
    end
  end
    def self.down
    drop_table :odmailers
  end
end
