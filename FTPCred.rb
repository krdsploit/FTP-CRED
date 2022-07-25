# gem install packetfu

#!/usr/bin/ruby

require 'packetfu'
packets = PacketFu::PcapFile.read_packets 'packets.pcap'


pcap_file = ARGV[0]
packets = PacketFu::PcapFile.read_packets 'packets.pcap'

packets.each_with_index do |packet, i|
    if packet.tcp_dport == 21
        if packet.payload.match(/(USER|PASS)/)
        src = [packet.ip_src].pack('N')unpack('C4').join('.')
        dst = [packet.ip_src].pack('N')unpack('C4').join('.')
        puts "#{src} => #{dst}"
        print packet.payload
    end
end
end
