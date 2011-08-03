# == Schema Information
# Schema version: 1
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  attr_accessible :name, :email

  validates :name, :presence => true

  validates :email, :presence => true,
                    :format => { :with => /\A.+@.+\Z/i }

  has_many :microposts, :dependent => :destroy

  class << self

    def authenticate(email)
      user = find_by_email(email)
    end

    def authenticate_with_token(token)
      user = find_by_id(token)
    end

  end


end
