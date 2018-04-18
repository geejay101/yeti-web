class AddSrcDstPrefixToRtdr < ActiveRecord::Migration
  def change
    add_column 'class4.routing_tag_detection_rules', :src_prefix, :string, null: false, default: ''
    add_column 'class4.routing_tag_detection_rules', :dst_prefix, :string, null: false, default: ''
  end
end
