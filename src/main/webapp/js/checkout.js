function removeCheckoutItem(id) {
    Swal.fire({
        title: 'Do you want to remove this item from checkout?', showCancelButton: true, confirmButtonText: 'Yes',
    }).then((result) => {
        if (result.isConfirmed) {
            window.location.replace(`reserve?action=removeCartItem&id=${id}`);
        }
    });
}

$(document).ready(function () {
    $("#bookingBtn").on("click", function (e) {
        e.preventDefault();
        Swal.fire({
            title: 'Do you want to create this booking?', showCancelButton: true, confirmButtonText: 'Yes',
        }).then((result) => {
            if (result.isConfirmed) {
                let bookID = $("#bookID").val().trim();
                console.log(bookID)
                let bookDate = $("#bookDate").val().trim();
                let pickUpDate = $("#pickUpDate").val().trim();
                let returnDate = $("#returnDate").val().trim();
                window.location.replace(`reserve?action=create_booking&bookID=${bookID}&bookDate=${bookDate}&pickUpDate=${pickUpDate}&returnDate=${returnDate}`);
            }
        });
    });
});

