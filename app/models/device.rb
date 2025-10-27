class Device < ApplicationRecord
  belongs_to :enterprise
  # device_id: unique id returned during enrollment
end
