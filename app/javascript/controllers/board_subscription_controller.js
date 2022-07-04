import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {
  static values = { boardId: Number }
  static targets = ["messages"]

  connect() {
    console.log("connected");
    this.channel = consumer.subscriptions.create(
      { channel: "BoardChannel", id: this.boardIdValue },
      { received: data => this.messagesTarget.insertAdjacentHTML("beforeend", data) }
    )
    console.log(`Subscribe to the board with the id ${this.boardIdValue}.`)
  }

  disconnect() {
    console.log("Unsubscribed from the chatroom")
    this.channel.unsubscribe()
  }
}
