function logout() {
    Swal.fire({
        title: 'Do you want to logout?', showCancelButton: true, confirmButtonText: 'Yes',
    }).then((result) => {
        if (result.isConfirmed) {
            window.location.replace(`verify_login?loginAction=logout`);
        }
    })
}