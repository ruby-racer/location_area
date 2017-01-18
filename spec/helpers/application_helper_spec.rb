require 'rails_helper'

describe ApplicationHelper do
  describe '#path_to_js_for_current_page' do
    it 'returns path to javascript file for current page' do
      expect(helper.path_to_js_for_current_page).to eq('')

      allow(helper).to receive(:controller_name) { 'locations' }
      allow(helper).to receive(:action_name) { 'index' }

      expect(helper.path_to_js_for_current_page).to eq('locations/index_page')
    end
  end
end
