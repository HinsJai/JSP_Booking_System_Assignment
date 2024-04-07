let index = 0;
let imageID;
// let tempListMaxID = 0;
// let tempIndex = 1;

function addNewEquipment() {
    let table = document.getElementById("insertTable");

    let today = getToday();

    getMaxID(function (maxID) {
        let row = table.insertRow(1);
        maxID += index;
        imageID = maxID;
        row.className = "odd:bg-white odd:dark:bg-gray-900 even:bg-gray-50 even:dark:bg-gray-800 border-b dark:border-gray-700";

        for (let i = 0; i < 10; i++) {
            let cell = row.insertCell(i);
            cell.className = "px-2 py-2 font-semibold text-gray-900 text-xl";
            switch (i) {
                case 0:
                    cell.innerHTML = `<p class="text-white p-2" id="id_${imageID}">` + (maxID) + "</p>";
                    break;
                case 1:
                    cell.innerHTML = `<input type="text" id="name_${imageID}" class="text-black p-2 rounded-md"  style="width: 90%;"/>`;
                    break;
                case 3:
                    cell.innerHTML = `<input type="text" id="sNo_${imageID}" class="text-black p-2 rounded-md"  style="width: 90%;"/>`;
                    break;
                case 2:
                    cell.innerHTML = `<select class="text-black p-2 rounded-md" style="width: 90%;" id="type_${imageID}">
                                            <option value="Laptop">Laptop</option>
                                            <option value="Tablet">Tablet</option>
                                            <option value="Printer and Scanner">Printer and Scanner</option>
                                            <option value="SmartPhone">SmartPhone</option>
                                            <option value="Projector">Projector</option>
                                            <option value="Monitor">Monitor</option>
                                            <option value="robot">Robot</option>
                                            <option value="Server">Server</option>
                                             <option value="Networking">Networking</option>
                                              <option value="Audio-Visual">Audio-Visual</option>
                                             <option value="Networking">Others</option>
                                        </select>`;
                    break;
                case 4:
                    cell.innerHTML = `<input type="date" class="text-black p-2 rounded-md" id="pDate_${imageID}" max="${today}"  style="width: 90%;"/>`;
                    break;
                case 5:
                    cell.innerHTML = `<input type="number" class="text-black p-2 rounded-md" id="wPeriod_${imageID}" style="width: 90%;"/>`;
                    break;
                case 6:
                    cell.innerHTML = `<select class="text-black p-2 rounded-md" style="width: 90%;" id="status_${imageID}">
                                            <option value="Available">Available</option>
                                            <option value="CheckedOut">CheckedOut</option>
                                            <option value="UnderMaintenance">UnderMaintenance</option>
                                            <option value="Damaged">Damaged</option>
                                            <option value="Unavailable">Unavailable</option>
                                        </select>`;
                    break;
                case 7:
                    cell.innerHTML = `<select class="text-black p-2 rounded-md" style="width: 90%;" id="isPrivate_${imageID}">
                                            <option value="0">Public</option>
                                            <option value="1">Private</option>
                                        </select>`;
                    break;
                case 8:
                    cell.innerHTML = `<select class="text-black p-2 rounded-md" style="width: 90%;" id="campus_${imageID}">
                                            <option value="CW">CW</option>
                                            <option value="LWL">LWL</option>
                                            <option value="ST">ST</option>
                                            <option value="TM">TM</option>
                                            <option value="TY">TY</option>
                                        </select>`;
                    break;
                case 9:
                    cell.innerHTML = `<label class="block mb-2 text-base font-semibold text-gray-900 dark:text-white" for="file_input">Upload file</label>
<div style="display: flex; align-items: center;">
<input id="${index}" class="block w-full text-sm text-gray-900 border border-gray-300 rounded-lg cursor-pointer bg-gray-50 dark:text-gray-400 focus:outline-none dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400" type="file">
<button class="ml-4 mr-4 bg-red-500 p-2 rounded-md font-semibold text-base hover:bg-green-600" value="${imageID}" type="button" onclick="addFileToList(this.value)">
                    ADD
                    </button>
                    </div>`;
                    break;
            }

        }
    });
    index++;
}

