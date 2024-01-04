import consumer from "channels/consumer";

const chat_id = document.getElementById("chat_id").value;

const msgChannel = consumer.subscriptions.create(
  { channel: "MsgChannel", chat_id: chat_id },
  {
    connected() {},

    disconnected() {},

    received(data) {
      const messageDisplay = document.querySelector("#message-display");
      document.getElementById("message-input").value = "";
      messageDisplay.insertAdjacentHTML("beforeend", this.template(data));
    },
    template(data) {
      return `<div class="p-3 mb-4 bg-white rounded shadow w-fit">
              <div class="mb-1 text-sm font-bold text-blue-400">
                ${data.msg_sender.username}
              </div>
              <div>
                ${data.body}
              </div>
            </div>`;
    },
  },
);
