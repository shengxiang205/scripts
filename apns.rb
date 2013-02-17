#encoding: utf-8
require 'rubygems'
require 'apns'
require 'irb'

# device_token = '0529c38f 8c9db702 a122c991 a6c067ae ef91b1a5 3b9e1f84 9f4c5d10 a684e14a'.gsub(' ', "")
# device_token = 'abf1d065 bf6326e1 6d05d246 90c9d54f f34fda8b c2b5a437 7157b807 f28ba01f'.gsub(' ', "")

# device_token = 'ABF1D065BF6326E16D05D24690C9D54FF34FDA8BC2B5A4377157B807F28BA01F'
device_token = '4BE1BAC7D672D3E7E5F6D3265BDD93E0FCE7092DB47110C984097B3C46210F4D' # 狒狒
# device_token = '0529c38f 8c9db702 a122c991 a6c067ae ef91b1a5 3b9e1f84 9f4c5d10 a684e14a'

APNS.host = 'gateway.push.apple.com'
# APNS.host = 'gateway.sandbox.push.apple.com'
# gateway.sandbox.push.apple.com is default

# openssl pkcs12 -in push_nebula_production.p12 -out push_nebula_production.pem -nodes -clcerts
# APNS.pem  = '/Users/killyfreedom/Documents/push.pem'
APNS.pem  = '/Users/killyfreedom/Documents/push_nebula_production.pem'
# this is the file you just created
APNS.port = 2195


# APNS.send_notification(device_token, 'Hello iPhone!' )
n2 = APNS::Notification.new(device_token, :alert => '您有新的门店申请.', :badge => 1, :sound => 'default')
# n1 = APNS::Notification.new(device_token, :alert => '您有.', :badge => 1, :sound => 'default')
APNS.send_notifications([n2])

# IRB.start


