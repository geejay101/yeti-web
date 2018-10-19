require 'spec_helper'

RSpec.describe Api::Rest::System::JobsController do
  describe 'PUT /api/rest/system/jobs/:type/run' do
    subject do
      put "/api/rest/system/jobs/#{job_type}/run"
    end

    context 'when type is EventProcessor' do
      let(:job_type) { 'EventProcessor' }

      include_examples :responds_with_status, 204

      context 'with events' do
        before do
          Event.reload_translations

          allow_any_instance_of(YetisNode::JsonRpcTransport).to receive(:rpc_send).
              with('request.router.translations.reload', []).and_return(nil)
        end

        it 'expects to delete success events' do
          expect { subject }.to change { Event.count }.from(Node.count).to(0)
        end

        include_examples :responds_with_status, 204

        context 'when one event failed' do
          before do
            expect_any_instance_of(Jobs::EventProcessor).to receive(:process_event).
                exactly(Node.count).times.and_raise(StandardError.new('some error'))
          end

          it 'expects to not delete events' do
            expect { subject }.to_not change { Event.count }
          end

          include_examples :responds_with_status, 204
        end

      end

    end

  end
end
