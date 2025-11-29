import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import Quickshell 1.0
import Quickshell.Notifications 1.0

ShellWindow {
    id: notifPanel
    anchors.top: true
    anchors.right: true
    width: 320
    color: "#1a1a1acc"
    visible: true
    layerShellLayer: LayerShell.TopLayer
    layerShellExclusiveZone: 0
    layerShellKeyboardFocus: LayerShell.NoFocus

    ColumnLayout {
        anchors.fill: parent
        spacing: 6
        padding: 8

        NotificationModel {
            id: notifs
        }

        Repeater {
            model: notifs

            delegate: Frame {
                Layout.fillWidth: true
                background: Rectangle {
                    color: "#2a2a2a"
                    radius: 6
                }

                Column {
                    padding: 8
                    spacing: 4

                    Text {
                        text: model.summary
                        color: "white"
                        font.bold: true
                        wrapMode: Text.Wrap
                    }

                    Text {
                        text: model.body
                        color: "#cccccc"
                        wrapMode: Text.Wrap
                    }

                    Button {
                        text: "Dismiss"
                        onClicked: notifs.close(model.id)
                    }
                }
            }
        }
    }
}
