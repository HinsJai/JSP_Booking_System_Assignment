let index = 0;
let imageID;

function addEquipment() {
    let table = document.getElementById("insertTable");

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
                    cell.innerHTML = "<p class='text-white p-2 '>" + (maxID) + "</p>";
                    break;
                case 1:
                case 3:
                    cell.innerHTML = `<input type="text" class="text-black p-2 rounded-md"  style="width: 90%;"/>`;
                    break;
                case 2:
                    cell.innerHTML = `<select class="text-black p-2 rounded-md" style="width: 90%;" id="type">
                                            <option value="Laptop">Laptop</option>
                                            <option value="Desktop">Desktop</option>
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
                    cell.innerHTML = `<input type="date" class="text-black p-2 rounded-md"  style="width: 90%;"/>`;
                    break;
                case 5:
                    cell.innerHTML = `<input type="number" class="text-black p-2 rounded-md"  style="width: 90%;"/>`;
                    break;
                case 6:
                    cell.innerHTML = `<select class="text-black p-2 rounded-md" style="width: 90%;" id="status">
                                            <option value="Available">Available</option>
                                            <option value="CheckedOut">CheckedOut</option>
                                            <option value="UnderMaintenance">UnderMaintenance</option>
                                            <option value="Damaged">Damaged</option>
                                            <option value="Unavailable">Unavailable</option>
                                        </select>`;
                    break;
                case 7:
                    cell.innerHTML = `<select class="text-black p-2 rounded-md" style="width: 90%;" id="private">
                                            <option value="0">Public</option>
                                            <option value="1">Private</option>
                                        </select>`;
                    break;
                case 8:
                    cell.innerHTML = `<select class="text-black p-2 rounded-md" style="width: 90%;" id="status">
                                            <option value="CW">CW</option>
                                            <option value="LWL">LWL</option>
                                            <option value="ST">ST</option>
                                            <option value="TM">TM</option>
                                            <option value="TY">TY</option>
                                        </select>`;
                    break;
                case 9:
                    cell.innerHTML = `<label class="block mb-2 text-base font-semibold text-gray-900 dark:text-white" for="file_input">Upload file</label><div style="display: flex; align-items: center;">
<input id="${index}" class="block w-full text-sm text-gray-900 border border-gray-300 rounded-lg cursor-pointer bg-gray-50 dark:text-gray-400 focus:outline-none dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400" type="file">
<button class="ml-4 mr-2 bg-red-500 p-2 rounded-md font-semibold text-base hover:bg-green-600" value="${imageID}" type="button" onclick="addFileToList(this.value)">
                    ADD
                    </button>
                    <button class="ml-4 mr-2 bg-red-500 p-2 rounded-md font-semibold text-base hover:bg-green-600" hidden type="button" onclick="removeFile()">
                    REMOVE
                    </button>

                    <button class="ml-4 mr-2 bg-red-500 p-2 rounded-md font-semibold text-base hover:bg-green-600" type="button" onclick="uploadFiles()">
                    Submit
                    </button>
                    </div>`;
                    break;
            }

        }
    });
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
        },
        error: function (xhr, status, error) {
            console.error("Error uploading file: ", error);
        }
    });
}

function uploadFiles() {
    $.ajax({
        url: 'UploadServlet?action=uploadFileList', type: 'POST', success: function (response) {
            console.log("Files uploaded successfully: ", response);
        }, error: function (xhr, status, error) {
            console.error("Error uploading files: ", error);
        }
    });
}
