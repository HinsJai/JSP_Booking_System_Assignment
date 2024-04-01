function removeCheckoutItem(id) {
    Swal.fire({
        title: 'Do you want to remove this item from checkout?',
        showCancelButton: true,
        confirmButtonText: 'Yes',
    }).then((result) => {
        if (result.isConfirmed) {
            window.location.replace(`reserve?action=removeCartItem&id=${id}`);
        }
    });
}
