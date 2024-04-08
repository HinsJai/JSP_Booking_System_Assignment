function dismissWishNotification() {
    fetch("notification?action=wish_dismiss", {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },
    })
        .then(response => {
            if (response.ok) {
                return response.text();
            }
            throw new Error('Network response was not ok.');
        })
        .then(data => {
            console.log(data);

        })
        .catch(error => {
            console.error('There has been a problem with your fetch operation:', error);
        });
}

function dismissBookingRequestNotification() {
    fetch("notification?action=bookingRequestDismiss", {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },
    })
        .then(response => {
            if (response.ok) {
                return response.text();
            }
            throw new Error('Network response was not ok.');
        })
        .then(data => {
            console.log(data);

        })
        .catch(error => {
            console.error('There has been a problem with your fetch operation:', error);
        });
}
