function generateDeliveryNote() {
    Swal.fire({
        title: 'Do you confirm?', showCancelButton: true, confirmButtonText: 'Yes',
    }).then((result) => {
        if (result.isConfirmed) {
            let deliveryID = $("#deliveryID").val();
            let userID = $("#userID").val();
            let bookingID = $("#bookingID").val();
            let pickupDate = $("#pickupDate").val();
            let pickupPlace = $("#pickupPlace").val();
            $.ajax({
                url: "delivery?action=generateDeliveryNote", type: "POST", data: {
                    deliveryID: deliveryID,
                    userID: userID,
                    bookingID: bookingID,
                    pickupDate: pickupDate,
                    pickupPlace: pickupPlace
                }, success: function (response) {
                    if (response.generateDeliveryNote === "success") {
                        window.location.replace("delivery?action=deliveryNote&deliveryID=" + deliveryID + "&generate=success");
                    } else {
                        window.location.replace("delivery?action=arrange&bookingID=" + bookingID + "&userID=" + userID + "&generate=failed");
                    }
                }, error: function (xhr, status, error) {
                    console.error("Error deleting equipment: ", error);
                    window.location.replace("delivery?action=arrange&bookingID=" + bookingID + "&userID=" + userID + "&generate=failed");
                }
            });
        }
    })
}

function acceptDeliveryRequest(deliveryID, userID) {
    Swal.fire({
        title: 'Do you confirm?', showCancelButton: true, confirmButtonText: 'Yes',
    }).then((result) => {
        if (result.isConfirmed) {

            $.ajax({
                url: "delivery?action=acceptDeliveryNote", type: "POST", data: {
                    deliveryID: deliveryID,
                    userID: userID

                }, success: function (response) {
                    if (response.acceptDeliveryNote === "success") {
                        window.location.replace("delivery?action=deliveryNote&deliveryID=" + deliveryID + "&accept=success");
                    } else {
                        window.location.replace("delivery?action=deliveryNote&deliveryID=" + deliveryID + "&accept=failed");
                    }
                }, error: function (xhr, status, error) {
                    console.error("Error deleting equipment: ", error);
                    window.location.replace("delivery?action=deliveryNote&deliveryID=" + deliveryID + "&accept=failed");
                }
            });
        }
    })
}

function completeDelivery(deliveryID, bookingID) {
    Swal.fire({
        title: 'Do you confirm?', showCancelButton: true, confirmButtonText: 'Yes',
    }).then((result) => {
        if (result.isConfirmed) {
            $.ajax({
                url: "delivery?action=completeDeliveryNote", type: "POST", data: {
                    deliveryID: deliveryID,
                    bookingID: bookingID

                }, success: function (response) {
                    if (response.completeDeliveryNote === "success") {
                        window.location.replace("delivery?action=deliveryNote&deliveryID=" + deliveryID + "&complete=success");
                    } else {
                        window.location.replace("delivery?action=deliveryNote&deliveryID=" + deliveryID + "&complete=failed");
                    }
                }, error: function (xhr, status, error) {
                    console.error("Error deleting equipment: ", error);
                    window.location.replace("delivery?action=deliveryNote&deliveryID=" + deliveryID + "&complete=failed");
                }
            });
        }
    })
}
