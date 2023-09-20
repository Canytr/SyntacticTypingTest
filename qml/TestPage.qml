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
        height: 700
        width: 800
        color: "black"
        radius: 20
    }


    //Editor
    Rectangle{
        id: editorRectangle
        height: 700
        width:  800
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
                //readOnly: true
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
                    var file = Qt.resolvedUrl("../../test/TestPageExample.txt"); // Dosya yolunu belirtin
                    var xhr = new XMLHttpRequest();
                    xhr.open("GET", file);
                    xhr.onreadystatechange = function() {
                        if (xhr.readyState === XMLHttpRequest.DONE) {
                            if (xhr.status === 200) {
                                textArea.text = xhr.responseText; // Metni TextArea'ya atayın
                            } else {
                                console.error("Read Error: " + xhr.statusText);
                            }
                        }
                    };
                    xhr.send();
                }
                
            }
        }
    }

    Rectangle{
        id: typingRectangle  
        y: 750
        //height: openButton.height
        width: 600

        //Typing
        RowLayout
        {
            id:  typingRowLayout
            anchors.fill : parent
            
            TextField {
                id: typingInputField
                width: 600//parent.width
                height: openButton.height
                placeholderText: "Type here"
                color: "black"
                Layout.fillWidth:           true
                font.pixelSize: 20
            }
        }

    }


    
}

    