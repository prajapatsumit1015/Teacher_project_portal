import { Controller } from "./stimulus";

export default class extends Controller {
  closeModal(event) {
    console.log("Hello world")
    const modal = this.element.closest(".modal");
    if (modal) {
      modal.classList.remove("show");
      modal.setAttribute("aria-hidden", "true");
      modal.setAttribute("style", "display: none");
      
      // Make sure backdrop is removed
      document.querySelectorAll('.modal-backdrop').forEach(el => el.remove());
    }
  }
}