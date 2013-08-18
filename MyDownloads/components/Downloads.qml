import QtQuick 2.0
import Ubuntu.Components 0.1
import Ubuntu.Components.Popups 0.1
import Ubuntu.Components.ListItems 0.1 as ListItem

Page {
    id: root
    title: "My Downloads!"

    ListModel {
        id: downloadsModel
        ListElement {
            link: ""
            image: ""
            completed: false
            filename: ""
        }
    }

    Component.onCompleted: downloadsModel.clear();

    Component {
         id: dialog
         Dialog {
             id: dialogue
             title: i18n.tr("Add Download Link")
             text: i18n.tr("Enter a link or paste it from the clipboard")

             TextField {
                 id: textField
             }

             Row {
                 id: rowButtons
                 spacing: units.gu(4)
                 Button {
                     text: i18n.tr("Paste")
                     color: UbuntuColors.lightAubergine
                     onClicked: {
                         textField.text = Clipboard.data.text;
                     }
                 }
                 Button {
                     text: i18n.tr("Download")
                     color: UbuntuColors.orange
                     onClicked: {
                        //
                        PopupUtils.close(dialogue);
                     }
                 }
             }
         }
    }

    Column {
        id: col
        anchors.fill: parent
        anchors.margins: units.gu(2)
        spacing: units.gu(2)
        Button {
            id: button
            text: i18n.tr("Add Download Link")
            anchors {
                right: parent.right
                margins: units.gu(2)
            }

            onClicked: PopupUtils.open(dialog);
        }
        
        ListView {
            id: list
            height: col.height - button.height - col.spacing
            anchors {
                left: parent.left
                right: parent.right
            }
            clip: true

            model: downloadsModel
            delegate: ListItem.Subtitled {
                id: item
                progression: true
                removable: true
                text: "Diego"
                subText: "aasdasdsad"
                icon: Qt.resolvedUrl(image)

                property bool downloadComplete: completed

                UbuntuShape {
                    id: indicator
                    color: "lightgreen"
                    anchors {
                        top: parent.top
                        right: parent.right
                        margins: units.gu(1)
                    }
                    height: parent.height - (anchors.margins * 2)
                    width: height
                    visible: item.downloadComplete

                    Image {
                        anchors.fill: parent
                        source: "../img/check.png"
                        fillMode: Image.PreserveAspectFit
                    }
                }

                ActivityIndicator {
                    id: activity
                    running: true
                    anchors {
                        top: parent.top
                        right: parent.right
                        margins: units.gu(1)
                    }
                    height: parent.height - (anchors.margins * 2)
                    width: height
                    visible: !item.downloadComplete
                }

                onDownloadCompleteChanged: {
                    //
                }

                onClicked: {
                    //
                }

                onPressAndHold: {
                    //
                }

                onItemRemoved: {
                    button.text = "borrado"
                }
            }
        }
        
    }
}
