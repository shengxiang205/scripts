gem "stream_support"




include StreamSupport


stream.read({:droplets => [
	{:key => {:category_type => "", :category_sku => "sjfkdaj"}}
]})


[{
	key  {}
	value = {}
	uuid ""
}]

stream.write({
	:droplets => [
		{ :key => {}, :value => {}, :uuid => "" },
		{ :key => {}, :value => {} }
	]
})

require 'net/http'
uri = URI("http://127.0.0.1:4000")
http = Net::HTTP.new(uri.host, uri.port)
require 'json'

require 'net/http'
uri = URI("http://192.168.10.1:40001")
http = Net::HTTP.new(uri.host, uri.port)
require 'json'

touch tmp/restart.txt; touch /home/joowing/http/current/app_documents/device_manager/JWP-IPAD2-12040006/mountable_http_server/tmp/restart.txt ;touch /home/joowing/http/current/app_documents/device_manager/JWP-IPAD2-12040025/mountable_http_server/tmp/restart.txt 
rm -rf tmp/cache; touch /home/joowing/http/current/app_documents/device_manager/JWP-IPAD2-12040006/mountable_http_server/tmp/restart.txt ;touch /home/joowing/http/current/app_documents/device_manager/JWP-IPAD2-12040025/mountable_http_server/tmp/restart.txt
response = http.post("/shopping_cart/carts/add.json", {"cart_item" => { :category_type => "test", :category_sku => "123", :size => "s" }}.to_json, {'Content-Type' => 'application/json'})
response = http.post("/shopping_cart/carts/submit.json", {}.to_json, {'Content-Type' => 'application/json'})
response = http.post("/shopping_cart/orders/2/order_items/2", {"_method" => "delete"}.to_json, {'Content-Type' => 'application/json'})

response = http.post("/shopping_cart/orders/4/pay.json", {"order" => { "customer_phone" => "123", "customer_address" => "xxx" }}.to_json, {'Content-Type' => 'application/json'})
response = http.post("/shopping_cart/orders/4/close.json", {"order" => { "customer_phone" => "123", "customer_address" => "xxx" }}.to_json, {'Content-Type' => 'application/json'})

response = http.post("/shopping_cart/favorites/add", {"favorite" => { "category_type" => "123", "category_sku" => "xxx" }}.to_json, {'Content-Type' => 'application/json'})

response = http.post("/shopping_cart/favorites.json", {"favorite" => { "category_type" => "服饰", "category_sku" => "M12F100012" }}.to_json, {'Content-Type' => 'application/json'})
response = http.post("/shopping_cart/favorites.json", {"favorite" => { "category_type" => "服饰", "category_sku" => "M12F000025" }}.to_json, {'Content-Type' => 'application/json'})
response = http.post("/shopping_cart/favorites.json", {"favorite" => { "category_type" => "服饰", "category_sku" => "M12F000026" }}.to_json, {'Content-Type' => 'application/json'})
response = http.post("/shopping_cart/favorites.json", {"favorite" => { "category_type" => "服饰", "category_sku" => "M12F100013" }}.to_json, {'Content-Type' => 'application/json'})
response = http.post("/shopping_cart/favorites.json", {"favorite" => { "category_type" => "服饰", "category_sku" => "M12F100014" }}.to_json, {'Content-Type' => 'application/json'})
response = http.post("/shopping_cart/favorites.json", {"favorite" => { "category_type" => "服饰", "category_sku" => "M12F100009" }}.to_json, {'Content-Type' => 'application/json'})
response = http.post("/shopping_cart/favorites.json", {"favorite" => { "category_type" => "服饰", "category_sku" => "M12F100010" }}.to_json, {'Content-Type' => 'application/json'})
response = http.post("/shopping_cart/favorites.json", {"favorite" => { "category_type" => "服饰", "category_sku" => "M12F000023" }}.to_json, {'Content-Type' => 'application/json'})
response = http.post("/shopping_cart/favorites.json", {"favorite" => { "category_type" => "服饰", "category_sku" => "M12F000019" }}.to_json, {'Content-Type' => 'application/json'})
response = http.post("/shopping_cart/favorites.json", {"favorite" => { "category_type" => "服饰", "category_sku" => "M12F000020" }}.to_json, {'Content-Type' => 'application/json'})
response = http.post("/shopping_cart/favorites.json", {"favorite" => { "category_type" => "服饰", "category_sku" => "M12F000021" }}.to_json, {'Content-Type' => 'application/json'})

response = http.post("/shopping_cart/carts/add.json", {"cart_item" => { "category_type" => "服饰", "category_sku" => "M12F100012", "size" => "s" }}.to_json, {'Content-Type' => 'application/json'})
response = http.post("/shopping_cart/carts/add.json", {"cart_item" => { "category_type" => "服饰", "category_sku" => "M12F000025", "size" => "s" }}.to_json, {'Content-Type' => 'application/json'})
response = http.post("/shopping_cart/carts/add.json", {"cart_item" => { "category_type" => "服饰", "category_sku" => "M12F000026", "size" => "s" }}.to_json, {'Content-Type' => 'application/json'})
response = http.post("/shopping_cart/carts/add.json", {"cart_item" => { "category_type" => "服饰", "category_sku" => "M12F100013", "size" => "s" }}.to_json, {'Content-Type' => 'application/json'})
response = http.post("/shopping_cart/carts/add.json", {"cart_item" => { "category_type" => "服饰", "category_sku" => "M12F100014", "size" => "s" }}.to_json, {'Content-Type' => 'application/json'})
response = http.post("/shopping_cart/carts/add.json", {"cart_item" => { "category_type" => "服饰", "category_sku" => "M12F100010", "size" => "s" }}.to_json, {'Content-Type' => 'application/json'})
response = http.post("/shopping_cart/carts/add.json", {"cart_item" => { "category_type" => "服饰", "category_sku" => "M12F000023", "size" => "s" }}.to_json, {'Content-Type' => 'application/json'})
response = http.post("/shopping_cart/carts/add.json", {"cart_item" => { "category_type" => "服饰", "category_sku" => "M12F000019", "size" => "s" }}.to_json, {'Content-Type' => 'application/json'})
response = http.post("/shopping_cart/carts/add.json", {"cart_item" => { "category_type" => "服饰", "category_sku" => "M12F000020", "size" => "s" }}.to_json, {'Content-Type' => 'application/json'})
response = http.post("/shopping_cart/carts/add.json", {"cart_item" => { "category_type" => "服饰", "category_sku" => "M12F000021", "size" => "s" }}.to_json, {'Content-Type' => 'application/json'})

