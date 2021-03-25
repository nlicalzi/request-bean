import consumer from "./consumer";

const regex = /\/bins\/[0-9A-F]{8}\b/gi;

const isBinPage = () => window.location.pathname.match(regex).length > 0;

document.addEventListener("turbo:load", () => {
  const div = document.getElementById("bin_id");
  if (isBinPage && div) {
    const id = div.innerText.trim();

    consumer.subscriptions.create(
      { channel: "RequestChannel", room: id },
      {
        connected() {
          // Called when the subscription is ready for use on the server
          console.log("connected");
        },

        disconnected() {
          // Called when the subscription has been terminated by the server
        },

        received(data) {
          const tableData = `
  <td>${data.http_method}</td>
  <td>${data.created_at}</td>
  <td><a href="/requests/${data.id}">Show</a></td>
  <td><a data-confirm="Are you sure?" rel="nofollow" data-method="delete" href="/requests/${data.id}">Destroy</a></td>
`;
          const tr = document.createElement("tr");
          tr.innerHTML = tableData;

          document.getElementById("table_data").appendChild(tr);
        },
      }
    );
  }
});
