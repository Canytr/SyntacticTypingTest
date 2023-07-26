import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Layouts 1.11
import QtQuick.Controls 2.5


ApplicationWindow {
    id: mainWindow
    //visibility: Window.FullScreen
    visible: true
    width:  1200
    height: 900
    title: qsTr("Hello space");

    Rectangle {
        anchors.fill: parent
        gradient: Gradient{
            GradientStop { position: 0.0; color: "#5E5E5E" }
            GradientStop { position: 1.0; color: "#181818" }
        }
    }

}