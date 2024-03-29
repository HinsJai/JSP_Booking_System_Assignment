$(document).ready(function () {
    $("#edit").click(function (e) {
        e.preventDefault();
        $("#edit").hide();
        $("#save").show();
        $("#update_pwd").hide();
        $("#cancel").show();
        $("#email").prop("disabled", false);
        $("#phone").prop("disabled", false);
    });
});

$(document).ready(function () {
    $("#cancel").click(function (e) {
        e.preventDefault();
        $("#edit").show();
        $("#save").hide();
        $("#update_pwd").show();
        $("#cancel").hide();
        $("#email").prop("disabled", true);
        $("#phone").prop("disabled", true);
    });
});

$(document).ready(function () {
    $("#update_pwd").click(function (e) {
        e.preventDefault();
        window.location.replace(`userProfile?action=updatePasswordPage`);
    });
});

$(document).ready(function () {
    $("#save").click(function (e) {
        e.preventDefault();
        let email = $("#email").val().trim();
        let phone = $("#phone").val().trim();
        let userID = $("#userID").text().trim();

        Swal.fire({
            title: 'Do you want to save the changes?', showCancelButton: true, confirmButtonText: 'Yes', // customClass: {
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.replace(`userProfile?action=save&userID=${userID}&email=${email}&phone=${phone}`);
            }
        })
    });
});

//update password js
$(document).ready(function () {
    $("#change-pwd").click(function (e) {
        e.preventDefault();
        let password = $("#password").val().trim();
        let confirmPassword = $("#confirm-password").val().trim();

        if (password === "" || confirmPassword === "") {
            Swal.fire({
                icon: 'error', title: 'Null Fields', text: 'Please fill in all fields!',
            });
        } else if (password !== confirmPassword) {
            Swal.fire({
                icon: 'error', title: 'Password Mismatch', text: 'Passwords do not match!',
            });
        } else {
            window.location.replace(`userProfile?action=updatePassword&password=${password}`);
        }
    });
});

$(document).ready(function () {
    $("#black").click(function (e) {
        e.preventDefault();
        window.location.replace(`userProfile?action=profile`);
    });
});




