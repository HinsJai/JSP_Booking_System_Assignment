let index = 0;
let tempListIndex = 1;


function addUser(tempListMaxID) {
    let table = document.getElementById("insertTable");

    // getMaxID(function (maxID) {
    let row = table.insertRow(1);
    tempListMaxID += tempListIndex;
    row.className = "odd:bg-white odd:dark:bg-gray-900 even:bg-gray-50 even:dark:bg-gray-800 border-b dark:border-gray-700";

    for (let i = 0; i < 10; i++) {
        let cell = row.insertCell(i);
        cell.className = "px-2 py-2 font-semibold text-gray-900 text-xl";
        switch (i) {
            case 0:
                cell.innerHTML = `<p class="text-white p-2" id="id_${tempListMaxID}">` + (tempListMaxID) + "</p>";
                break;
            case 1:
                cell.innerHTML = `<input type="text" id="email_${tempListMaxID}" class="text-black p-2 rounded-md"  style="width: 90%;"/>`;
                break;

            case 2:
                cell.innerHTML = `<input type="text" id="password_${tempListMaxID}" class="text-black p-2 rounded-md"  style="width: 90%;"/>`;
                break;
            case 3:
                cell.innerHTML = `<input type="text" id="fName_${tempListMaxID}" class="text-black p-2 rounded-md"  style="width: 90%;"/>`;
                break;
            case 4:
                cell.innerHTML = `<input type="text" id="lName_${tempListMaxID}" class="text-black p-2 rounded-md"  style="width: 90%;"/>`;
                break;
            case 5:
                cell.innerHTML = `<select class="text-black p-2 rounded-md" style="width: 90%;" id="gender_${tempListMaxID}">
                                              <option value="M">M</option>
                                             <option value="F">F</option>
                                        </select>`;
                break;
            case 6:
                cell.innerHTML = `<input type="number" min="8" max="8" id="contact_${tempListMaxID}" class="text-black p-2 rounded-md"  style="width: 90%;"/>`;
                break;
            case 7:
                cell.innerHTML = `<select class="text-black p-2 rounded-md" style="width: 90%;" id="root_${tempListMaxID}">
                                            <option value="User">User</option>
                                            <option value="Staff">Staff</option>
                                            <option value="Technician">Technician</option>
                                            <option value="Technician_admin">Technician admin</option>
                                            <option value="Courier">Courier</option>
                                        </select>`;
                break;
            case 8:
                cell.innerHTML = `<select class="text-black p-2 rounded-md" style="width: 90%;" id="campus_${tempListMaxID}">
                        <option value="CW">CW</option>
                        <option value="LWL">LWL</option>
                        <option value="ST">ST</option>
                        <option value="TM">TM</option>
                        <option value="TY">TY</option>
                    </select>`
                break;

            case 9:
                cell.innerHTML = ` <button class="ml-4 mr-4 bg-red-500 p-2 rounded-md font-semibold text-base hover:bg-green-600"
                            value="${tempListMaxID}" type="button" onClick="addUserToTempList(this.value)">
                        ADD
                    </button>`;
                break;

        }
    }
    // });
    tempListIndex++;
}

