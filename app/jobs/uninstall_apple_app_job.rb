class UninstallAppleAppJob < ApplicationJob
  queue_as :default

  def perform(device_id, bundle_id)
    device = Device.find(device_id)
    service = AppleMdmService.new(enterprise: device.enterprise)
    service.queue_remove_application(device_id: device.id, bundle_id: bundle_id)
    # APNs push to device happens asynchronously
  end
end
