function approveBooking() {
    Swal.fire({
        title: 'Do you want to approve this booking?', showCancelButton: true, confirmButtonText: 'Yes',
    }).then((result) => {
        if (result.isConfirmed) {
            let bookingID = $("#bookID").val().trim();
            window.location.replace(`booking?action=approveBooking&bookingID=${bookingID}`);
        }
    });
}

function rejectBooking() {
    Swal.fire({
        title: 'Please fill-in the reject reason.', showCancelButton: true, confirmButtonText: 'OK',
    }).then((result) => {
        if (result.isConfirmed) {
            $("#reason").removeClass("bg-gray-200");
            $("#reason").addClass("bg-white");
            $("#reason").prop("disabled", false);
            $("#reason").focus();
            $("#approve").attr("hidden", true);
            $("#reject").attr("hidden", true);
            $("#confirmedReject").attr("hidden", false);
            $("#cancelReject").attr("hidden", false);
        }
    });
}

function confirmReject() {
    if ($("#reason").val().trim() === "") {
        $("#reason").focus();
        Swal.fire("Reason is required!");
        return;
    }
    Swal.fire({
        title: 'Do you want to reject this booking?', showCancelButton: true, confirmButtonText: 'Yes',
    }).then((result) => {
        if (result.isConfirmed) {
            let bookingID = $("#bookID").val().trim();
            let reason = $("#reason").val().trim();
            window.location.replace(`booking?action=rejectBooking&bookingID=${bookingID}&rejectReason=${reason}`);
        }
    });
}

function cancelReject() {
    $("#reason").val("");
    $("#reason").removeClass("bg-white");
    $("#reason").addClass("bg-gray-200");
    $("#reason").prop("disabled", true);
    $("#approve").attr("hidden", false);
    $("#reject").attr("hidden", false);
    $("#confirmedReject").attr("hidden", true);
    $("#cancelReject").attr("hidden", true);
}

function completeBooking() {
    Swal.fire({
        title: 'Do you want to complete this booking?', showCancelButton: true, confirmButtonText: 'Yes',
    }).then((result) => {
        if (result.isConfirmed) {
            let bookingID = $("#bookID").val().trim();
            $.ajax({
                url: `booking?action=completeBooking`, type: "POST", data: {
                    bookingID: bookingID
                }, success: function (response) {
                    if (response.completeBooking === "success") {
                        window.location.replace(`booking?action=requestDetails&bookingID=${bookingID}&complete=success`);
                    } else {
                        Swal.fire("Error completing booking!");
                    }
                }, error: function (xhr, status, error) {
                    console.error("Error completing booking: ", error);
                    Swal.fire("Error completing booking!");
                }
            });
        }
    });
}

function userReceived() {
    Swal.fire({
        title: 'Do you want to confirm that the user has received the item?',
        showCancelButton: true,
        confirmButtonText: 'Yes',
    }).then((result) => {
        if (result.isConfirmed) {
            let bookingID = $("#bookID").val().trim();
            $.ajax({
                url: `booking?action=userReceived`, type: "POST", data: {
                    bookingID: bookingID
                }, success: function (response) {
                    if (response.userReceived === "success") {
                        window.location.replace(`booking?action=requestDetails&bookingID=${bookingID}&userReceived=success`);
                    } else {
                        Swal.fire("Error confirming user received item!");
                    }
                }, error: function (xhr, status, error) {
                    console.error("Error confirming user received item: ", error);
                    Swal.fire("Error confirming user received item!");
                }
            });
        }
    });
}