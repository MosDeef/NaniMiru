import Clipboard from 'stimulus-clipboard'

export default class extends Clipboard {
  connect() {
    super.connect()
    console.log('Do what you want here.')
  }

  // Function to override on copy.
  copy() {}

  // Function to override when to input is copied.
  copied() {
    //
  }
}
