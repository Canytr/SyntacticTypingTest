import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Layouts 1.11
import QtQuick.Controls 2.5
import QtQuick.Dialogs 6.2


Item{

    id:testItem
    //height: 650

    /*Rectangle{
        anchors.fill: parent
        //height: 600
        //width: 600
        color: "blue"
    }*/

    Rectangle{
        //anchors.fill: parent
        height: 600
        width: 600
        color: "black"
        radius: 20
    }


    //Editor
    Rectangle{
        id: editorRectangle
        height: 550
        width:  600
        color: "transparent"
        
        ScrollView {
            id: view
            width: 600
            anchors.fill: parent        
            ScrollBar.vertical.policy: ScrollBar.AsNeeded
            ScrollBar.horizontal.policy: ScrollBar.AsNeeded

            TextArea {
                id: textArea
                height: 550
                width: 600
                //placeholderText: qsTr("Enter description")
                font.pixelSize: 20
                color: "white"
                onCursorPositionChanged: {
                        cursorHighlight.y = cursorRectangle.y
                }
                Keys.onPressed: {
                        cursorHighlight.y = cursorRectangle.y
                }
                Rectangle {
                    id: cursorHighlight
                    width: textArea.width
                    height: textArea.cursorRectangle.height
                    color: "yellow"
                    opacity: 0.5
                    y: textArea.cursorRectangle.y
                    visible: textArea.activeFocus
                    radius: 20
                }
                Component.onCompleted: {
                    // Dosyayı okuma işlemi
                    var file = Qt.resolvedUrl("/home/can/Data/gcode/NC_Program"); // Dosya yolunu belirtin
                    var xhr = new XMLHttpRequest();
                    xhr.open("GET", file);
                    xhr.onreadystatechange = function() {
                        if (xhr.readyState === XMLHttpRequest.DONE) {
                            if (xhr.status === 200) {
                                textArea.text = xhr.responseText; // Metni TextArea'ya atayın
                            } else {
                                console.error("Dosya okuma hatası: " + xhr.statusText);
                            }
                        }
                    };
                    xhr.send();
                }
                
            }
        }
    }


    
}

    