class AppleMdmService
  def initialize(enterprise:)
    @enterprise = enterprise
  end

  # Queue RemoveApplication command
  def queue_remove_application(device_id:, bundle_id:)
    Command.create!(
      device_id: device_id,
      command_type: 'RemoveApplication',
      payload: {'Identifier'=>bundle_id},
      status: 'queued'
    )
  end

  # Implement APNs push and device check-in elsewhere
end
