 # webrick.rb
require 'webrick'

server = WEBrick::HTTPServer.new({ 
  :DocumentRoot => './',
  :BindAddress => '127.0.0.1',
  :Port => 8000
})

server.mount_proc("/time") do |req, res|
  # レスポンス内容を出力
  time = Time.now
  body = "<html><body>#{time}</body></html>"
  res.status = 200
  res['Content-Type'] = 'text/html'
  res.body = body
end

server.start

