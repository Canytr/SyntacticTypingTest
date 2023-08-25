import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Layouts 1.11
import QtQuick.Controls 2.5
import QtQuick.Dialogs 6.2


Item{

    id:editorItem
    height: 650

    Rectangle{
        //anchors.fill: parent
        height: 600
        width: 600
        color: "#242424"
    }

    ColumnLayout{
        id:         editorColumnLayout
        width:      editorRectangle.width
    
    //Menu Bar
    Row {
    spacing: 5
    //x: 150
    //y: 40   

    Button{
        id: openButton
        text:"Open"
        background: Rectangle { color: "blue" ; radius: 5}
        palette.buttonText: "white"
        font.pixelSize: 24
        onClicked: {
            fileDialog.open()
        }   
    }
    Button {
        id: saveButton
        text: "Save"
        background: Rectangle { color: "blue" ; radius: 5}
        palette.buttonText: "white"
        font.pixelSize: 24
        onClicked: {
            var filePath = fileDialog.currentFile;
            var content = textArea.text;
            writeFile(filePath, content);
        }
    }
    Button{
        id: clearButton
        text:"Clear"
        background: Rectangle { color: "blue" ; radius: 5}
        palette.buttonText: "white"
        font.pixelSize: 24
        onClicked: {
            textArea.text = "";
        }   
    }
    TextField {
        id: inputField
        height: openButton.height
        width: 390  // change later
        placeholderText: "File Directory"
        color: "black"
        text: fileDialog.file
        font.pixelSize: 20
    }
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
                    color: "blue"
                    opacity: 0.2
                    y: textArea.cursorRectangle.y
                    visible: textArea.activeFocus
                }
                }
        }
    }

    }

    
    Rectangle{
        id: typingRectangle  
        y:700
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

    function readFile(filePath) {
        var file = new XMLHttpRequest();
        file.open("GET", filePath, false);
        file.send(null);

        if (file.status === 200 || file.status === 0) {
            return file.responseText;
        }

        return "";
    }

    function writeFile(filePath, content) {
        var file = new XMLHttpRequest();
        file.open("PUT", filePath, true);
        //file.setRequestHeader("Content-Type", "text/plain");
        file.send(content);
        return file.status;
    }

    FileDialog{
        id: fileDialog
        title: "Open File"
        currentFile: textArea.text
        nameFilters: ["All files (*)"]
        onAccepted:{
            console.log("onAccepted triggered");
            console.log(this.currentFile)
            inputField.text = this.currentFile
            textArea.text = editorItem.readFile(this.currentFile); 
        }


    }
}

    