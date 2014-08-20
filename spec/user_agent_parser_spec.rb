require 'spec_helper'

describe UserAgentParser do
  context 'ios' do
    it { @agent_str = 'Duriana/21030 CFNetwork/672.1.15 Darwin/14.0.0' }
    it { @agent_str = 'Duriana/21006 CFNetwork/672.0.8 Darwin/14.0.0' }
    it { @agent_str = ' Duriana/21006 CFNetwork/672.0.8 Darwin/14.0.0' }

    after { expect(described_class.parse(@agent_str)).to eq('ios') }
  end

  context 'android' do
    it { @agent_str = 'Duriana/2.0 Build/26 Restlet/2.1.2 Device/samsung SM-T211' }
    it { @agent_str = ' Duriana/2.0 Build/26 Restlet/2.1.2 Device/samsung SM-T211' }
    it { @agent_str = 'Duriana/2.1 Build/30 Restlet/2.1.2 Device/LENOVO Lenovo A516' }
    it { @agent_str = 'Duriana/2.1 Build/30 Restlet/2.1.2 Device/LENOVO Lenovo A516  ' }
    it { @agent_str = 'Android/4.0.4 Duriana/2.1 Build/32 Device/samsung SM-T211' }

    after { expect(described_class.parse(@agent_str)).to eq('android') }
  end

  context 'web' do
    it { @agent_str = 'Duriana Ruby Gem 1.0.3' }
    it { @agent_str = ' Duriana Ruby Gem 1.0.3' }
    it { @agent_str = 'Mozilla/5.0 (Linux; U; Android 1.6; en-us; eeepc Build/Donut) AppleWebKit/528.5+ (KHTML, like Gecko) Version/3.1.2 Mobile Safari/525.20.1' }
    it { @agent_str = 'BlackBerry9000/5.0.0.93 Profile/MIDP-2.0 Configuration/CLDC-1.1 VendorID/179' }
    it { @agent_str = 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_7; en-US) AppleWebKit/534.16 (KHTML, like Gecko) Chrome/10.0.648.205 Safari/534.16' }
    it { @agent_str = 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0)' }
    it { @agent_str = 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko' }
    it { @agent_str = 'Mozilla/5.0 (compatible; Konqueror/4.3; Linux) KHTML/4.3.5 (like Gecko)' }
    it { @agent_str = 'Mozilla/5.0 (Windows; I; Windows NT 5.1; ru; rv:1.9.2.13) Gecko/20100101 Firefox/4.0' }
    it { @agent_str = 'Opera/9.80 (Macintosh; Intel Mac OS X 10.6.7; U; ru) Presto/2.8.131 Version/11.10' }
    it { @agent_str = 'Opera/9.80 (S60; SymbOS; Opera Mobi/499; U; ru) Presto/2.4.18 Version/10.00' }
    it { @agent_str = 'Opera/9.80 (Android; Opera Mini/7.5.31657/28.2555; U; ru) Presto/2.8.119 Version/11.10' }
    it { @agent_str = 'Mozilla/5.0 (Macintosh; I; Intel Mac OS X 10_6_7; ru-ru) AppleWebKit/534.31+ (KHTML, like Gecko) Version/5.0.5 Safari/533.21.1' }

    after { expect(described_class.parse(@agent_str)).to eq('web') }
  end

  context 'unknown' do
    it { @agent_str = '' }
    it { @agent_str = 'some agent' }
    it { @agent_str = 'Wget/1.15 (linux-gnu)' }
    it { @agent_str = 'curl/7.35.0' }

    after { expect(described_class.parse(@agent_str)).to eq('unknown') }
  end
end