function addEquipment(tempListMaxID) {
    let table = document.getElementById("insertTable");

    let today = getToday();

    let row = table.insertRow(1);
    tempListMaxID += (1 + index);
    imageID = tempListMaxID;
    row.className = "odd:bg-white odd:dark:bg-gray-900 even:bg-gray-50 even:dark:bg-gray-800 border-b dark:border-gray-700";

    for (let i = 0; i < 10; i++) {
        let cell = row.insertCell(i);
        cell.className = "px-2 py-2 font-semibold text-gray-900 text-xl";
        switch (i) {
            case 0:
                cell.innerHTML = `<p class="text-white p-2" id="id_${imageID}">` + (tempListMaxID) + "</p>";
                break;
            case 1:
                cell.innerHTML = `<input type="text" id="name_${imageID}" class="text-black p-2 rounded-md"  style="width: 90%;"/>`;
                break;
            case 3:
                cell.innerHTML = `<input type="text" id="sNo_${imageID}" class="text-black p-2 rounded-md"  style="width: 90%;"/>`;
                break;
            case 2:
                cell.innerHTML = `<select class="text-black p-2 rounded-md" style="width: 90%;" id="type_${imageID}">
                                            <option value="Laptop">Laptop</option>
                                            <option value="Tablet">Tablet</option>
                                            <option value="Printer and Scanner">Printer and Scanner</option>
                                            <option value="SmartPhone">SmartPhone</option>
                                            <option value="Projector">Projector</option>
                                            <option value="Monitor">Monitor</option>
                                            <option value="robot">Robot</option>
                                            <option value="Server">Server</option>
                                             <option value="Networking">Networking</option>
                                              <option value="Audio-Visual">Audio-Visual</option>
                                             <option value="Networking">Others</option>
                                        </select>`;
                break;
            case 4:
                cell.innerHTML = `<input type="date" class="text-black p-2 rounded-md" id="pDate_${imageID}" max="${today}"  style="width: 90%;"/>`;
                break;
            case 5:
                cell.innerHTML = `<input type="number" class="text-black p-2 rounded-md" id="wPeriod_${imageID}" style="width: 90%;"/>`;
                break;
            case 6:
                cell.innerHTML = `<select class="text-black p-2 rounded-md" style="width: 90%;" id="status_${imageID}">
                                            <option value="Available">Available</option>
                                            <option value="CheckedOut">CheckedOut</option>
                                            <option value="UnderMaintenance">UnderMaintenance</option>
                                            <option value="Damaged">Damaged</option>
                                            <option value="Unavailable">Unavailable</option>
                                        </select>`;
                break;
            case 7:
                cell.innerHTML = `<select class="text-black p-2 rounded-md" style="width: 90%;" id="isPrivate_${imageID}">
                                            <option value="0">Public</option>
                                            <option value="1">Private</option>
                                        </select>`;
                break;
            case 8:
                cell.innerHTML = `<select class="text-black p-2 rounded-md" style="width: 90%;" id="campus_${imageID}">
                                            <option value="CW">CW</option>
                                            <option value="LWL">LWL</option>
                                            <option value="ST">ST</option>
                                            <option value="TM">TM</option>
                                            <option value="TY">TY</option>
                                        </select>`;
                break;
            case 9:
                cell.innerHTML = `<label class="block mb-2 text-base font-semibold text-gray-900 dark:text-white" for="file_input">Upload file</label>
<div style="display: flex; align-items: center;">
<input id="${index + 1}" class="block w-full text-sm text-gray-900 border border-gray-300 rounded-lg cursor-pointer bg-gray-50 dark:text-gray-400 focus:outline-none dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400" type="file">
<button class="ml-4 mr-2 bg-red-500 p-2 rounded-md font-semibold text-base hover:bg-green-600" value="${imageID}" type="button" onclick="addFileToList(this.value)">
                    ADD
                    </button>
                    </div>`;
                break;
        }
    }
    index++;
}

