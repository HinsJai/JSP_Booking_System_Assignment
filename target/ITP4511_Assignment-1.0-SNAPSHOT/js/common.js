function logout() {
    Swal.fire({
        title: 'Do you confirm logout?', showCancelButton: true, confirmButtonText: 'Yes',
    }).then((result) => {
        if (result.isConfirmed) {
            window.location.replace(`verify_login?loginAction=logout`);
        }
    })
}