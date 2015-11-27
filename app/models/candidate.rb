class Candidate < ActiveRecord::Base

has_attached_file :pdf,
    :storage => :s3,
    :s3_credentials => "#{::Rails.root.to_s}/config/s3.yml",
    :path => "/userpdfs/:id/:basename.:extension"


validates_attachment_content_type :pdf, :content_type => ['application/pdf', 'application/msword', 'text/plain'], :if => :pdf_attached?

def pdf_attached?
  self.pdf.file?
end

end
