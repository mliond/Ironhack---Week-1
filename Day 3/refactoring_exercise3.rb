case output
  when :screen
   puts text
  when :logfile
    write_log
  when :message_queue
    put_queue
  when :json_endpoint
    HTTP.http_post
  when :logstash
    add_logstash
  when :logwatcher
    new_logstash
end

class HTTP
  def self.http_post(text)
    self.post(text)
  end
end

# ...

def write_log
  IO.write("log.log", text)
end

def add_logstash
  Logstash.add(text)
end

def new_logstash
  LogWatch.new.post(text)
end

def put_queue
  Queue.put(text)
end

