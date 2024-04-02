function cancelBooking() {
    Swal.fire({
        title: 'Do you want to cancel this booking?', showCancelButton: true, confirmButtonText: 'Yes',
    }).then((result) => {
        let bookID = $("#bookID").val().trim();
        if (result.isConfirmed) {
            window.location.replace(`booking?action=cancel&id=${bookID}`);
        }
    })
}
