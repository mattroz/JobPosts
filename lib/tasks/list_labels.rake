require 'pp'
task :list_labels => :environment do
  client = Google::APIClient.new
  client.authorization.access_token = User.last.fresh_token
  service = client.discovered_api('gmail', 'v1')
  result = client.execute(
    :api_method => service.users.messages.list,
    :parameters => {'userId' => 'me', 'q' => "subject: CRACK"},
    :headers => {'Content-Type' => 'application/json'})
  pp JSON.parse(result.body)
end