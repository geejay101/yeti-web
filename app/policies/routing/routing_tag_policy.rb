# frozen_string_literal: true

module Routing
  class RoutingTagPolicy < ::RolePolicy
    section 'Routing/RoutingTag'

    class Scope < ::RolePolicy::Scope
    end
  end
end
