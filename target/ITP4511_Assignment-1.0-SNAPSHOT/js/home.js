$(document).ready(function () {
    $("#addWish").click(function (e) {
        e.preventDefault();
        window.location.replace(`userProfile?action=profile`);
    });
});