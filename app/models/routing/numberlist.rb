# == Schema Information
#
# Table name: class4.numberlists
#
#  id                :integer          not null, primary key
#  name              :string           not null
#  created_at        :datetime
#  updated_at        :datetime
#  mode_id           :integer          default(1), not null
#  default_action_id :integer          default(1), not null
#

class Routing::Numberlist < Yeti::ActiveRecord
  has_paper_trail class_name: 'AuditLogItem'
  self.table_name='class4.numberlists'

  belongs_to :mode, class_name: Routing::NumberlistMode, foreign_key: :mode_id
  belongs_to :default_action, class_name: Routing::NumberlistAction, foreign_key: :default_action_id
  has_many :routing_numberlist_items, class_name: Routing::NumberlistItem, foreign_key: :numberlist_id, dependent: :delete_all

  validates_presence_of :mode, :name, :default_action
  validates_uniqueness_of :name

  def display_name
    "#{self.name} | #{self.id}"
  end

end
