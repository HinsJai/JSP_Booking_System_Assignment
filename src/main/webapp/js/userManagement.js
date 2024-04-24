function edit(userID) {

    $(`#cancel_${userID}`).show();
    $(`#update_${userID}`).show();
    $(`#edit_${userID}`).hide();
    $(`#lock_${userID}`).hide();
    $(`#unlock_${userID}`).hide();
    $(`#root_${userID}`).prop("disabled", false);
    $(`#campus_${userID}`).prop("disabled", false);
}


function cancel(userID, root, campus) {

    console.log(userID);
    console.log(root);
    console.log(campus);

    $(`#cancel_${userID}`).hide();
    $(`#update_${userID}`).hide();
    $(`#edit_${userID}`).show();
    $(`#lock_${userID}`).show();
    $(`#unlock_${userID}`).show();

    $(`#root_${userID}`).val(root).prop('selected', true);
    $(`#campus_${userID}`).val(campus).prop('selected', true);
    $(`#root_${userID}`).prop("disabled", true);
    $(`#campus_${userID}`).prop("disabled", true);

}

function update(userID) {

    let root = $(`#root_${userID}`).val();
    let campus = $(`#campus_${userID}`).val();

    $.ajax({
        url: "userManagement?action=update", type: "POST", data: {
            userID: userID, root: root, campus: campus,
        }, success: function (response) {
            if (response.update === "success") {
                window.location.replace("userManagement?action=userList&update=success");
            } else {
                window.location.replace("userManagement?action=userList&userID=&update=failed");
            }
        }
    });
}

// function deleteUser(userID) {
//     Swal.fire({
//         title: 'Do you want to delete the user?', showCancelButton: true, confirmButtonText: 'Yes',
//     }).then((result) => {
//         if (result.isConfirmed) {
//             $.ajax({
//                 url: "userManagement?action=delete", type: "POST", data: {
//                     userID: userID,
//                 }, success: function (response) {
//                     if (response.delete === "success") {
//                         window.location.replace("userManagement?action=userList&delete=success");
//                     } else {
//                         window.location.replace("userManagement?action=userList&userID=&delete=failed");
//                     }
//                 }
//             });
//         }
//     });
// }

function lockUser(userID) {
    Swal.fire({
        title: 'Do you want to lock the user?', showCancelButton: true, confirmButtonText: 'Yes',
    }).then((result) => {
        if (result.isConfirmed) {
            $.ajax({
                url: "userManagement?action=lock", type: "POST", data: {
                    userID: userID,
                }, success: function (response) {
                    if (response.lock === "success") {
                        window.location.replace("userManagement?action=userList&lock=success");
                    } else {
                        window.location.replace("userManagement?action=userList&userID=&lock=failed");
                    }
                }
            });
        }
    });
}

function unLockUser(userID) {
    Swal.fire({
        title: 'Do you want to unlock the user?', showCancelButton: true, confirmButtonText: 'Yes',
    }).then((result) => {
        if (result.isConfirmed) {
            $.ajax({
                url: "userManagement?action=unlock", type: "POST", data: {
                    userID: userID,
                }, success: function (response) {
                    if (response.unlock === "success") {
                        window.location.replace("userManagement?action=userList&unlock=success");
                    } else {
                        window.location.replace("userManagement?action=userList&userID=&unlock=failed");
                    }
                }
            });
        }
    });

}

function searchUser() {
    let search = $("#search-type").val();
    let keyword = $("#keyword").val();
    if (search === "all") {
        window.location.replace("userManagement?action=userList");
    } else {
        window.location.replace("userManagement?action=search&type=" + search + "&keyword=" + keyword);
    }
}

function createUser() {
    window.location.replace("userManagement?action=createUser");
}