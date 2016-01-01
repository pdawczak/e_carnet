class User < ActiveRecord::Base
  # override default `type` column that is used in single-table inheritance
  self.inheritance_column = "t"

  has_secure_password

  scope :clients,       -> { where(type: "client") }
  scope :professionals, -> { where(type: "professional") }

  enum type: { client:       "client",
               professional: "professional" }

  class << self
    def new_client(attrs = {})
      attrs[:type] = "client"
      new(attrs)
    end

    def new_professional(attrs = {})
      attrs[:type] = "professional"
      new(attrs)
    end
  end
end
