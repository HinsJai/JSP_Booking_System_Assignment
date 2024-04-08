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
                    if (response.generate === "success") {
                        window.location.replace("delivery?action=deliveryNote&deliveryID=" + deliveryID + "&generate=success");
                    } else {
                        window.location.replace("delivery?action=arrange&bookingID=" + bookingID + "userID=" + userID + "&generate=failed");
                    }
                }, error: function (xhr, status, error) {
                    console.error("Error deleting equipment: ", error);
                    window.location.replace("delivery?action=arrange&bookingID=" + bookingID + "userID=" + userID + "&generate=failed");
                }
            });
        }
    })

}