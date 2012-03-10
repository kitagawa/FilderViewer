# -*- encoding : utf-8 -*-
class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :address
      t.string :name
      t.string :hashed_password #暗号化パスワード
      t.string :salt  #パスワード復号キー
      t.timestamps
    end
  end
end
