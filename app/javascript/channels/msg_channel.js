import consumer from "channels/consumer";

const msgChannel = consumer.subscriptions.create("MsgChannel", {
  connected() {},

  disconnected() {},

  received(data) {
    const messageDisplay = document.querySelector("#message-display");
    messageDisplay.insertAdjacentHTML("beforeend", this.template(data));
  },


  template(data) {
    return `<article class="message">
              <div class="message-header">
                <p>${data.inputData.body}</p>
              </div>
              <div class="message-body">
                <p>${data.inputData.body}</p>
              </div>
            </article>`
  }
});

document.addEventListener("turbo:load", () => {
  let form = document.querySelector("#message-form");
  if (form) {
    form.addEventListener("submit", (e) => {
      e.preventDefault();
      let messageInput = document.querySelector("#message-input").value;
      if (messageInput == "") return;
      const inputData = {
        body: messageInput,
      };
      msgChannel.send({ inputData: inputData });
    });
  }
});
