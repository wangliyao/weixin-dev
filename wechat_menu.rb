  require 'json'
  require 'open-uri'
  require 'pry'
  require 'rest-client'
  p ARGV[0]
  p ARGV[1]
  class WechatMenu
    def get_token
      url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=#{ARGV[0]}&secret=#{ARGV[1]}"
      result = JSON.parse(open(url).read)
      result = nil
      RestClient.get(url) { |response| result = JSON.parse(response) if response.code == 200}
      if result && !result['access_token'].nil?
        return result['access_token']
      else
        return nil
      end
    end

    def tabView
      '{
       "button":[
        {    
            "type":"view",
            "name":"听音频",
            "url":"http://url"
        },
        {    
             "type":"view",
             "name":"读文章",
             "url":"http://url"
        },
       {    
            "type":"view",
            "name":"兑换音频",
            "url":"http://url"
        }]
      }'
    end

    @menu = WechatMenu.new()
    token = @menu.get_token
    url = "https://api.weixin.qq.com/cgi-bin/menu/create?access_token=#{token}"
    rest = RestClient.post(url, @menu.tabView)
    p JSON.parse(rest)
  end
