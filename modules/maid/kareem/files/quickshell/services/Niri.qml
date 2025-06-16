pragma Singleton
import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root;
    property QtObject niri;
    Socket {
        path: `${Quickshell.env("NIRI_SOCKET")}`
        connected: true

        Component.onCompleted: {
            write(`"EventStream"\n`);
            flush();
        }

        onConnectedChanged: {
            console.log(connected ? "new connection!" : "connection dropped!");
        }

        parser: SplitParser {
            onRead: data => root.niri = JSON.parse(data)
        }
    }
}
