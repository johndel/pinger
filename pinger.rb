require "net/http"
require "uri"

@your_site = "http://fyta.gr"

def check_code(url)
  res = Net::HTTP.get_response(URI.parse(url.to_s))
  res.code.to_i
end

def write_log(status_code)
  log_file = File.open("disconnect.log", 'a')
  google_status_code = check_code("http://google.gr")
  if google_status_code == 301
     log_file.puts("#{Time.now}: #{@your_site} is down! status_code: #{status_code} - Google: #{google_status_code}")
  else
    log_file.puts("#{Time.now}: Internet connection lost. #{@your_site} status code: #{status_code} - Google: #{google_status_code}")
  end
  log_file.close
end

loop do
  status_code = check_code(@your_site) rescue 666
  if status_code != 200
    write_log(status_code)
  end
  sleep(60)
end