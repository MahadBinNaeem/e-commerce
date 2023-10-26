class CreateDefaultRoles < ActiveRecord::Migration[7.0]
  def up
    Role.create(name: 'admin')
    Role.create(name: 'staff')
    Role.create(name: 'customer')
  end

  def down
    Role.where(name: ['admin', 'staff', 'customer']).destroy_all
  end
end
