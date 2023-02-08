import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Ubuntu.Components.Popups 1.3
import Ubuntu.Components 1.3 as UT
import "components/settingspage"

Dialog {
    id: settingsDialog

    title: i18n.tr("Argenta settings")

         Component.onCompleted: {
            zoomSelector.selectedIndex = appSettings.selectedIndex
            languageSelector.selectedIndex = appSettings.selectedLanguageIndex
        }

        UT.OptionSelector {
            id: zoomSelector
            expanded: true
            anchors.horizontalCenter: parent.horizontalCenter
            model: [i18n.tr("Small"),i18n.tr("Normal"),i18n.tr("Large")]
            onSelectedIndexChanged: {
                switch(zoomSelector.selectedIndex) {
                case 0: {
                    webview.zoomFactor = 1.25
                    appSettings.argentaZoomFactor = 1.25
                    appSettings.selectedIndex = 0
                    webview.zoomFactor = 1.25
                    break;
                }
                case 1: {
                    webview.zoomFactor = 2.20
                    appSettings.argentaZoomFactor = 2.20
                    appSettings.selectedIndex = 1
                    webview.zoomFactor = 2.20
                    break;
                }
                case 2: {
                    webview.zoomFactor = 2.75
                    appSettings.argentaZoomFactor = 2.75
                    appSettings.selectedIndex = 2
                    webview.zoomFactor = 2.75
                    break;
                }
                }
            }
        }        

        UT.OptionSelector {
            id: languageSelector
            expanded: true
            anchors.horizontalCenter: parent.horizontalCenter
            model: [i18n.tr("French"),i18n.tr("Dutch")]
            onSelectedIndexChanged: {
                switch(languageSelector.selectedIndex) {
                case 0: {
                    webview.url = "https://homebank.argenta.be/webapp/fr"
                    appSettings.selectedLanguageIndex = 0
                    appSettings.selectedLanguage = "fr"
                    break;
                }
                case 1: {
                    webview.url = "https://homebank.argenta.be/webapp/nl"
                    appSettings.selectedLanguageIndex = 1
                    appSettings.selectedLanguage = "nl"
                    break;
                }
                }
            }
        }
            
            Button {
                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                text: i18n.tr('Close')
                onClicked: PopupUtils.close(settingsDialog)
            }
        }  
