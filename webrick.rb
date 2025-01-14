 # webrick.rb
require 'webrick'

server = WEBrick::HTTPServer.new({ 
  :DocumentRoot => './',
  :BindAddress => '127.0.0.1',
  :Port => 8000
})

 server.mount_proc("/form_get") do |req, res|
 body = 
 "<html><meta charset='UTF-8'>
  <body>
   クエリパラメータは#{req.query}です<br>
   こんにちは#{req.query['username']}さん。
   あなたの年齢は#{req.query['age']}ですね
  </body>
</html>"
 res.status = 200
 res['Content-Type'] = 'text/html'
 res.body = body
end

server.mount_proc("/form_post") do |req, res|
 body = 
 "<html><meta charset='UTF-8'>
  <body>
   フォームデータは#{req.query}です<br>
   こんにちは#{req.query['username']}さん。
   あなたの年齢は#{req.query['age']}ですね
  </body>
</html>"
 res.status = 200
 res['Content-Type'] = 'text/html'
 res.body = body
end

server.start

