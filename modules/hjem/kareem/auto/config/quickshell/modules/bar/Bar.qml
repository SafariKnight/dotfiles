import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
import "root:/services"
import "root:/widgets"

Scope {
    Variants {
        model: Quickshell.screens

        PanelWindow {
            id: root
            property var modelData
            color: "transparent"
            anchors {
                left: true
                bottom: true
                top: true
            }
        }
    }
}
