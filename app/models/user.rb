class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Sorcery::Model

  authenticates_with_sorcery!

  field :email, type: String

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true
end
