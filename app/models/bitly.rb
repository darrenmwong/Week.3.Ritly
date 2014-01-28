# == Schema Information
#
# Table name: bitlies
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  random     :string(255)
#  url        :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Bitly < ActiveRecord::Base
end
