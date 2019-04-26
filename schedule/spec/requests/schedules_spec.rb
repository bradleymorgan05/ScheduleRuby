require 'rails_helper'
RSpec.describe 'Schedules API', type: :request do
  let!(:schedules) {create_list(:schedule, 5)}
  let(:schedule_id) {schedules.first.id}

  # tests for GET request /schedules - getting all schedules
  describe 'GET /schedules' do
    before {get '/schedules'}

    it 'returns schedules' do
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # tests for GET request /schedules/:id - getting specific schedule
  describe 'GET /schedules/:id' do
    before {get "/schedules/#{schedule_id}"}

    context 'if requested schedule exists' do
      it 'returns requested schedule' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(schedule_id)
      end
      it 'return status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'if requested schedule does not exist' do
      let(:schedule_id) {0}
      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
      it 'returns a NOT FOUND message' do
        expect(response.body).to match(/Couldn't find Schedule/)
      end
    end
  end

  # tests for POST request for shedules are not required - schedule model does not have any attributes that can be validated, and therefore ignores any params passed to it

  # tests for DELETE request /schedules/:id - deleting specific schedule
  describe 'DELETE /schedules/:id' do
    before {delete "/schedules/#{schedule_id}"}
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
end