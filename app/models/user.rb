class User < ActiveRecord::Base
  # override default `type` column that is used in single-table inheritance
  self.inheritance_column = "t"

  has_secure_password

  scope :clients, -> { where(type: "client") }

  enum type: { client: "client" }

  class << self
    def new_client(attrs = {})
      attrs[:type] = "client"
      new(attrs)
    end
  end
end
