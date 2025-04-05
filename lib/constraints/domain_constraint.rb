# app/constraints/domain_constraint.rb
class DomainConstraint
  def self.matches?(request)
    store = Store.find_by(subdomain: request.subdomain)
    store.present?
  end
end
