import QtQuick 2.0
import Ubuntu.Components 0.1
import "components"

/*!
    \brief MainView with Tabs element.
           First Tab has a single Label and
           second Tab has a single ToolbarAction.
*/

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "MyDownloads"
    
    // Note! applicationName needs to match the .desktop filename 
    applicationName: "MyDownloads"
    
    /* 
     This property enables the application to change orientation 
     when the device is rotated. The default is false.
    */
    automaticOrientation: true
    backgroundColor: "#33363b"
    
    width: units.gu(100)
    height: units.gu(75)

    PageStack {
        id: stack

        Component.onCompleted: {
            var dic = {"email": 'nataliabidart+0@gmail.com', "password": '1234567U', "token_name": 'mydownloads'};
            var sso_service = 'https://login.staging.ubuntu.com/'
            var sso_api = sso_service + 'api/v2/'

            var doc = new XMLHttpRequest();
            doc.onreadystatechange = function() {
                if (doc.readyState == XMLHttpRequest.DONE) {
//                    var result = JSON.parse(doc.responseText);
                    console.log(doc.responseText);
                    console.log("\n\n");
//                    console.log(result);
//                    callback(result);
                }
            }

            var url = sso_api + "tokens/oauth";

            doc.open("post", url);
            doc.setRequestHeader("Content-Encoding", "UTF-8");
            doc.setRequestHeader("Content-Type", "application/json");
            doc.send(JSON.stringify(dic));

            stack.push(login);
        }

        Login {
            id: login
            visible: false

            onLogin: stack.push(downloads);
        }

        Downloads {
            id: downloads
            visible: false
        }
    }

}
