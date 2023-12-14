import QtQuick 2.15
import QtQuick.Controls 2.15

Window {
    visible: true
    width: 500
    height: 380
    title: "TCP Client Example"

    Rectangle {
        id: main
        width: parent.width
        height: parent.height
        anchors.centerIn: parent
        color: "blue"
        Column {
            spacing: 20
            anchors.centerIn: parent
            width: parent.width * 0.8

            Text {
                text: "ID"
                font.pixelSize: 18
                color: "#dcdcdc"
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
            }

            Rectangle {
                width: parent.width * 0.7
                height: 50
                color: "#ffffff"
                border.color: "#dcdcdc"
                radius: 5

                TextInput {
                    id: txtid
                    text: "                   "
                    font.pixelSize: 20
                    color: "#191919"
                    font.bold: true
                    focus: true
                }
            }

            Text {
                text: "Password"
                font.pixelSize: 18
                color: "#dcdcdc"
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
            }

            Rectangle {
                width: parent.width * 0.7
                height: 50
                color: "#ffffff"
                border.color: "#dcdcdc"
                radius: 5

                TextInput {
                    id: txtpassword
                    text: "                   "
                    font.pixelSize: 20
                    color: "#191919"
                    font.bold: true
                    focus: true
                }
            }

            Rectangle {
                width: parent.width * 0.7
                height: 50
                radius: 5

                Button {
                    text: "Start"
                    font.pixelSize: 20
                    height: 50
                    width: parent.width
                    font.bold: true
                    anchors.centerIn: parent
                    onClicked: {
                        client.connectToServer(txtid.text, txtpassword.text);
                    }

                    Connections {
                        target: client
                        onClientVerified: {
                            console.log("connections ::::::")
                            mainwindow.visible = true
//                            console.log(receivedImage.scale)
                            receivedImage.source = client.receiveImageFromServer()
//                            receivedImage.source = "data:image/jpeg;base64,iVB\ORw0KGgoAAAANSUhEUgAAABAAAAAQAQMAAAAlPW0iAAAABlBMVEU\AAAD///+l2Z/dAAAAM0lEQVR4nGP4/5/h/1+G/58ZDrAz3D/McH8\yw83NDDeNGe4Ug9C9zwz3gVLMDA/A6P9/AFGGFyjOXZtQAAAAAEl\FTkSuQmCC"
                        }
                    }
                }

            }
        }

    }

    Window {
        id: mainwindow
        visible: false
        width: 1700
        height: 900
        title: qsTr("another window")

        Image {
            id: receivedImage
            width: 1500
            height: 800
            sourceSize.width: 1500
            sourceSize.height: 800
//            source: "file:///C:/Users/longvv/Downloads/screen.png"
//            sourceClipRect: Qt.rect(100, 100, 512, 512)
//            source: "file:///C:/Users/longvv/Downloads/start_token_classification.png"
//            source: "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAUAAAAFCAYAAACNbyblAAAAHElEQVQI12P4//8/w38GIAXDIBKE0DHxgljNBAAO9TXL0Y4OHwAAAABJRU5ErkJggg=="
//            source: "data:image/png;base64,iVB\ORw0KGgoAAAANSUhEUgAAABAAAAAQAQMAAAAlPW0iAAAABlBMVEU\AAAD///+l2Z/dAAAAM0lEQVR4nGP4/5/h/1+G/58ZDrAz3D/McH8\yw83NDDeNGe4Ug9C9zwz3gVLMDA/A6P9/AFGGFyjOXZtQAAAAAEl\FTkSuQmCC"
        }
    }
}


