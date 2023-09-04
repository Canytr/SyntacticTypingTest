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

    Shortcut {
        sequence: "Ctrl+Q"
        onActivated: Qt.quit()
    }

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
        height: Screen.height-80
        width:  Screen.width/6
        Rectangle {
            anchors.fill: parent
            color: "#242424"
        } 

        
        ColumnLayout{
            id: buttonLayout
            anchors.fill: parent
            spacing: 50
      
            Image {
                id:     images
                //x:      10
                //y:      Screen.height -3*(editButton.height/2)
                width : 128
                height: 128
                Layout.fillWidth:           true
                source: "./images.png"

            }
            Button {
                id: testButton
                text: "Test"
                background: Rectangle {
                    color: parent.down ? "#bbbbbb" :
                        (parent.pressed ? "#000000" : "blue")
                    radius: 20
                }
                palette.buttonText: "white"
                //Layout.fillHeight:          true
                Layout.fillWidth:           true
                font.pixelSize: 34

                onClicked: {
                    var component = Qt.createComponent("./TestPage.qml");
                    var page = component.createObject(stack);
                    stack.push(page);
                }   

            }
            Button {
                id: localTestButton
                text: "Local Test"
                background: Rectangle {
                    color: parent.down ? "#bbbbbb" :
                        (parent.pressed ? "#000000" : "blue")
                    radius: 20
                }
                palette.buttonText: "white"
                //Layout.fillHeight:          true
                Layout.fillWidth:           true
                font.pixelSize: 34
                onClicked: {
                    var component = Qt.createComponent("./Editor.qml");
                    var page = component.createObject(stack);
                    stack.push(page);
                }   
            }
            Button {
                id: englishPractiseButton
                text: "English Practise"
                background: Rectangle {
                    color: parent.down ? "#bbbbbb" :
                        (parent.pressed ? "#000000" : "blue")
                    radius: 20
                }
                palette.buttonText: "white"
                //Layout.fillHeight:          true
                Layout.fillWidth:           true
                font.pixelSize: 34
                onClicked: {
                    var component = Qt.createComponent("./EnglishPage.qml");
                    var page = component.createObject(stack);
                    stack.push(page);
                }   
            }
            Button {
                //y: 100
                id: quitButton
                text: "Quit"
                background: Rectangle {
                    color: parent.down ? "#bbbbbb" :
                        (parent.pressed ? "#000000" : "blue")
                    radius: 20
                }
                palette.buttonText: "white"
                //Layout.fillHeight:          true
                Layout.fillWidth:           true
                //anchors.bottom: buttonLayout.bottom
                //anchors.top : parent.top
                font.pixelSize: 34
                //Layout.alignment: Qt.AlignBottom //| Qt.AlignHCenter
                Layout.alignment: Qt.AlignBottom // Align the button to the center horizontally
                //y: 100
                anchors.bottom: buttonLayout.bottom

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

        
        /*Rectangle {
            id: loaderRectangle
            // x:  parent.height/2
            // y:  parent.wiidth/2
            //height: columnLayout2.height/5 //-20
            //width:  columnLayout2.width/5 //-20
            anchors.fill: parent
            color: "black"

            Loader {
                id: loader
                x:  columnLayout2.width/4
                y:  10//columnLayout2.height/3
                //anchors.fill: parent
                //anchors.CenterIn: parent.CenterIn
                //anchors.centerIn: parent
                //anchors.centerIn: parent
                source: "./Editor.qml"
            } 
        }*/
        //Stacked Widget
        StackView {
            id: stack
            //height: 600
            //width: 850
            anchors.fill: parent

            pushEnter: Transition {}
            pushExit: Transition {}
            popEnter: Transition {}
            popExit: Transition {}

            //anchors.fill: parent
            initialItem: loader.item

            Loader {
                id: loader
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