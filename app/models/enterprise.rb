class Enterprise < ApplicationRecord
  has_many :devices
  has_many :app_records
  validates :provider, presence: true # 'android' or 'apple'
  # credentials: for Android store service account json; for Apple store APNs cert info/paths (encrypted)
end
