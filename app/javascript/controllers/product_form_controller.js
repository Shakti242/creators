import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="product-form"
export default class extends Controller {
  static targets = ['template', 'prices']

  connect() {
    // You can initialize any necessary state here if needed.
  }

  addPrice() {
    const template = this.templateTarget.innerHTML;
    this.pricesTarget.insertAdjacentHTML('beforeend', template);
  }
}
