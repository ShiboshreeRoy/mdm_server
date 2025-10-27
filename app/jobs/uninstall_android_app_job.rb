class UninstallAndroidAppJob < ApplicationJob
  queue_as :default

  def perform(enterprise_id, device_id, package_name)
    ent = Enterprise.find(enterprise_id)
    service = AndroidManagementService.new(enterprise: ent, service_account_path: ent.credentials['service_account_path'])
    policy_name = "enterprises/#{ent.name}/policies/default"
    service.uninstall_app(policy_name: policy_name, package_name: package_name)
  end
end
