class Coach < ApplicationRecord
  has_one :user, as: :memberable
  has_many :bookings
end

# == Schema Information
#
# Table name: coaches
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
