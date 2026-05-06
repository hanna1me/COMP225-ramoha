import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  go(event) {
    event.preventDefault()
    window.scrollTo({
      top: 0,
      behavior: 'smooth'
    })
  }
}