require 'scanner'
require 'socket'
require 'mocket'

describe 'Scanner' do
  let(:scanner) { Scanner.new }
  let(:host) { '127.0.0.1' }
  let(:ports) { [40000, 40001] }
  let(:expected) { {'40000' => 'open', '40001' => 'closed'} }

  describe 'tcpscan' do
    context 'test mode using mockets' do
      it 'returns a hash of ports and statuses' do
        Mocket.listen(host, 40000)
        scanner.test!
        scanner.tcpscan(host, *ports).should == expected
      end
    end

    context 'live mode using sockets' do
      it 'returns a hash of ports and statuses' do
        server = TCPServer.open(host, 40000)
        scanner.live!
        scanner.tcpscan(host, *ports).should == expected
        server.close
      end
    end
  end
end
