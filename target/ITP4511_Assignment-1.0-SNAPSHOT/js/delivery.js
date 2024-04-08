function generateDeliveryNote() {
    Swal.fire({
        title: 'Do you confirm?', showCancelButton: true, confirmButtonText: 'Yes',
    }).then((result) => {
        if (result.isConfirmed) {
            let deliveryID = $("#deliveryID").val();
            let bookingID = $("#bookingID").val();
            let pickupDate = $("#pickupDate").val();
            let pickupPlace = $("#pickupPlace").val();
            $.ajax({
                url: "delivery?action=generateDeliveryNote", type: "POST", data: {
                    id: id,
                }, success: function (response) {
                    if (response.generate === "success") {
                        window.location.replace("delivery?action=deliveryNote&deliveryID=" + id + "&generate=success");
                    } else {
                        window.location.replace("delivery?action=deliveryNote&deliveryID=" + id + "&generate=failed");
                    }
                }, error: function (xhr, status, error) {
                    console.error("Error deleting equipment: ", error);
                    window.location.replace("technicianEquipment?action=details&equipmentID=" + id + "&delete=failed");
                }
            });
        }
    })

}