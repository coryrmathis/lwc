import { Controller } from "@hotwired/stimulus"
import { ChordProParser, PdfFormatter } from "chordsheetjs"

export default class extends Controller {
  static values = { source: String }

  connect() {
    if (this.hasSourceValue && this.sourceValue.trim().length > 0) {
      this.render(this.sourceValue)
    }
  }

  render(chordPro) {
    try {
      const parser = new ChordProParser()
      const song = parser.parse(chordPro)
      const formatter = new PdfFormatter()
      this.element.innerHTML = formatter.format(song)
    } catch {
      // Fall back to the raw <pre> block already in the DOM
    }
  }
}
