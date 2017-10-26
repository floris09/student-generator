
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
    button.innerHTML = "Make Student";
    button.onclick = demoteAdmin;

    tag = document.getElementById(`tag-${id}`);
    tag.className = "admin_tag";
    tag.innerHTML = "Admin";

    studentrow = document.getElementById(`${id}`);
    child = document.getElementById(`child-${id}`);
    studentrow.remove();
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
    button.innerHTML = "Make Admin";
    button.onclick = promoteAdmin;

    tag = document.getElementById(`tag-${id}`);
    tag.className = "student_tag";
    tag.innerHTML = "Student";

    adminrow = document.getElementById(`${id}`);
    child = document.getElementById(`child-${id}`);
    adminrow.remove();
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
