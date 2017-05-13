var debug = false; // если true то сообщения будут выводиться в консоль
// для вывода сообщения на консоль
var general_count = 0; // для отработки, счетчик для выходы из бесконечных
						// циклов

function console_log(str) {
	if (debug)
		console.log(str);
}

function saveQuery() {
	console_log("START saveQuery " + new Date());
	document.getElementById("query_send_message_id").innerHTML = "";
	var text_area_descr = document.getElementById("query_description");
	if (text_area_descr.value.trim() == "") {
		alert("Ошибка: Поле запроса пустое, необходимо ввести текст перед отправкой!");
		return;
	}
	$.post("ajax_save_query.php", $("#form_id").serialize()).done(
			function(json) {
				refresh_query_table(json);
			});
	text_area_descr.value = "";
	console_log("FINISH saveQuery " + new Date());
}

function changeQueryStatus(idQuery, status) {
	console_log("START changeQueryStatus " + new Date());
	try {
		$.getJSON("ajax_save_query.php", // The server URL
						{
							id : idQuery,
							action : "changeStatus",
							status : status,
							query_patient_number : document
									.getElementsByName('query_patient_number')[0].value,
							query_investigation_name : document
									.getElementsByName('query_investigation_name')[0].value,
							query_visit_name : document
									.getElementsByName('query_visit_name')[0].value,
							query_user_email : document
									.getElementsByName('query_user_email')[0].value
						}, // Data you want to pass to the server.
						refresh_query_table // The function to call on
				// completion.
				);
	} catch (err) {
		console_log(err.message);
	}
	console_log("FINISH changeQueryStatus " + new Date());
}
function refresh_query_table(json) {
	console_log("json:" + JSON.stringify(json));
	try {
		var elmtTable = document.getElementById('query_list');
		var tableRows = elmtTable.getElementsByTagName('tr');
		var rowCount = tableRows.length;
		var userRole = document.getElementById("user_object_role").value;
		console_log("user_object_role="
				+ document.getElementById("user_object_role"));

		for ( var x = rowCount - 1; x > 0; x--) {
			elmtTable.deleteRow(x);
		}
		var queryList = json['query_list'];
		// if (1 == 0)
		for ( var i = 0; i < queryList.length; i++) {
			var row = elmtTable.insertRow(i + 1);
			// Insert new cells (<td> elements) at the 1st and 2nd position
			// of
			// the "new" <tr> element:
			var cell = row.insertCell(0);
			cell.innerHTML = queryList[i].id;
			cell = row.insertCell(1);
			cell.innerHTML = queryList[i].description;
			cell = row.insertCell(2);
			cell.innerHTML = queryList[i].query_status_descr;
			if (queryList[i].query_status_id == 1) {
				cell.style.color = "red";
			} else if (queryList[i].query_status_id == 2) {
				cell.style.color = "GoldenRod";
			} else if (queryList[i].query_status_id == 3) {
				cell.style.color = "green";
			}
			cell = row.insertCell(3);
			cell.innerHTML = queryList[i].open_date;
			cell = row.insertCell(4);
			cell.innerHTML = queryList[i].close_date;
			cell = row.insertCell(5);
			// <a href="" onclick="changeQueryStatus({$item->id}, 'close');
			// return false;"><button>Закрыть</button></a>

			// console_log("user_object_role=" +
			// document.getElementById("user_object_role"));
			var labelBut = "";
			var statusStr = "";
			var createButtonLink = false;
			if ((queryList[i].query_status_id == 1 && userRole == "investigator")
					|| (queryList[i].query_status_id == 2 && userRole == "monitor")) {
				createButtonLink = true;
			}
			if (createButtonLink) {
				if (userRole == "investigator") {
					labelBut = "Выполнено";
					statusStr = "resolve";
				} else if (userRole == "monitor") {
					labelBut = "Закрыть";
					statusStr = "close";
				}
				var anode = document.createElement("a");
				anode.setAttribute("href", "");
				anode.setAttribute("onclick", "changeQueryStatus("
						+ queryList[i].id + ", '" + statusStr
						+ "'); return false;");
				var buttonnode = document.createElement("button");
				var textnode = document.createTextNode(labelBut);
				buttonnode.appendChild(textnode);
				anode.appendChild(buttonnode);
				cell.appendChild(anode);
			}
		}

		if (json.send_mail_result) {
			document.getElementById("query_send_message_id").innerHTML = "<font color='green'>Запрос N "
					+ json['query_num'] + " отправлен</font>";
		} else {
			document.getElementById("query_send_message_id").innerHTML = "<font color='red'>Запрос не отправлен</font>";
		}
	} catch (err) {
		console_log(err.message);
	}
}

