# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base
  validates_presence_of :name
  validates :password,
    :length => {:minimum => 8}
  validates_confirmation_of :password
  validates_uniqueness_of :name, :allow_blank => true  
  attr_accessor :password, :password_confirmation
  
  #ハッシュパスワードとソルトを設定する
  def password=(val)
    @password = val
    return unless val and val.size > 0
    self.salt = rand(7777777)
    self.hashed_password = User.hashed_password(val,salt)
  end
  
  #パスワードを暗号化する
  def self.hashed_password(password,salt)
    Digest::SHA1.hexdigest(sprintf("%s08d", password, salt))
  end
  
  #認証を行う
  def self.authenticate(name,password)
    user = User.find_by_name(name)
    if user and user.hashed_password == User.hashed_password(password, user.salt)
      user
    else
      nil
    end
  end
  
end
