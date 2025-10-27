require 'net/http'
require 'json'

class AndroidManagementService
  BASE_URL = 'https://androidmanagement.googleapis.com/v1'

  def initialize(enterprise:, service_account_path:)
    @enterprise = enterprise
    @token = GoogleAuthService.get_token(service_account_path)
  end

  def uninstall_app(policy_name:, package_name:)
    policy = get_policy(policy_name)
    new_apps = (policy['applications'] || []).reject{|a| a['packageName']==package_name}
    uri = URI("#{BASE_URL}/#{policy_name}")
    req = Net::HTTP::Patch.new(uri)
    req['Authorization'] = "Bearer #{@token}"
    req['Content-Type'] = 'application/json'
    req.body = {applications: new_apps}.to_json
    res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true){|http| http.request(req)}
    JSON.parse(res.body)
  end

  def get_policy(policy_name)
    uri = URI("#{BASE_URL}/#{policy_name}")
    req = Net::HTTP::Get.new(uri)
    req['Authorization'] = "Bearer #{@token}"
    res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true){|http| http.request(req)}
    JSON.parse(res.body)
  end
end