function getMaxID(callback) {

    // AJAX request to the servlet for getting maxID
    $.ajax({
        url: 'createEquipment?action=getMaxID', type: 'POST', data: {action: 'getMaxID'}, success: function (response) {
            let maxID = response.maxID;
            console.log("Max ID received from the servlet: ", maxID);
            callback(maxID);
        }, error: function (xhr, status, error) {
            console.error("Error fetching maxID: ", error);
            callback(0); // Default to 0 on error
        }
    });
}

function addFileToList(imageID) {

    let formData = new FormData();
    let fileInputId = index.toString();
    let fileInput = document.getElementById(fileInputId);

    console.log("imageID: ", imageID);
    console.log("fileInput: ", fileInput);
    let file = fileInput.files[0];
    formData.append("file", file);

    $.ajax({
        url: 'UploadServlet?action=addToTempFileList&imageID=' + imageID,
        type: 'POST',
        data: formData,
        contentType: false,
        processData: false,
        success: function (response) {
            console.log("File uploaded successfully: ", response);
            addEquipmentToList(imageID);
        },
        error: function (xhr, status, error) {
            console.error("Error uploading file: ", error);
        }
    });
}

function addEquipmentToList(imageID) {
    let id = $("#id_" + imageID).text().trim();
    let name = $("#name_" + imageID).val().trim();
    let type = $("#type_" + imageID).val();
    let sNo = $("#sNo_" + imageID).val().trim();
    let pDate = $("#pDate_" + imageID).val().trim();
    let wPeriod = $("#wPeriod_" + imageID).val().trim();
    let status = $("#status_" + imageID).val();
    let isPrivate = $("#isPrivate_" + imageID).val();
    // let isPrivate = 1;
    let campus = $("#campus_" + imageID).val();

    $.ajax({
        url: 'createEquipment?action=addToTempList', type: 'POST', data: {
            id: id,
            name: name,
            type: type,
            sNo: sNo,
            pDate: pDate,
            wPeriod: wPeriod,
            status: status,
            isPrivate: isPrivate,
            campus: campus
        }, success: function (response) {
            window.location.replace(response.url);
        }, error: function (xhr, status, error) {
            console.error("Error adding equipment: ", error);
        }
    });
}

function addToDB() {
    $.ajax({
        url: 'UploadServlet?action=uploadFileList', type: 'POST', success: function (response) {
            // console.log("Files uploaded successfully: ", response);
            addEquipmentToDB();
        }, error: function (xhr, status, error) {
            console.error("Error uploading files: ", error);
        }
    });
}

function addEquipmentToDB() {
    $.ajax({
        url: 'createEquipment?action=addEquipmentToDB', type: 'POST', success: function (response) {
            console.log("Equipment added successfully: ", response);
            window.location.replace(response.url);
        }, error: function (xhr, status, error) {
            console.error("Error adding equipment: ", error);
        }
    });
}

function getToday() {
    let today = new Date();
    let dd = String(today.getDate()).padStart(2, '0');
    let mm = String(today.getMonth() + 1).padStart(2, '0');
    let yyyy = today.getFullYear();
    today = yyyy + '-' + mm + '-' + dd;
    return today;
}

function removeEquipment(id) {
    $.ajax({
        url: 'createEquipment?action=removeEquipment', type: 'POST', data: {id: id}, success: function (response) {
            console.log("Equipment removed successfully: ", response);
            removeImageTemp(id, response.url);
        }, error: function (xhr, status, error) {
            console.error("Error removing equipment: ", error);
        }
    });
}

function removeImageTemp(id, url) {
    $.ajax({
        url: 'UploadServlet?action=removeFile', type: 'POST', data: {id: id}, success: function (response) {
            console.log("Image removed successfully: ", response);
            window.location.replace(url);
        }, error: function (xhr, status, error) {
            console.error("Error removing image: ", error);
        }
    });
}