function check_uniq_pat_num(obj) {
	// console_log(json);
	obj.value = obj.value.trim();
	// console_log(obj.value);
	// if(1==1) return;
	$.getJSON("ajax_check_patient_number.php", // The server URL
	{
		number : obj.value
	}, // Data you want to pass to the server.
	show_alert_patient_number // The function to call on completion.
	);
}

function show_alert_patient_number(json) {
	// console_log("json:" + json);
	var patientExists = json;
	if (patientExists) {
		alert("Пациент с номером "
				+ document.getElementById("patient_number").value
				+ " уже существует, введите другое значение");
		document.getElementById("patient_number").focus();
		document.getElementById("patient_number").value = "";
	}
}

function add_natinality() {
	var placeForInput = document.getElementById("pole_for_add_nationality");
	// placeForInput.style.color = 'blue';
	var inputTextNew = document.createElement("input");
	inputTextNew.setAttribute("type", "text");
	inputTextNew.setAttribute("size", "20");
	inputTextNew.setAttribute("id", "nationalityNew");
	inputTextNew.setAttribute("name", "nationalityNew");

	var btnAdd = document.createElement("button");
	btnAdd.innerHTML = "Добавить";
	// inputTextNew.setAttribute("size", "20");
	btnAdd.setAttribute("id", "btnAdd");
	btnAdd.setAttribute("name", "btnAdd");
	btnAdd.setAttribute("onclick",
			"return add_natinality_btn('nationalityNew');");

	placeForInput.appendChild(inputTextNew);
	placeForInput.appendChild(btnAdd);
}

function add_natinality_btn(elementId) {
	var valueNew = document.getElementById(elementId).value;
	console_log(valueNew);
	$.getJSON("ajax_add_row.php", // The server URL
	{
		pole : valueNew
	}, // Data you want to pass to the server.
	show // The function to call on completion.
	);
	return false;
}

function show(json) {
	console_log("sss:" + json);
	if (json.id == 0) {
		alert(json.id + " " + json.value);
		return;
	}
	var select = document.getElementById("nationality_id");
	var optionElement = document.createElement("option");
	optionElement.setAttribute("value", json.id);
	/*
	 * for (loop = select.childNodes.length - 1; loop >= 0; loop--) { if
	 * (select.options[loop].selected) { select.options[loop].selected = false; } }
	 */
	if (select.selectedIndex != -1) {
		// Если есть выбранный элемент, отобразить его значение (свойство value)

		// select.options[select.selectedIndex].selected=false;
		select.options[select.selectedIndex].removeAttribute("selected");
	}

	optionElement.setAttribute("selected", "selected");
	optionElement.appendChild(document.createTextNode(json.value));
	select.appendChild(optionElement);
}
/*
 * // This just displays the first parameter passed to it // in an alert.
 * function show(json) { alert(json); }
 * 
 * function run() { $.getJSON("test.php", // The server URL { id : 567, pole:
 * "Пример" }, // Data you want to pass to the server. show // The function to
 * call on completion. ); } // We'll run the AJAX query when the page loads.
 * window.onload = run;
 */