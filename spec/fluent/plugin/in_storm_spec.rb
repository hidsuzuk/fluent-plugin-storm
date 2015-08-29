# coding: utf-8
BASE_CONFIG = %(
  type storm
  tag hoge
)

CONFIG = BASE_CONFIG + %(
  interval 1
)

describe Fluent::StormInput do
  before do
    Fluent::Test.setup
  end

  describe '#configure' do
    let(:d) do
      Fluent::Test::InputTestDriver.new(Fluent::StormInput)
    end

    context 'test of test' do
      it 'getting config' do
        instance = d.configure(CONFIG).instance
        expect(instance.interval).to eq 1
      end
    end

  end

  describe '#run' do
    let(:d) do
      Fluent::Test::InputTestDriver.new(Fluent::StormInput)
        .configure(config)
    end

    before do
    end

    describe 'interval test' do
      before do
      end
      context 'in case interval=1' do
        let(:config) { BASE_CONFIG + 'interval 1' }

        it '2 execute in 2 sec' do
          expect(d.instance).to receive(:execute).exactly(2)
          d.run { sleep 2.0 }
        end
      end

      context 'in case interval=2' do
        let(:config) { BASE_CONFIG + 'interval 2' }
        it '1 execute in sec' do
          expect(d.instance).to receive(:execute).exactly(1)
          d.run { sleep 2.0 }
        end
      end
    end

  end
end
