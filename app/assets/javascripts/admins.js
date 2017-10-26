
function promoteAdmin(id) {

  $.ajax({
    type: "PUT",
    url: "/users/" + id + ".json",
    data: JSON.stringify({
      user: { admin: true }
    }),
    contentType: "application/json",
    dataType: "json"
  })
  .done(function(data){
    console.log(data);
    button = document.getElementById(`toggle-admin-${id}`);
    button.className = "btn btn-success admin_btn";
    button.onclick = demote();
    button.innerHTML = "Make Student";
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
  })
  .done(function(data){
    console.log(data);
    button = document.getElementById(`toggle-admin-${id}`);
    button.className = "btn btn-primary student_btn";
    button.onclick = promote();
    button.innerHTML = "Make Admin";
  });
}

function promote(){
    return function() {
        demoteAdmin(id);
    }
  }

function promote(){
    return function() {
          promotesAdmin(id);
        }
      }
