function edit(userID) {

    $(`#cancel_${userID}`).show();
    $(`#update_${userID}`).show();
    $(`#edit_${userID}`).hide();
    $(`#delete_${userID}`).hide();

    $(`#root_${userID}`).prop("disabled", false);
    $(`#campus_${userID}`).prop("disabled", false);


    // console.log(rootElm);
    // console.log(campusElm);
    // rootElm.prop("disabled", false);
    // campusElm.prop("disabled", false);

}


function cancel(userID, root, campus) {

    console.log(userID);
    console.log(root);
    console.log(campus);

    $(`#cancel_${userID}`).hide();
    $(`#update_${userID}`).hide();
    $(`#edit_${userID}`).show();
    $(`#delete_${userID}`).show();

    $(`#root_${userID}`).val(root).prop('selected', true);
    $(`#campus_${userID}`).val(campus).prop('selected', true);
    $(`#root_${userID}`).prop("disabled", true);
    $(`#campus_${userID}`).prop("disabled", true);


}

// $(document).ready(function () {
//
//     $("select").change(function () {
//         console.log($(this).val());
//
//     });
// });