require 'spec_helper'

describe Lita::Handlers::OnewheelImages, lita_handler: true do

  before(:each) do
    mock_result_json = File.open('spec/fixtures/mock_result.json').read
    allow(Lita::Handlers::OnewheelImages).to receive(:get_results).and_return(mock_result_json)

    registry.configure do |config|
      config.handlers.onewheel_images.custom_search_engine_id = ''
      config.handlers.onewheel_images.google_api_key = ''
    end
  end

  it { is_expected.to route_command('image something') }

  it 'does neat imagey things' do
    mock_result_json = JSON.parse File.open('spec/fixtures/mock_result.json').read
    allow(Lita::Handlers::OnewheelImages).to receive(:get_results).and_return(mock_result_json)
    # mock gcse response
    send_command 'image yo'

  end
end
