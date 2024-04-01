//show cart
$(document).ready(function () {
    $("#cart").on("click", function () {
        window.location.replace(`reserve?action=showCart`);
        $("#cart-container").show();
    });
});

$(document).ready(function () {
    $("#close").on("click", function () {
        $("#cart-container").hide();
    });
});

//remove item from cart
function removeItem(id) {
    Swal.fire({
        title: 'Do you want to remove this item from cart?',
        showCancelButton: true,
        confirmButtonText: 'Yes',
    }).then((result) => {
        if (result.isConfirmed) {
            window.location.replace(`reserve?action=removeCartItem&id=${id}`);
        }
    });
}

$(document).ready(function () {
    $("#checkout").on("click", function () {
        window.location.replace(`reserve?action=checkout`);
    });
});