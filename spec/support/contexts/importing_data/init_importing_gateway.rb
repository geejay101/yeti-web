# frozen_string_literal: true

shared_context :init_importing_gateway do |args|
  args ||= {}

  before do
    fields = {
      host: '1.2.3.4',
      port: 5060,
      src_rewrite_rule: '.*?0*(\\d*)$',
      dst_rewrite_rule: '.*?0*(\\d*)$',
      acd_limit: nil,
      asr_limit: nil,
      enabled: true,
      name: 'Iristel-GW-primary',
      auth_enabled: false,
      auth_user: '',
      auth_password: '',
      term_outbound_proxy: '',
      term_next_hop_for_replies: false,
      term_use_outbound_proxy: false,
      contractor_name: @contractor.name,
      contractor_id: @contractor.id,
      allow_termination: true,
      allow_origination: false,
      anonymize_sdp: true,
      proxy_media: true,
      transparent_seqno: false,
      transparent_ssrc: false,
      sst_enabled: false,
      sst_minimum_timer: 50,
      sst_maximum_timer: 50,
      sst_accept501: true,
      session_refresh_method_name: 'Update request and invite if unsupported',
      session_refresh_method_id: 3,
      sst_session_expires: 50,
      term_force_outbound_proxy: false,
      locked: false,
      codecs_payload_order: '',
      codecs_prefer_transcoding_for: '',
      src_rewrite_result: '+\\1',
      dst_rewrite_result: '\\1',
      capacity: 0,
      term_next_hop: nil,
      orig_next_hop: '',
      orig_append_headers_req: '',
      term_append_headers_req: '',
      dialog_nat_handling: true,
      orig_force_outbound_proxy: false,
      orig_use_outbound_proxy: false,
      orig_outbound_proxy: '',
      prefer_existing_codecs: true,
      force_symmetric_rtp: false,
      sdp_alines_filter_type_name: 'Transparent',
      sdp_alines_filter_type_id: 0,
      sdp_alines_filter_list: '',
      gateway_group_name: @gateway_group.name,
      gateway_group_id: @gateway_group.id,
      orig_disconnect_policy_name: 'not_send_503',
      orig_disconnect_policy_id: 1,
      term_disconnect_policy_name: 'not_send_503',
      term_disconnect_policy_id: 1,
      diversion_policy_name: 'Clear header',
      diversion_policy_id: 1,
      diversion_rewrite_rule: '',
      diversion_rewrite_result: '',
      src_name_rewrite_rule: '',
      src_name_rewrite_result: '',
      priority: 100,
      pop_name: 'US',
      pop_id: 1,
      codec_group_name: @codec_group.name,
      codec_group_id: @codec_group.id,
      single_codec_in_200ok: false,
      ringing_timeout: nil,
      symmetric_rtp_nonstop: false,
      symmetric_rtp_ignore_rtcp: false,
      resolve_ruri: false,
      force_dtmf_relay: false,
      relay_options: false,
      rtp_ping: false,
      filter_noaudio_streams: false,
      relay_reinvite: false,
      sdp_c_location_name: 'On media level',
      sdp_c_location_id: 2,
      auth_from_user: nil,
      auth_from_domain: nil,
      relay_hold: false,
      rtp_timeout: 30,
      relay_prack: false,
      rtp_relay_timestamp_aligning: false,
      allow_1xx_without_to_tag: false,
      sip_timer_b: 8000,
      dns_srv_failover_timer: 2000,
      rtp_force_relay_cn: true,
      sensor_name: nil,
      sensor_id: nil,
      sensor_level_name: 'Signaling',
      sensor_level_id: 1,
      is_changed: true
    }.merge(args)

    @importing_gateway = FactoryGirl.create(:importing_gateway, fields)
  end
end
