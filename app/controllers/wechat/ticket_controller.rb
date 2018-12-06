module Wechat
  class TicketController < ApplicationController

    def index
      url = CGI.unescape(params[:url])
      @data = wechat_gate_config.generate_js_request_params(url)
      Rails.logger.info("Wechat url :#{@data}")
      render plain: "#{params[:callback]}(#{@data.to_json.html_safe})", content_type: "application/javascript"
    end

    def share_test
    end
  end
end