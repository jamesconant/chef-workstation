require 'socket' # Provides TCPServer and TCPSocket classes
require 'uri'
# require 'pry'

def requested_file(request_line)
  request_uri  = request_line.split(" ")[1]
  path       = URI.unescape(URI(request_uri).path)

  clean = []

  # Split the path into components
  parts = path.split("/")

  parts.each do |part|
    # skip any empty or current directory (".") path components
    next if part.empty? || part == '.'
    # If the path component goes up one directory level (".."),
    # remove the last clean component.
    # Otherwise, add the component to the Array of clean components
    part == '..' ? clean.pop : clean << part
  end

  # return the web root joined to the clean path
  File.join(*clean)
end

# Initialize a TCPServer object that will listen
# on localhost:80 for incoming connections.
server = TCPServer.new('127.0.0.1', 3000)

# loop infinitely, processing one incoming
# connection at a time.
loop do

  # Wait until a client connects, then return a TCPSocket
  # that can be used in a similar fashion to other Ruby
  # I/O objects. (In fact, TCPSocket is a subclass of IO.)
  socket = server.accept

  # Read the first line of the request (the Request-Line)
  request = socket.gets

  file_path = requested_file(request)

  # Log the request to the console for debugging
  STDERR.puts request

  File.open("./#{file_path}") do |file|
    socket.print "HTTP/1.1 200 OK\r\n" +
                 "Content-Type: application/octet-stream\r\n" +
                 "Content-Length: #{file.size}\r\n" +
                 "Connection: close\r\n"

    socket.print "\r\n"

    IO.copy_stream(file, socket)
  end

  socket.close
end
