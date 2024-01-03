import consumer from "channels/consumer";

const chat_id = document.getElementById("chat_id").value;

const msgChannel = consumer.subscriptions.create(
  { channel: "MsgChannel", chat_id: chat_id },
  {
    // const msgChannel = consumer.subscriptions.create("MsgChannel", {
    connected() {
      // console.log(chat_id)
    },

    disconnected() {},

    received(data) {
      const messageDisplay = document.querySelector("#message-display");
      console.log(data);
      messageDisplay.insertAdjacentHTML("beforeend", this.template(data));
    },
    template(data) {
      return `<div class="message">
                <p>${data.msg_sender.username}: ${data.body}</p>
            </div>`;
    },

    // template(data) {
    //   return `<article class="message">
    //             <div class="message-header">
    //               <p>${data.user.email.split("@")[0]}</p>
    //             </div>
    //             <div class="message-body">
    //               <p>${data.body}</p>
    //             </div>
    //           </article>`;
    // },
  },
);

// TODO: Delete me
// document.addEventListener("turbo:load", () => {
//   let form = document.querySelector("#message-form");
//   if (form) {
//     form.addEventListener("submit", (e) => {
//       e.preventDefault();
//       let messageInput = document.querySelector("#message-input").value;
//       if (messageInput == "") return;
//       const inputData = {
//         body: messageInput,
//       };
//       msgChannel.send({ inputData: inputData });
//     });
//   }
// });
