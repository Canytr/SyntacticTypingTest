import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Layouts 1.11
import QtQuick.Controls 2.5
import QtQuick.Dialogs 6.2


Item{

    id:editorItem
    //height: 650

    //Editor
    Rectangle{
        id: editorRectangle
        height: 550
        width:  1000
        color: "black"
        
        ScrollView {
            id: view
            width: 600
            anchors.fill: parent        
            ScrollBar.vertical.policy: ScrollBar.AsNeeded
            ScrollBar.horizontal.policy: ScrollBar.AsNeeded

            TextArea {
                id: textArea
                height: 550
                width: 1000
                //placeholderText: qsTr("Enter description")
                text: "Record sightings of Asian hornets are raising fears of catastrophic consequences for the UK's bee populations for years to come.\n
                       The invasive hornets are wreaking havoc in mainland Europe and threaten to get a foothold in the UK, with nests found in East Sussex, Kent, Devon and Dorset.\n
                       The insects feed on native bees and wasps, damaging biodiversity.\n
                       The warning comes as leading scientists release a global report into the threats caused by invasive species.\n
                       They say the alien invaders play a role in 60% of animal and plant extinctions.\n
                       And the economic costs have risen to more than £300bn ($380bn) a year across the world.\n"

                font.pixelSize: 25
                color: "white"
                readOnly: true 
                onCursorPositionChanged: {
                        cursorHighlight.y = cursorRectangle.y
                }
                Keys.onPressed: {
                        cursorHighlight.y = cursorRectangle.y
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

    
}

    