function addNewUser() {
    let table = document.getElementById("insertTable");

    getMaxID(function (maxID) {
        let row = table.insertRow(1);
        maxID += index;

        row.className = "odd:bg-white odd:dark:bg-gray-900 even:bg-gray-50 even:dark:bg-gray-800 border-b dark:border-gray-700";

        for (let i = 0; i < 10; i++) {
            let cell = row.insertCell(i);
            cell.className = "px-2 py-2 font-semibold text-gray-900 text-xl";
            switch (i) {
                case 0:
                    cell.innerHTML = `<p class="text-white p-2" id="id_${maxID}">` + (maxID) + "</p>";
                    break;
                case 1:
                    cell.innerHTML = `<input type="text" id="email_${maxID}" class="text-black p-2 rounded-md"  style="width: 90%;"/>`;
                    break;

                case 2:
                    cell.innerHTML = `<input type="text" id="password_${maxID}" class="text-black p-2 rounded-md"  style="width: 90%;"/>`;
                    break;
                case 3:
                    cell.innerHTML = `<input type="text" id="fName_${maxID}" class="text-black p-2 rounded-md"  style="width: 90%;"/>`;
                    break;
                case 4:
                    cell.innerHTML = `<input type="text" id="lName_${maxID}" class="text-black p-2 rounded-md"  style="width: 90%;"/>`;
                    break;
                case 5:
                    cell.innerHTML = `<select class="text-black p-2 rounded-md" style="width: 90%;" id="gender_${maxID}">
                                              <option value="M">M</option>
                                             <option value="F">F</option>
                                        </select>`;
                    break;
                case 6:
                    cell.innerHTML = `<input type="number" min="8" max="8" id="contact_${maxID}" class="text-black p-2 rounded-md"  style="width: 90%;"/>`;
                    break;
                case 7:
                    cell.innerHTML = `<select class="text-black p-2 rounded-md" style="width: 90%;" id="root_${maxID}">
                                            <option value="User">User</option>
                                            <option value="Staff">Staff</option>
                                            <option value="Technician">Technician</option>
                                            <option value="Technician_admin">Technician admin</option>
                                            <option value="Courier">Courier</option>
                                        </select>`;
                    break;
                case 8:
                    cell.innerHTML = `<select class="text-black p-2 rounded-md" style="width: 90%;" id="campus_${maxID}">
                        <option value="CW">CW</option>
                        <option value="LWL">LWL</option>
                        <option value="ST">ST</option>
                        <option value="TM">TM</option>
                        <option value="TY">TY</option>
                    </select>`
                    break;

                case 9:
                    cell.innerHTML = ` <button class="ml-4 mr-4 bg-red-500 p-2 rounded-md font-semibold text-base hover:bg-green-600"
                            value="${maxID}" type="button" onClick="addUserToTempList(this.value)">
                        ADD
                    </button>`;
                    break;

            }
        }
    });
    index++;
}

function getMaxID(callback) {

    $.ajax({
        url: 'userManagement?action=getMaxID', type: 'POST', data: {action: 'getMaxID'}, success: function (response) {
            let maxID = response.maxID;
            console.log("Max ID received from the servlet: ", maxID);
            callback(maxID);
        }, error: function (xhr, status, error) {
            console.error("Error fetching maxID: ", error);
            callback(0);
        }
    });
}

function addUserToTempList(userID) {
    console.log("Adding user to temp list with ID: ", userID);
    let email = $(`#email_${userID}`).val().trim();
    let password = $(`#password_${userID}`).val().trim();
    let fName = $(`#fName_${userID}`).val().trim();
    let lName = $(`#lName_${userID}`).val().trim();
    let gender = $(`#gender_${userID}`).val();
    let contact = $(`#contact_${userID}`).val().trim();
    let root = $(`#root_${userID}`).val();
    let campus = $(`#campus_${userID}`).val();

    if (email === "" || password === "" || fName === "" || lName === "" || contact === "" || root === "" || campus === "") {
        Swal.fire({
            title: 'Please fill in all fields', icon: 'error'
        });
        return;
    }

    $.ajax({
        url: 'userManagement?action=addUserToTempList', type: 'POST', data: {
            userID: userID,
            email: email,
            password: password,
            fName: fName,
            lName: lName,
            gender: gender,
            contact: contact,
            root: root,
            campus: campus
        }, success: function (response) {
            if (response.addUserToTempList === "success") {
                window.location.replace("userManagement?action=createUser&add=success");
            } else {
                window.location.replace("userManagement?action=createUser&add=failed");
            }
        }
    });
}

function removeTempUser(userID) {
    $.ajax({
        url: 'userManagement?action=removeTempUser',
        type: 'POST',
        data: {userID: userID},
        success: function (response) {
            if (response.removeTempUser === "success") {
                window.location.replace("userManagement?action=createUser&removeTempUser=success");
            } else {
                window.location.replace("userManagement?action=createUser&removeTempUser=failed");
            }
        }
    });
}

function addToDB() {
    $.ajax({
        url: 'userManagement?action=addUserTempToDB',
        type: 'POST',
        success: function (response) {
            if (response.addUserTempToDB === "success") {
                window.location.replace("userManagement?action=createUser&addToDB=success");
            } else {
                window.location.replace("userManagement?action=createUser&addToDB=failed");
            }
        }
    });
}