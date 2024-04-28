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

function searchBooking() {
    let search = $("#search-type").val();
    let keyword = $("#keyword").val();
    if (search === "all") {
        window.location.replace("booking?action=list");
    } else {
        window.location.replace("booking?action=userSearch&type=" + search + "&keyword=" + keyword);
    }
}