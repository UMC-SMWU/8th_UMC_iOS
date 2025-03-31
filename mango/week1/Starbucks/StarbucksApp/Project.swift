import ProjectDescription

let project = Project(
    name: "StarbucksApp",
    targets: [
        .target(
            name: "StarbucksApp",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.StarbucksApp",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: ["StarbucksApp/Sources/**"],
            resources: ["StarbucksApp/Resources/**"],
            dependencies: []
        ),
        .target(
            name: "StarbucksAppTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.StarbucksAppTests",
            infoPlist: .default,
            sources: ["StarbucksApp/Tests/**"],
            resources: [],
            dependencies: [.target(name: "StarbucksApp")]
        ),
    ]
)
