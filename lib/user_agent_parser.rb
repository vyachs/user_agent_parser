require 'useragent_parser'
module UserAgentParser
  def self.parse(string)
    stripped_str = string.strip
    return 'web' if !stripped_str.include?('Duriana') && UseragentParser.parse(stripped_str).browser != 'Other '
    case stripped_str
    when /^Duriana Ruby Gem .+$/
      'web'
    when /^Duriana\/.+CFNetwork\/.+Darwin\/.+$/
      'ios'
    when /^(Duriana\/.+Build\/.+Restlet\/.+Device\/.+|Android\/.+Duriana\/.+Build\/.+Device\/.+)$/
      'android'
    else
      'unknown'
    end
  end
end