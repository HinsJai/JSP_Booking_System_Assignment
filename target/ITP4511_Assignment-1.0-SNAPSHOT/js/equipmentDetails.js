function edit() {
    $("#edit-container").hide();
    $("#confirm-container").show();
    $("#upload-container").show();
    $("#name").prop("disabled", false);
    $("#type").prop("disabled", false);
    $("#sNo").prop("disabled", false);
    $("#status").prop("disabled", false);
    $("#campus").prop("disabled", false);
    $("#isPrivate").prop("disabled", false);
    $("#pDate").prop("disabled", false);
}

function cancel() {
    $("#edit-container").show();
    $("#confirm-container").hide();
    $("#upload-container").hide();
    $("#name").prop("disabled", true);
    $("#type").prop("disabled", true);
    $("#sNo").prop("disabled", true);
    $("#status").prop("disabled", true);
    $("#campus").prop("disabled", true);
    $("#isPrivate").prop("disabled", true);
    $("#pDate").prop("disabled", true);
}

function updateEquipment() {
    Swal.fire({
        title: 'Do you want to save the changes?', showCancelButton: true, confirmButtonText: 'Yes',
    }).then((result) => {
        if (result.isConfirmed) {
            let id = $("#id").val();
            let name = $("#name").val().trim();
            let type = $("#type").val();
            let sNo = $("#sNo").val().trim();
            let status = $("#status").val();
            let campus = $("#campus").val();
            let pDate = $("#pDate").val();
            let wPeriod = $("#wPeriod").val();
            let isPrivate = $("#isPrivate").val();

            $.ajax({
                url: "technicianEquipment?action=update", type: "POST", data: {
                    id: id,
                    name: name,
                    type: type,
                    sNo: sNo,
                    status: status,
                    campus: campus,
                    pDate: pDate,
                    wPeriod: wPeriod,
                    isPrivate: isPrivate,
                }, success: function (response) {
                    if ($("#upload")[0].files.length > 0) {
                        uploadFile(id);
                    } else {
                        window.location.replace("technicianEquipment?action=details&equipmentID=" + id + "&update=success");
                    }
                    // window.location.replace(response.url);
                }, error: function (xhr, status, error) {
                    console.error("Error adding equipment: ", error);
                    window.location.replace("technicianEquipment?action=details&equipmentID=" + id + "&update=failed");
                }
            });
        }
    })

}

function uploadFile(id) {

    let file = $("#upload").prop("files")[0];
    let formData = new FormData();
    formData.append("file", file);
    $.ajax({
        url: "UploadServlet?action=updateImage&id=" + id,
        type: "POST",
        data: formData,
        contentType: false,
        processData: false,
        success: function (response) {
            window.location.replace(response.url);
        },
        error: function (xhr, status, error) {
            console.error("Error uploading file: ", error);
            window.location.replace("technicianEquipment?action=details&equipmentID=" + id + "&update=failed");

        }
    });
}

function deleteEquipment() {
    Swal.fire({
        title: 'Do you want to delete this equipment?', showCancelButton: true, confirmButtonText: 'Yes',
    }).then((result) => {
        if (result.isConfirmed) {
            let id = $("#id").val();
            $.ajax({
                url: "technicianEquipment?action=delete", type: "POST", data: {
                    id: id,
                }, success: function (response) {
                    if (response.delete === "success") {
                        deleteImage(id);
                    } else {
                        window.location.replace("technicianEquipment?action=details&equipmentID=" + id + "&delete=failed");
                    }
                }, error: function (xhr, status, error) {
                    console.error("Error deleting equipment: ", error);
                    window.location.replace("technicianEquipment?action=details&equipmentID=" + id + "&delete=failed");
                }
            });
        }
    })
}

function deleteImage() {
    let id = $("#id").val();
    $.ajax({
        url: "UploadServlet?action=deleteImage&id=" + id, type: "POST", success: function (response) {
            window.location.replace(response.url);
        }, error: function (xhr, status, error) {
            console.error("Error deleting image: ", error);
            window.location.replace("technicianEquipment?action=details&equipmentID=" + id + "&delete=failed");
        }
    });
}