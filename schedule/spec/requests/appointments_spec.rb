require 'rails_helper'
RSpec.describe 'Appointments API', type: :request do
  let!(:schedule) {create(:schedule)}
  let!(:appointments) {create_list(:appointment, 1, schedule_id: schedule.id)}
  let(:schedule_id) {schedule.id}
  let(:id) {appointments.first.id}

  # tests for GET request /schedules/:schedule_id/appointments - getting all appointments for requested shedule
  describe 'GET /schedules/:schedule_id/appointments' do
    before {get "/schedules/#{schedule_id}/appointments"}

    context 'if schedule exists' do
      it 'returns all appointments for requested schedule' do
        expect(json).not_to be_empty
        expect(json.size).to eq(1)
      end
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'if schedule does not exist' do
      let(:schedule_id) {0}
      it 'returns a NOT FOUND message' do
        expect(response.body).to match(/Couldn't find Schedule/)
      end
      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

# tests for GET request /schedules/:schedule_id/appointments/:id - getting a specific appointment for requested schedule
  describe 'GET /schedules/:schedule_id/appointments/:id' do
    before {get "/schedules/#{schedule_id}/appointments/#{id}"}

    context 'if requested appointment exists' do
      it 'returns requested appointment' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(id)
      end
      it 'return status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'if requested appointment does not exist' do
      let(:id) {0}
      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
      it 'returns a NOT FOUND message' do
        expect(response.body).to match(/Couldn't find Appointment/)
      end
    end
  end

  # tests for POST request /schedules/:schedule_id/appointments/ - creating new appointment
  describe 'POST /schedules/:schedule_id/appointments' do
    let(:valid_attributes) {{start_time:1, end_time:4}}
    let(:invalid_attributes_start_greater_than_end) {{start_time:8, end_time:2}}
    let(:invalid_attributes_start_and_end_are_not_integers) {{start_time:'jkl', end_time:'sfdg'}}
    
    context 'if attributes are valid' do
      before {post "/schedules/#{schedule_id}/appointments", params: valid_attributes}
      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'if attributes are invalid - start_time is greater than end_time' do
      before {post "/schedules/#{schedule_id}/appointments", params: invalid_attributes_start_greater_than_end}
      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
      it 'returns a FAILURE message' do
        expect(response.body).to match(/Validation failed: End time must be greater than 8/)
      end
    end

    context 'if attributes are invalid - start_time and end_time are not integers' do
      before {post "/schedules/#{schedule_id}/appointments", params: invalid_attributes_start_and_end_are_not_integers}
      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
      it 'returns a FAILURE message' do
        expect(response.body).to match(/Validation failed: Start time is not a number, End time is not a number/)
      end
    end
  end

  # tests for DELETE request /schedules/:schedule_id/appointments/:id/ - deleting specific appointment
  describe 'DELETE /schedules/:schedule_id/appointments/:id' do
    before {delete "/schedules/#{schedule_id}/appointments/#{id}"}
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
end