class AddNameToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :name, :string
  end

  User.all do |user|
  	user.update(name: "Jane Doe") unless user.name
  end
end
