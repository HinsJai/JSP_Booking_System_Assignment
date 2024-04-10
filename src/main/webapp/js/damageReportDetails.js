function resolveEquipment() {
    Swal.fire({
        title: 'Do you confirm?', showCancelButton: true, confirmButtonText: 'Yes',
    }).then((result) => {
        if (result.isConfirmed) {
            let equipmentID = $('#equipmentID').val();
            let damageReportID = $('#id').val();
            let imageLength = $('#imageLength').val();
            let reportDate = $('#reportDate').val();
            $.ajax({
                url: `damageReport?action=resolve&equipmentID=${equipmentID}&damageReportID=${damageReportID}`,
                type: 'GET',
                success: function (response) {
                    if (response.resolveDamageReport === "success") {
                        window.location.replace(`damageReport?action=details&reportID=${damageReportID}&imageLength=${imageLength}&equipmentID=${equipmentID}&reportDate=${reportDate}&resolved=success`);
                    } else {
                        window.location.replace(`damageReport?action=details&reportID=${damageReportID}&imageLength=${imageLength}&equipmentID=${equipmentID}&reportDate=${reportDate}&resolved=failed`);
                    }
                }, error: function (xhr, status, error) {
                    console.error("Error reporting damage: ", error);
                    window.location.replace(`damageReport?action=details&reportID=${damageReportID}&imageLength=${imageLength}&equipmentID=${equipmentID}&reportDate=${reportDate}&resolved=failed`);
                }
            });
        }
    })
}