# app/constraints/domain_constraint.rb
class DomainConstraint
  def self.matches?(request)
    request.subdomain.present? && request.subdomain == 'your_store_subdomain'
  end
end
