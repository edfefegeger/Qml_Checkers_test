import qbs

CppApplication {
    Depends { name: "Qt"; submodules: ["core","quick"] }

    install: true

    // Additional import path used to resolve QML modules in Qt Creator's code model
    property pathList qmlImportPaths: ["Components/"]

    cpp.defines: [
        // You can make your code fail to compile if it uses deprecated APIs.
        // In order to do so, uncomment the following line.
        //"QT_DISABLE_DEPRECATED_BEFORE=0x060000" // disables all the APIs deprecated before Qt 6.0.0
    ]

    files: [
        "Models/mymodel.cpp",
        "Models/mymodel.h",
        "main.cpp",
        "pawn-chess-piece-outline-svgrepo-com.svg",
        "qml.qrc",
        "main.qml",
    ]
}
