
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
    button.onclick = function(){ demoteAdmin(id) };

    tag = document.getElementById(`tag-${id}`);
    tag.className = "admin_tag";
    tag.innerHTML = "Admin";

    studentrow = document.getElementById(`${id}`);
    admins = document.getElementById("admins");
    admins.appendChild(studentrow);
    tag2 = document.getElementById(`tag2-${id}`);
    tag2.className = "admin_tag";
    tag2.innerHTML = "Admin";

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
    button.onclick = function(){ promoteAdmin(id) };

    tag = document.getElementById(`tag-${id}`);
    tag.className = "student_tag";
    tag.innerHTML = "Student";

    adminrow = document.getElementById(`${id}`);
    students = document.getElementById("students");
    students.appendChild(adminrow);
    tag2 = document.getElementById(`tag2-${id}`);
    tag2.className = "student_tag";
    tag2.innerHTML = "Student";
  });
}
