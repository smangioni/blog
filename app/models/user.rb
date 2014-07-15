class User < ActiveRecord::Base

  validates_presence_of :password_hash, :on => :create
  validates_presence_of :email, :on => :create

  before_save :encrypt_password

  def self.authenticate(email, password)
    @user = where(email: email, password_hash: Digest::MD5.digest(password)).first
    if @user
      @user.id
    end
  end

  private

  def encrypt_password
    unless self.password_hash.blank?
      self.password_hash = Digest::MD5.digest(self.password_hash).force_encoding("utf-8")
    end
  end

end
