import consumer from "./consumer";

const messageChannel = consumer.subscriptions.create("MessageChannel", {
  connected() {},

  disconnected() {},

  received(data) {
    const messageDisplay = document.querySelector("#message-display");
    messageDisplay.insertAdjacentHTML("beforeend", this.template(data));
  },

  template(data) {
    return `<div class="p-3 mb-4 bg-white rounded shadow w-fit">
              <div class="text-sm font-bold">
                ${data.user.email}
              </div>
              <div>
                ${data.body}
              </div>
            </div>`;
  },
});
