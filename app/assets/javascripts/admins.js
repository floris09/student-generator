
function promoteAdmin(id) {

  $.ajax({
    type: "PUT",
    url: "/users/" + id + ".json",
    data: JSON.stringify({
      user: { admin: true }
    }),
    contentType: "application/json",
    dataType: "json"
  });

}

function demoteAdmin(id) {

  $.ajax({
    type: "PUT",
    url: "/users/" + id + ".json",
    data: JSON.stringify({
      user: { admin: false }
    }),
    contentType: "application/json",
    dataType: "json"
  });

}
