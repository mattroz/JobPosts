require 'net/http'
require 'json'
 
class Token < ActiveRecord::Base
has_one :user
 

 
end
