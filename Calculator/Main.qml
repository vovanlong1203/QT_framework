import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Dialogs

Window {
    width: 400
    height: 600
    visible: true
    title: qsTr("Calculator")

    GridLayout {
        columns:1
        anchors.centerIn: parent
        RowLayout {
        anchors.top: parent
        id: row
        Rectangle {
            width: 200
            height: 200

            TextArea {
                Layout.fillWidth: true
                id:txtdisplay
                text: ""
                readOnly: true
                font.pixelSize: 20

            }
        }
    }


        MessageDialog {
            text: ""
            title: "Message read file"
            id: msgRead
            buttons: MessageDialog.Ok

        }

        MessageDialog {
            text: ""
            title: "Message read file"
            id: msgWrite
            buttons: MessageDialog.Ok
        }

        RowLayout {
        anchors.bottom: parent
        focus: true
        id: row1
        function buttonClick(button) {
            var temp = txtdisplay.text;
            if (button.text == '+' || button.text == '-' || button.text == '*'|| button.text == '/') {
                txtdisplay.text += "\n";
            }
            else if (temp.charAt(temp.length-1) == "+"||temp.charAt(temp.length-1) == "-"||temp.charAt(temp.length-1) == "*"||temp.charAt(temp.length-1) == "/" ){
                txtdisplay.text += "\n";
            }

            console.log("click ", button.text);
            txtdisplay.text += button.text;
        }

        function removeItem() {
            var temp = txtdisplay.text
            var text = ""
            for (var i = 0; i < temp.length-1; i++) {
              text += temp.charAt(i)
            }
            txtdisplay.text = text
        }

        function calculator() {
            var temp = txtdisplay.text, count
            console.log(temp)
            console.log("length ", temp.length)
            temp = temp.split("\n")

            if (temp.length == 1) {
                txtdisplay.text = temp[0]
            }
            else {
                switch(temp[1]) {
                case "+":
                    txtdisplay.text = Number(temp[0]) + Number(temp[2])
                    break;
                case "-":
                    txtdisplay.text = Number(temp[0]) - Number(temp[2])
                    break;
                case "*":
                    txtdisplay.text = Number(temp[0]) * Number(temp[2])
                    break
                case "/":
                    txtdisplay.text = Number(temp[0]) / Number(temp[2])
                    break;
                default:
                    txtdisplay.text = "loi"
                    break
                }
            }
        }

        function removeAllItem() {
            txtdisplay.text = ""
        }

        Keys.onPressed: (event) => {
            switch (event.key) {
            case Qt.Key_0:
                buttonClick(a0)
                break
            case Qt.Key_1:
                buttonClick(a1)
                break
            case Qt.Key_2:
                buttonClick(a2)
                break
            case Qt.Key_3:
                buttonClick(a3)
                break
            case Qt.Key_4:
                buttonClick(a4)
                break
            case Qt.Key_5:
                buttonClick(a5)
                break
            case Qt.Key_6:
                buttonClick(a6)
                break
            case Qt.Key_7:
                buttonClick(a7)
                break
            case Qt.Key_8:
                buttonClick(a8)
                break
            case Qt.Key_9:
                buttonClick(a9)
                break
            case Qt.Key_Plus:
                buttonClick(cong)
                break
            case Qt.Key_Minus:
                buttonClick(tru)
                break
            case Qt.Key_Asterisk:
                buttonClick(nhan)
                break
            case Qt.Key_Slash:
                buttonClick(chia)
                break
            case Qt.Key_Enter:
                buttonClick(bang)
                break
            case Qt.Key_Return:
                row1.calculator()
                break
            case Qt.Key_Comma:
            case Qt.Key_Period:
                buttonClick(acham)
                break
            case Qt.Key_Backspace:
                row1.removeItem()
                break;
            }
        }

        GridLayout {
            columns: 4
            columnSpacing: 25
            rowSpacing: 8
            Button {
                text: "1"
                id: a1
                width: 93
                height: 93
                leftPadding: 15
                rightPadding: 15
                font.pixelSize: 30
                onClicked: row1.buttonClick(this)
            }

            Button {
                text: "2"
                id: a2
                width: 93
                height: 93
                leftPadding: 15
                rightPadding: 15
                font.pixelSize: 30
                onClicked: row1.buttonClick(this)
            }

            Button {
                text: "3"
                id: a3
                width: 93
                height: 93
                leftPadding: 15
                rightPadding: 15
                font.pixelSize: 30
                onClicked: row1.buttonClick(this)
            }

            Button {
                text: "C"
                id: xoaC
                width: 93
                height: 93
                leftPadding: 15
                rightPadding: 15
                font.pixelSize: 30
                onClicked: row1.removeItem()
            }

            Button {
                text: "4"
                id: a4
                width: 93
                height: 93
                leftPadding: 15
                rightPadding: 15
                font.pixelSize: 30
                onClicked: row1.buttonClick(this)
            }

            Button {
                text: "5"
                id: a5
                width: 93
                height: 93
                leftPadding: 15
                rightPadding: 15
                font.pixelSize: 30
                onClicked: row1.buttonClick(this)
            }

            Button {
                text: "6"
                id: a6
                width: 93
                height: 93
                leftPadding: 15
                rightPadding: 15
                font.pixelSize: 30
                onClicked: row1.buttonClick(this)
            }

            Button {
                text: "AC"
                id: ac
                width: 93
                height: 93
                leftPadding: 5
                rightPadding: 5
                font.pixelSize: 30
                onClicked: row1.removeAllItem()
            }

            Button {
                text: "7"
                id: a7
                width: 93
                height: 93
                leftPadding: 15
                rightPadding: 15
                font.pixelSize: 30
                onClicked: row1.buttonClick(this)
            }

            Button {
                text: "8"
                id: a8
                width: 93
                height: 93
                leftPadding: 15
                rightPadding: 15
                font.pixelSize: 30
                onClicked: row1.buttonClick(this)
            }

            Button {
                text: "9"
                id: a9
                width: 93
                height: 93
                leftPadding: 15
                rightPadding: 15
                font.pixelSize: 30
                onClicked: row1.buttonClick(this)
            }

            Button {
                text: "OK"
                id: ok
                width: 93
                height: 93
                leftPadding: 2
                rightPadding: 2
                font.pixelSize: 30
                onClicked: {
                    console.log("display text: ", txtdisplay.text);
                    msgWrite.text = "Ghi file thanh cong";
                    test.appendFile(txtdisplay.text);
                    msgWrite.open();
                }
            }

            Button {
                text: "0"
                id: a0
                width: 93
                height: 93
                leftPadding: 15
                rightPadding: 15
                font.pixelSize: 30
                onClicked: row1.buttonClick(this)
            }

            Button {
                text: "."
                id: acham
                width: 93
                height: 93
                leftPadding: 26
                rightPadding: 15
                font.pixelSize: 30
                onClicked: row1.buttonClick(this)
            }

            Button {
                text: "="
                id: bang
                width: 93
                height: 93
                leftPadding: 12
                rightPadding: 15
                font.pixelSize: 30
                onClicked: row1.calculator()
            }

            Button {
                text: "R"
                id: r
                width: 93
                height: 93
                leftPadding: 15
                rightPadding: 15
                font.pixelSize: 30
                onClicked: {
                    msgRead.text = test.readFile_tmp(txtdisplay.text);
                    msgRead.open();
                }
            }

            Button {
                text: "+"
                id: cong
                width: 93
                height: 93
                leftPadding: 13
                rightPadding: 15
                font.pixelSize: 30
                onClicked: row1.buttonClick(this)
            }

            Button {
                text: "-"
                id: tru
                width: 93
                height: 93
                leftPadding: 20
                rightPadding: 15
                font.pixelSize: 30
                onClicked: row1.buttonClick(this)
            }

            Button {
                text: "*"
                id: nhan
                width: 93
                height: 93
                leftPadding: 20
                rightPadding: 15
                font.pixelSize: 30
                onClicked: row1.buttonClick(this)
            }

            Button {
                text: "/"
                id: chia
                width: 93
                height: 93
                leftPadding: 20
                rightPadding: 15
                font.pixelSize: 30
                onClicked: row1.buttonClick(this)
            }
        }
    }

    RowLayout {
        anchors.bottom: parent
        Button {
            text: "down"
            id: shutdown
            leftPadding: 20
            rightPadding: 15
            font.pixelSize: 30
            onClicked: close()
        }
    }

    }
}

