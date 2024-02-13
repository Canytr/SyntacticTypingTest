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
                wrapMode: Text.Wrap
                textFormat: TextEdit.AutoText
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
                width: 600
                placeholderText: "Type here"
                color: "black"
                Layout.fillWidth: true
                font.pixelSize: 20

                Keys.onPressed: {
                    if (event.key === Qt.Key_Return) { // Enter tuşuna basıldığını kontrol et
                        var enteredText = typingInputField.text.trim(); // Girilen metni al, boşlukları kaldır
                        var firstLine = textArea.text.split("\n")[0].trim(); // TextArea'daki ilk satırı al, boşlukları kaldır

                        if (enteredText === firstLine) { // Metinler aynı mı kontrol et
                            var lineIndex = textArea.text.indexOf(firstLine); // İlk satırın indeksini bul

                            // Doğruysa yeşil bir rectangle ekle
                            var greenRect = Qt.createQmlObject('import QtQuick 2.15; Rectangle {color: "green"; radius:20 ; width: parent.width; height: textArea.font.pixelSize + 2; opacity: 0.5;}', textArea, 'greenRect');
                            greenRect.y = cursorHighlight.y;
                            greenRect.z = -1; // Metnin altında görünmesi için z sırasını ayarla

                            // İlk satırın altına eklemek için
                            textArea.text = textArea.text.slice(0, lineIndex + firstLine.length) + textArea.text.slice(lineIndex + firstLine.length);
                            cursorHighlight.y += textArea.font.pixelSize + 2; // Yeni satıra geçmek için imleci taşı
                            typingInputField.text = ""; // TextField'ı temizle
                            typingInputField.forceActiveFocus(); // TextField'a odaklan
                        } else {
                            // Yanlışsa kırmızı bir rectangle ekle
                            var redRect = Qt.createQmlObject('import QtQuick 2.15; Rectangle {color: "red"; width: parent.width; height: textArea.font.pixelSize + 2; opacity: 0.5;}', textArea, 'redRect');
                            redRect.y = cursorHighlight.y;
                            redRect.z = -1; // Metnin altında görünmesi için z sırasını ayarla
                        }
                    }
                }
            }
        }

    }


    
}

    