import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Window 2.15

ApplicationWindow {
    visible: true
    width: 400
    height: 300
    title: "Remote Desktop"
    color: "#191919"

    property var ip : "123456"
    property var password: "123456"

    Rectangle {
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

                Text {
                    text: ip
                    font.pixelSize: 20
                    color: "#191919"
                    font.bold: true
                    anchors.centerIn: parent
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

                Text {
                    text: password
                    font.pixelSize: 20
                    color: "#191919"
                    font.bold: true
                    anchors.centerIn: parent
                }
            }

        }
    }

}
