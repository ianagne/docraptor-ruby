require 'bundler/setup'
Bundler.require
require 'open-uri'

DocRaptor.configure do |dr|
  dr.username = 'YOUR_API_KEY_HERE'
  # dr.debugging = true
end

$docraptor = DocRaptor::DocApi.new

output_file = 'expire-hosted-ruby-sync.pdf'

output_payload = $docraptor.create_hosted_async_doc(
  test: true,
  document_content: '<html><body>Hello from Ruby</body></html>',
  name: output_file,
  document_type: 'pdf',
  hosted_expires_at: (Time.now + 86_400).strftime('%FT%T%:z') # 1 day from now
)

status_response = nil
30.times do
  status_response = $docraptor.get_async_doc_status(output_payload.status_id)
  break if status_response.status == 'completed'

  sleep 1
end

actual_document = URI.open status_response.download_url
IO.copy_stream(actual_document, output_file)

output_type = `file -b #{output_file}`
File.delete output_file

raise 'Output was not a PDF' unless output_type.start_with?('PDF')

$docraptor.expire(status_response.download_id)

begin
  actual_document = URI.open status_response.download_url
rescue OpenURI::HTTPError => e
  exit 0
end

exit 1
