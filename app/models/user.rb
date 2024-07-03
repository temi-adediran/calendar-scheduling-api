class User < ApplicationRecord
  belongs_to :memberable, polymorphic: true

  validates_presence_of :email, :phone_no, :name
  validates_uniqueness_of :phone_no
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end

# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string
#  name            :string
#  phone_no        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  memberable_id   :bigint
#  memberable_type :string
#
# Indexes
#
#  index_users_on_memberable  (memberable_type,memberable_id)
#
