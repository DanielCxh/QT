import QtQuick 2.0

Loader{
    id: root

   // source:"http://localhost:9000/Network.qml"
    source:"https://github.com/DanielCxh/QT/blob/master/Demo0925/Demo0925.qml/raw"

    onLoaded:{
        root.width = item.width;
        root.height = item.height;
    }
}
