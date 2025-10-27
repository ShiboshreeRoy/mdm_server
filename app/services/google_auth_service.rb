require 'googleauth'

class GoogleAuthService
  SCOPES = ['https://www.googleapis.com/auth/androidmanagement','https://www.googleapis.com/auth/cloud-platform']

  def self.get_token(service_account_path)
    authorizer = Google::Auth::ServiceAccountCredentials.make_creds(
      json_key_io: File.open(service_account_path),
      scope: SCOPES
    )
    authorizer.fetch_access_token!['access_token']
  end
end
