require 'faraday' # HTTP Client
require 'faraday_middleware'
require 'json'

require 'fastlane_core'

# https://pushbear.ftqq.com/sub?sendkey={sendkey}&text={text}&desp={desp}
module Pushbear
    UI = FastlaneCore::UI
    class Runner
        def run params
            url = 'https://pushbear.ftqq.com/sub'
            reqParams = {
                'sendkey' => params[:sendkey],
                'text' => params[:text],
                'desp' => params[:desp]
            }
            # response = Faraday.get 'https://pushbear.ftqq.com/sub?sendkey=4039-7cd4804ec45f86f5870ba14ef8cca351&text=autoTEST&desp=Helloworld'
            response = Faraday.post url, reqParams
            info = response.body == nil ? {} : response.body
            if response.body == nil
                raise UI.user_error!("Response is nil.")
            end
            resultObj = JSON.parse(info)

            if resultObj['code'].to_i != 0
                message = resultObj['message'].to_str
                raise UI.user_error!("Error #{message}.")
            end
            data = resultObj['data'].to_str
            UI.success "Send wechat msg is successed! Result is #{data}."
        end
    end
end