import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Layouts 1.11
import QtQuick.Controls 2.5
import QtQuick.Dialogs 6.2


ApplicationWindow {
    id: mainWindow
    //visibility: Window.FullScreen
    visible: true
    width:  Screen.width//1200
    height: Screen.height//900
    title: qsTr("Welcome Typing Test");

    Rectangle {
        anchors.fill: parent
        gradient: Gradient{
            GradientStop { position: 0.0; color: "#5E5E5E" }
            GradientStop { position: 1.0; color: "#181818" }
        }
    }   

    ColumnLayout {
        id: columnLayout1
        x:  0
        y:  0
        height: Screen.height
        width:  Screen.width/6
        Rectangle {
            anchors.fill: parent
            color: "#242424"
        } 

        
        ColumnLayout{
            id: buttonLayout
            anchors.fill: parent
            //spacing: 10

            Button {
                id: testButton
                text: "Test"
                background: Rectangle { color: "blue" ; radius: 5}
                palette.buttonText: "white"
                font.pixelSize: 24
                onClicked: {
                    
                }   

            }

            Button {
                id: localTestButton
                text: "Local Test"
                background: Rectangle { color: "blue" ; radius: 5}
                palette.buttonText: "white"
                font.pixelSize: 24
                onClicked: {
                }   
            }
            Button {
                id: quitButton
                text: "Quit"
                background: Rectangle { color: "blue" ; radius: 5}
                palette.buttonText: "white"
                font.pixelSize: 24
                onClicked: {
                    Qt.quit();
                }   
            }
        }



    }

    ColumnLayout {
        id: columnLayout2
        x:  Screen.width/6
        y:  0
        height: Screen.height
        width:  4*(Screen.width/6)
        // Rectangle {
        //     anchors.fill: parent
        //     color: "blue"
        // }  

        
        Rectangle {
            id: loaderRectangle
            x:  columnLayout1.width +10
            y:  10
            height: columnLayout2.height -20
            width:  columnLayout2.width -20
            color: "red"

            Loader {
                id: loader
                //x:  1000//columnLayout2.width/2
                //y:  1000
                anchors.fill: parent
                source: "./Editor.qml"
            } 
        }

    }
    ColumnLayout {
        id: columnLayout3
        x:  5*(Screen.width/6)
        y:  0
        height: Screen.height
        width:  Screen.width/6
        Rectangle {
            anchors.fill: parent
            color: "#242424"
        }   
    }

}