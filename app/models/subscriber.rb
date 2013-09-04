class Subscriber
  include Mongoid::Document

  field :email, type: String
  validates :email, format: { with: /^.+@.+$/ }
  validates :email, uniqueness: true
end
